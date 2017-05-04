using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lessonweb.Data;

namespace lessonweb.web
{
    public partial class PGUpdateCourse : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected AppUser mStudent= null;
        protected FAACert mCourse = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            mUser = dashboard.getUserFromSessionOrCookie(Request, Session);
            if (mUser == null)
            {
                Response.Redirect("login.aspx");
                Response.Close();
                return;
            }

            String studentid = Request.Params["student"];
            String certid = Request.Params["certid"];
            if (String.IsNullOrEmpty(certid))
            {
                Response.Redirect("dashboard.aspx");
                Response.Close();
                return;
            }

            mCourse = FAACert.getCert(certid);
            if (mCourse == null)
            {
                Response.Redirect("dashboard.aspx");
                Response.Close();
                return;
            }

            if (!String.IsNullOrEmpty(studentid))
            {
                mStudent = AppUser.getUser(studentid);
                if (mStudent == null)
                {
                    studentid = null;
                }
            }

            if (mStudent == null || (mUser.IsRestrictedUser() && mStudent.UserEmail != mUser.UserEmail))
            {
                Response.Redirect("dashboard.aspx");
                Response.Close();
                return;
            }
            ExtractAndSaveSelections();
            Response.Redirect("showcourse.aspx?certid="+certid+"&student="+studentid);
            Response.Close();
            return;

        }

        private void ExtractAndSaveSelections()
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            List<int> LessonsWithLogs = new List<int>();
            List<string> selectedCourses = new List<string>();
            foreach (string s in Request.Params.Keys)
            {
                if (s.StartsWith("CHK-"))
                {
                    if (Request.Params[s] == "on")
                    {
                        selectedCourses.Add(s);
                    }
                }
                else if (s.StartsWith("TIMELOG-"))
                {
                    String val = Request.Params[s];
                    if (!String.IsNullOrEmpty(val)) {
                        try
                        {
                            decimal decval = Decimal.Parse(val);
                            String[] comps = s.Split(new char[] { '-' });
                            // second part describes the field, and third part is the lesson id
                            if (comps.Length == 4)
                            {
                                int lessonID = int.Parse(comps[2]);
                                int stageID = int.Parse(comps[3]);
                                if (!LessonsWithLogs.Contains(lessonID)) { LessonsWithLogs.Add(lessonID); }
                            }
                        }
                        catch { }
                    }
                }
            }
            foreach (int i in LessonsWithLogs) {
                ProcessTimeLogging(dbc, i);
            }

            // now delete every course thats not in this list
            // insert courses that are in the list but not in the database
            // first get the list of existing courses for this student.
            IEnumerable<CompletionLog> log = CompletionLog.LoadStudentLog(dbc, mStudent.UserEmail);

            foreach (CompletionLog l in log)
            {
                bool bFound = false;
                // check which items are not in the new list, these are to be deleted
                foreach(string s in selectedCourses)
                {
                    string logid = s.Substring(4); // skip the first 4 chars 
                    if (logid == l.LessonGUID)
                    {
                        bFound = true;  // log needs to stay
                        break;
                    }
                }
                if (!bFound)
                {
                    //log needs to be deleted
                    dbc.CompletionLogs.DeleteOnSubmit(l);
                }
            }

            foreach (string s in selectedCourses)
            {
                string logid = s.Substring(4); // skip the first 4 chars 
                bool bFound = false;
                // check which items are not in the old list, these are to be added
                foreach (CompletionLog l in log)
                {
                    if (logid == l.LessonGUID)
                    {
                        bFound = true;  // log needs to stay
                        break;
                    }
                }
                if (!bFound)
                {
                    //a new entry needs to be added
                    CompletionLog cl = new CompletionLog();
                    cl.AircraftUsed = null;
                    cl.DateCompleted = DateTime.Now;
                    cl.Instructor = mUser.UserEmail;
                    cl.LessonGUID = logid;
                    cl.SetLessonAndStage(cl.LessonGUID);
                    cl.Student = mStudent.UserEmail;
                    dbc.CompletionLogs.InsertOnSubmit(cl);
                }
            }

            dbc.SubmitChanges();
        }

        private void ProcessTimeLogging(DBClassesDataContext dbc, int lessonid)
        {
            IEnumerable<LessonTimeLog> logs = LessonTimeLog.LoadStudentLog(dbc, mStudent.UserEmail);
            LessonTimeLog logToUpdate = null;
            // first get the lesson or generate a new one.
            foreach (LessonTimeLog log in logs)
            {
                if (log.LESSONID == lessonid)
                {
                    logToUpdate = log;
                    break;
                }
            }
            if (logToUpdate == null)
            {
                logToUpdate = new LessonTimeLog();
                dbc.LessonTimeLogs.InsertOnSubmit(logToUpdate);
                logToUpdate.Instructor = mUser.UserEmail;
                logToUpdate.LESSONID = lessonid;
                logToUpdate.Student = mStudent.UserEmail;
            }

            // get the different available fields.
            foreach (string s in Request.Params.Keys)
            {
                if (!s.StartsWith("TIMELOG-")) continue;
                String[] comps = s.Split(new char[] { '-' });
                // second part describes the field, and third part is the lesson id
                if (comps.Length == 4)
                {
                    int lessonIDFld = int.Parse(comps[2]);
                    int stageID = int.Parse(comps[3]);
                    if (lessonid != lessonIDFld) continue;

                    logToUpdate.Instructor = mUser.UserEmail;
                    logToUpdate.PerformedOn = DateTime.Now;

                    logToUpdate.STAGEID = stageID;
                    decimal val = Decimal.Parse(Request.Params[s]);
                    if (comps[1] == "briefing") logToUpdate.briefing = val;
                    if (comps[1] == "classvideo") logToUpdate.classvideo = val;
                    if (comps[1] == "exams") logToUpdate.exams = val;
                    if (comps[1] == "debrief") logToUpdate.debrief = val;
                    if (comps[1] == "duallocalday") logToUpdate.duallocalday = val;
                    if (comps[1] == "dualccday") logToUpdate.dualccday = val;
                    if (comps[1] == "duallocalnight") logToUpdate.duallocalnight = val;
                    if (comps[1] == "dualccnight") logToUpdate.dualccnight = val;
                    if (comps[1] == "sololocalday") logToUpdate.sololocalday = val;
                    if (comps[1] == "soloccday") logToUpdate.soloccday = val;
                }
            }
        }
    }
}