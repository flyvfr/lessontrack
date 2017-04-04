using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public class LessonLog
    {
        public List<LessonLogItem> mLog = new List<LessonLogItem>();

        public static List<LessonLogItem> GetLatest(int count)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<CompletionLog> lst = (from s in dbc.CompletionLogs
                                              orderby s.DateCompleted descending
                                              select s);
            LessonLog lessonlog = new LessonLog();
            foreach (CompletionLog log in lst)
            {
                if (lessonlog.AddLogItem(dbc, log) > count) break;
            }
            return lessonlog.mLog;
        }

        public static List<LessonLogItem> GetLatestForStudent(int count, string studentid)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<CompletionLog> lst = (from s in dbc.CompletionLogs
                                              where s.Student == studentid
                                              orderby s.DateCompleted descending
                                              select s);
            LessonLog lessonlog = new LessonLog();
            foreach (CompletionLog log in lst)
            {
                if (lessonlog.AddLogItem(dbc, log) > count) break;
            }
            return lessonlog.mLog;
        }


        public int AddLogItem(DBClassesDataContext dbc, CompletionLog compLog)
        {
            // is there a record of this user performing this lesson ?
            bool bFound = false;
            foreach (LessonLogItem lli in mLog)
            {
                if (lli.StudentID == compLog.Student && lli.LessonID == compLog.LESSONID)
                {
                    bFound = true;
                    break;
                }
            }
            if (!bFound)
            {
                LessonLogItem log = new LessonLogItem();
                log.DoneOn = compLog.DateCompleted;
                log.InstructorID = compLog.Instructor;
                log.InstructorName = AppUser.getUser(compLog.Instructor).GetFullName();
                log.StudentID = compLog.Student;
                log.StudentName = AppUser.getUser(compLog.Student).GetFullName();
                log.LessonID = compLog.LESSONID;
                log.LessonName = LESSON.GetLesson(dbc, compLog.LESSONID).Title;
                log.StageID = compLog.STAGEID;
                log.StageName = STAGE.GetStage(dbc, compLog.STAGEID).Name;

                // Update flight hours for this lesson for this student
                log.UpdateFlightHours(dbc);

                mLog.Add(log);
            }

            return mLog.Count;
        }

        /*
        public int AddLogItem(DBClassesDataContext dbc, LessonTimeLog compLog)
        {
            LessonLogItem log = null;

            // is there a record of this user performing this lesson ?
            foreach (LessonLogItem lli in mLog)
            {
                if (lli.StudentID == compLog.Student && lli.LessonID == compLog.LESSONID)
                {
                    log = lli;
                    break;
                }
            }
            if (log == null)
            {
                log = new LessonLogItem();
                log.DoneOn = compLog.PerformedOn;
                log.InstructorID = compLog.Instructor;
                log.InstructorName = AppUser.getUser(compLog.Instructor).GetFullName();
                log.StudentID = compLog.Student;
                log.StudentName = AppUser.getUser(compLog.Student).GetFullName();
                log.LessonID = compLog.LESSONID;
                log.LessonName = LESSON.GetLesson(dbc, compLog.LESSONID).Title;
                log.StageID = compLog.STAGEID;
                log.StageName = STAGE.GetStage(dbc, compLog.STAGEID).Name;
                mLog.Add(log);
            }
            // Now fill the hours..
            log.HoursLogged = 0;
            log.GroundHoursLogged = 0;
            log.GroundHoursLogged += compLog.briefing;
            log.GroundHoursLogged += compLog.classvideo;
            log.GroundHoursLogged += compLog.debrief;
            log.HoursLogged += compLog.dualccday;
            log.HoursLogged += compLog.dualccnight;
            log.HoursLogged += compLog.duallocalday;
            log.HoursLogged += compLog.duallocalnight;
            log.GroundHoursLogged += compLog.exams;
            log.HoursLogged += compLog.soloccday;
            log.HoursLogged += compLog.soloccnight;
            log.HoursLogged += compLog.sololocalday;
            log.HoursLogged += compLog.sololocalnight;

            return mLog.Count; 
        }*/

    }
}