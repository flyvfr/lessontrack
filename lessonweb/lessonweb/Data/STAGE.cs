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
        public bool IsTimesComplete = false; // incomplete by default
        public bool IsTimesStarted = false; // unstarted by default
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


        public void LoadLessons(DBClassesDataContext dbc)
        {
            IEnumerable < LESSON > lst = from l in dbc.LESSONs
                      where l.STAGEID == STAGEID 
                      orderby l.LESSONID
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
        public void LoadStudentStatus(IEnumerable<LessonTimeLog> timelog, IEnumerable<CompletionLog> log, string studentID)
        {
            foreach (LESSON less in Lessons)
            {
                less.LoadStudentStatus(timelog, log, studentID);
            }
            // Load the cumulative times logged for this student for this lesson
            //LessonTimeLog.PopulateTotalTimesForStage(timelog, studentID, this);

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
                Loggedduallocalday += less.Loggedduallocalday;
                Loggeddualccday += less.Loggeddualccday;
                Loggedduallocalnight += less.Loggedduallocalnight;
                Loggeddualccnight += less.Loggeddualccnight;
                Loggedsololocalday += less.Loggedsololocalday;
                Loggedsoloccday += less.Loggedsoloccday;
                Loggedsololocalnight += less.Loggedsololocalnight;
                Loggedsoloccnight += less.Loggedsoloccnight;
                Loggedbriefing += less.Loggedbriefing;
                Loggedclassvideo += less.Loggedclassvideo;
                Loggedexams += less.Loggedexams;
                Loggeddebrief += less.Loggeddebrief;
            }

            IsTimesStarted = false;
            // now check the time logs to update if the lesson is started or completed
            if (Loggedbriefing > 0 || Loggedclassvideo > 0 || Loggeddebrief > 0 || Loggeddualccday > 0 || Loggeddualccnight > 0 || Loggedduallocalday > 0 || Loggedduallocalnight > 0 || Loggedexams > 0 || Loggedsoloccday > 0 || Loggedsoloccnight > 0 || Loggedsololocalday > 0 || Loggedsololocalnight > 0)
            {
                IsTimesStarted = true;   // some time has been logged, so started
            }

            IsTimesComplete = true;
            if (Loggedbriefing < (decimal)briefing || Loggedclassvideo < (decimal)classvideo || Loggeddebrief < (decimal)debrief ||
                Loggeddualccday < (decimal)dualccday || Loggeddualccnight < (decimal)dualccnight || Loggedduallocalday < (decimal)duallocalday || Loggedduallocalnight < (decimal)duallocalnight
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
            String s = "<tr class='info'><td colspan='4'>" + Name + "</td></tr>\n";
            foreach (LESSON less in Lessons)
            {
                s += less.GetReportLines();
            }
            return s;
        }

    }
}