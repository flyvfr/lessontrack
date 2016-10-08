using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class LessonTimeLog
    {
        /**
         * this method loads all the times logged for this lesson for this student.
         */
        internal static void PopulateTotalTimesForLesson(IEnumerable<LessonTimeLog> timelog, string Student, LESSON lesson)
        {
            foreach(LessonTimeLog log in timelog)
            {
                if (lesson.LESSONID == log.LESSONID)
                {
                    lesson.Loggedbriefing += log.briefing;
                    lesson.Loggedclassvideo+= log.classvideo;
                    lesson.Loggeddebrief += log.debrief;
                    lesson.Loggeddualccday += log.dualccday;
                    lesson.Loggeddualccnight += log.dualccnight;
                    lesson.Loggedduallocalday+= log.duallocalday;
                    lesson.Loggedduallocalnight+= log.duallocalnight;
                    lesson.Loggedexams += log.exams;
                    lesson.Loggedsoloccday+= log.soloccday;
                    lesson.Loggedsoloccnight+= log.soloccnight;
                    lesson.Loggedsololocalday+= log.sololocalday;
                    lesson.Loggedsololocalnight += log.sololocalnight;
                }
            }
        }


        /**
         * this method loads all the times logged for this STAGE for this student.
         */
        internal static void PopulateTotalTimesForStage(IEnumerable<LessonTimeLog> timelog, string studentID, STAGE stg)
        {
            foreach (LessonTimeLog log in timelog)
            {
                if (stg.STAGEID == log.STAGEID)
                {
                    stg.Loggedbriefing += log.briefing;
                    stg.Loggedclassvideo += log.classvideo;
                    stg.Loggeddebrief += log.debrief;
                    stg.Loggeddualccday += log.dualccday;
                    stg.Loggeddualccnight += log.dualccnight;
                    stg.Loggedduallocalday += log.duallocalday;
                    stg.Loggedduallocalnight += log.duallocalnight;
                    stg.Loggedexams += log.exams;
                    stg.Loggedsoloccday += log.soloccday;
                    stg.Loggedsoloccnight += log.soloccnight;
                    stg.Loggedsololocalday += log.sololocalday;
                    stg.Loggedsololocalnight += log.sololocalnight;
                }
            }
        }

        internal static IEnumerable<LessonTimeLog> LoadStudentLog(DBClassesDataContext dbc, string optionalStudent)
        {
            IEnumerable<LessonTimeLog> log = (from u in dbc.LessonTimeLogs
                                              where (u.Student == optionalStudent)
                                              select u);
            return log;
        }
    }
}