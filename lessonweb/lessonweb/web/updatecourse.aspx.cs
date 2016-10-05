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
            mUser = (AppUser)Session[Constants.SESS_KEY_USER];
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

            if (mStudent == null)
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
            List<string> selectedCourses = new List<string>();
            foreach(string s in Request.Params.Keys)
            {
                if (s.StartsWith("CHK-"))
                {
                    if (Request.Params[s] == "on")
                    {
                        selectedCourses.Add(s);
                    }
                }
            }

            // now delete every course thats not in this list
            // insert courses that are in the list but not in the database
            // first get the list of existing courses for this student.
            DBClassesDataContext dbc = new DBClassesDataContext();
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
                    cl.Student = mStudent.UserEmail;
                    dbc.CompletionLogs.InsertOnSubmit(cl);
                }
            }

            dbc.SubmitChanges();
        }


    }
}