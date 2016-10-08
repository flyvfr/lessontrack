using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class FAACert
    {

        public List<STAGE> mStages;
        public bool IsComplete = false; // incomplete by default
        public bool IsStarted = false; // unstarted by default

        // if the user exists and is valid, return the user, else return null
        internal static FAACert getCert(string cert)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            FAACert ac = (from u in dbc.FAACerts
                          where u.CertificationID == cert
                          select u).SingleOrDefault();
            return ac;
        }

        public void LoadStages(string optionalStudent)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<STAGE> lst = from s in dbc.STAGEs
                       where s.CertificationID == CertificationID
                     select s;

            mStages = new List<STAGE>();
            foreach (STAGE l in lst)
            {
                mStages.Add(l);
            }
            IsComplete = true;

            foreach (STAGE stg in mStages)
            {
                stg.LoadLessons(dbc);
                // if student is specified, load his completion status
                if (!String.IsNullOrEmpty(optionalStudent))
                {
                    IEnumerable<CompletionLog> log = CompletionLog.LoadStudentLog(dbc, optionalStudent);
                    List<CompletionLog> logcopy = new List<CompletionLog>();
                    foreach (CompletionLog l in log)
                    {
                        logcopy.Add(l);
                    }

                    IEnumerable<LessonTimeLog> timelog = LessonTimeLog.LoadStudentLog(dbc, optionalStudent);
                    List<LessonTimeLog> timelogcopy = new List<LessonTimeLog>();
                    foreach (LessonTimeLog l in timelog)
                    {
                        timelogcopy.Add(l);
                    }
                    stg.LoadStudentStatus(timelogcopy, logcopy, optionalStudent);
                }
                if (stg.IsAllStarted)
                {
                    IsStarted = true;
                }
                if (!stg.IsAllComplete)
                {
                    IsComplete = false;
                }
            }
        }


    }
}