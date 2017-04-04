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
        public bool IsTimesComplete = false; // incomplete by default
        public bool IsTimesStarted = false;
        public bool IsAllComplete = false; // incomplete by default
        public bool IsAllStarted = false; // unstarted by default

        public decimal Loggedduallocalday = 0.0M;
        public decimal Loggeddualccday = 0.0M;
        public decimal Loggedduallocalnight = 0.0M;
        public decimal Loggeddualccnight = 0.0M;
        public decimal Loggedsololocalday = 0.0M;
        public decimal Loggedsoloccday = 0.0M;
        public decimal Loggedsololocalnight = 0.0M;
        public decimal Loggedsoloccnight = 0.0M;
        public decimal Loggedbriefing = 0.0M;
        public decimal Loggedclassvideo = 0.0M;
        public decimal Loggedexams = 0.0M;
        public decimal Loggeddebrief = 0.0M;

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

        public static LESSON GetLesson(DBClassesDataContext dbc, int lid)
        {
            LESSON li = (from l in dbc.LESSONs
                         where l.LESSONID == lid
                         select l).SingleOrDefault();
            return li;
        }

        /**
 * load the completion status of all items for this student
 */
        public void LoadStudentStatus(IEnumerable<LessonTimeLog> timelog, IEnumerable<CompletionLog> log, string studentID)
        {
            // Load the cumulative times logged for this student for this lesson
            LessonTimeLog.PopulateTotalTimesForLesson(timelog, studentID, this);

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

            IsTimesStarted = false;   
            // now check the time logs to update if the lesson is started or completed
            if (Loggedbriefing>0 || Loggedclassvideo>0 || Loggeddebrief>0||Loggeddualccday>0||Loggeddualccnight>0||Loggedduallocalday>0||Loggedduallocalnight>0||Loggedexams>0||Loggedsoloccday>0|| Loggedsoloccnight > 0 || Loggedsololocalday > 0 || Loggedsololocalnight > 0)
            {
                IsTimesStarted = true;   // some time has been logged, so started
            }

            IsTimesComplete = true;   
            if (Loggedbriefing<(decimal)briefing|| Loggedclassvideo < (decimal)classvideo || Loggeddebrief < (decimal)debrief || 
                Loggeddualccday < (decimal)dualccday|| Loggeddualccnight < (decimal)dualccnight || Loggedduallocalday < (decimal)duallocalday|| Loggedduallocalnight < (decimal)duallocalnight
                || Loggedexams < (decimal)exams || Loggedsoloccday < (decimal)soloccday || Loggedsoloccnight < (decimal)soloccnight || Loggedsololocalday < (decimal)sololocalday
                || Loggedsololocalnight < (decimal)sololocalnight)
            {
                IsTimesComplete = false;   // Times logged is less than times 
            }
            IsAllComplete = IsComplete && IsTimesComplete; // incomplete by default
            IsAllStarted = IsStarted || IsTimesStarted; // unstarted by default
        }

        public string GetReportLines()
        {
            if (!IsAllStarted) return "<tr class='danger'><td colspan='4'>" + Title + " (Not Started)</td></tr>\n"; ;

            String s = "<tr class='warning'><td colspan='4'>" + Title+ "</td></tr>\n";
            // now log the times in a smaller table
            String timesStr = "<tr class='warning'><td/><td>" + getTimeLogLines() + "</td><td colspan='2'/></tr>\n";
            // now make a table of all the times completed

            s += timesStr;

            foreach (LESSONITEM less in LessonItems)
            {
                s += less.GetReportLines();
            }
            return s;
        }

        private string getTimeLogLines()
        {
            String s = "<table class='table table-condensed'>" +
            "<thead class='header'>" +
                "<tr class='warning'>" +
                    "<th style = 'width:40%' >Time</ th >" +
                    "<th style='width:20%'>Required</th>" +
                    "<th style = 'width:20%' >Completed</th>" +
                    "<th style = 'width:20%' >Remaining</th>" +
                "</tr></thead><tbody>";

            // now log each time
            if (briefing > 0.0M)
            {
                s += STAGE.MakeTimeLogLine("Briefing", briefing, Loggedbriefing, (briefing - Loggedbriefing));
            }
            if (classvideo > 0.0M)
            {
                s += STAGE.MakeTimeLogLine("Class / Video", classvideo, Loggedclassvideo, (classvideo - Loggedclassvideo));
            }
            if (exams > 0.0M)
            {
                s += STAGE.MakeTimeLogLine("Exams", exams, Loggedexams, (exams - Loggedexams));
            }
            if (debrief > 0.0M)
            {
                s += STAGE.MakeTimeLogLine("Debrief", debrief, Loggeddebrief, (debrief - Loggeddebrief));
            }
            if (duallocalday > 0.0M)
            {
                s += STAGE.MakeTimeLogLine("Dual Day", duallocalday, Loggedduallocalday, (duallocalday - Loggedduallocalday));
            }
            if (duallocalnight > 0.0M)
            {
                s += STAGE.MakeTimeLogLine("Dual Night", duallocalnight, Loggedduallocalnight, (duallocalnight - Loggedduallocalnight));
            }
            if (dualccday > 0.0M)
            {
                s += STAGE.MakeTimeLogLine("Dual Day CC", dualccday, Loggeddualccday, (dualccday - Loggeddualccday));
            }
            if (dualccnight > 0.0M)
            {
                s += STAGE.MakeTimeLogLine("Dual Night CC", dualccnight, Loggeddualccnight, (dualccnight - Loggeddualccnight));
            }
            if (sololocalday > 0.0M)
            {
                s += STAGE.MakeTimeLogLine("Solo Local", sololocalday, Loggedsololocalday, (sololocalday - Loggedsololocalday));
            }
            if (soloccday > 0.0M)
            {
                s += STAGE.MakeTimeLogLine("Solo CC", soloccday, Loggedsoloccday, (soloccday - Loggedsoloccday));
            }

            s += "</tbody></table>";

            return s;
        }

    }
}