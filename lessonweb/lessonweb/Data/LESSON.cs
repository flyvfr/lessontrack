using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class LESSON
    {
        public List<LESSONITEM> LessonItems;
        public bool IsComplete = false; // incomplete by default
        public bool IsStarted = false;
        public void LoadItems(DBClassesDataContext dbc)
        {
            IEnumerable<LESSONITEM> items= from l in dbc.LESSONITEMs
                      where l.LESSONID == LESSONID
                      select l;
            LessonItems = new List<LESSONITEM>();
            foreach (LESSONITEM l in items)
            {
                LessonItems.Add(l);
            }
        }

        /**
 * load the completion status of all items for this student
 */
        public void LoadStudentStatus(IEnumerable<CompletionLog> log, string studentID)
        {
            foreach (LESSONITEM less in LessonItems)
            {
                less.LoadStudentStatus(log, studentID);
            }

            IsComplete = true;
            foreach (LESSONITEM less in LessonItems)
            {
                if (less.IsGroup) continue; // ignore groups

                if (less.IsComplete)
                {
                    IsStarted = true;
                }else{
                    IsComplete = false;
                }
            }
        }

        public string GetReportLines()
        {
            String s = "<tr class='warning'><td colspan='4'>" + Title+ "</td></tr>\n";
            foreach (LESSONITEM less in LessonItems)
            {
                s += less.GetReportLines();
            }
            return s;
        }

    }
}