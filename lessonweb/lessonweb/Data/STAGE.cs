using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class STAGE
    {
        public List<LESSON> Lessons;
        public bool IsComplete = false; // incomplete by default
        public bool IsStarted = false; // unstarted by default

        public void LoadLessons(DBClassesDataContext dbc)
        {
            IEnumerable < LESSON > lst = from l in dbc.LESSONs
                      where l.STAGEID == STAGEID
                      select l;
            Lessons = new List<LESSON>();
            foreach (LESSON l in lst)
            {
                Lessons.Add(l);
            }


            foreach (LESSON les in Lessons)
            {
                les.LoadItems(dbc);
            }
        }

        /**
         * load the completion status of all items for this student
         */
        public void LoadStudentStatus (IEnumerable<CompletionLog> log, string studentID)
        {
            foreach (LESSON less in Lessons)
            {
                less.LoadStudentStatus(log, studentID);
            }

            IsComplete = true;
            foreach (LESSON less in Lessons)
            {
                if (less.IsStarted)
                {
                    IsStarted = true;
                }
                if (!less.IsComplete)
                {
                    IsComplete = false;
                }
            }

        }

        public string GetReportLines()
        {
            String s = "<tr class='info'><td colspan='4'>" + Name + "</td></tr>\n";
            foreach (LESSON less in Lessons)
            {
                s += less.GetReportLines();
            }
            return s;
        }

    }
}