using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class FAACert
    {

        public IEnumerable<STAGE> mStages;
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
            mStages = from s in dbc.STAGEs
                       where s.CertificationID == CertificationID
                     select s;

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

                    stg.LoadStudentStatus(logcopy, optionalStudent);
                }
                if (stg.IsStarted)
                {
                    IsStarted = true;
                }
                if (!stg.IsComplete)
                {
                    IsComplete = false;
                }
            }
        }


    }
}