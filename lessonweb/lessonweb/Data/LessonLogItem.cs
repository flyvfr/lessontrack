using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public class LessonLogItem
    {
        public DateTime DoneOn;
        public string   StageName;
        public int   StageID;
        public string   LessonName;
        public int   LessonID;
        public string   StudentName;
        public string   StudentID;
        public string   InstructorID;
        public string   InstructorName;
        public decimal  HoursLogged;
        public decimal  GroundHoursLogged;

        internal void UpdateFlightHours(DBClassesDataContext dbc)
        {
            IEnumerable<LessonTimeLog> lst = (from s in dbc.LessonTimeLogs
                                              where s.Student == StudentID && s.LESSONID == LessonID
                                              select s);
            foreach (LessonTimeLog compLog in lst)
            {
                // Now fill the hours..
                HoursLogged = 0;
                GroundHoursLogged = 0;
                GroundHoursLogged += compLog.briefing;
                GroundHoursLogged += compLog.classvideo;
                GroundHoursLogged += compLog.debrief;
                HoursLogged += compLog.dualccday;
                HoursLogged += compLog.dualccnight;
                HoursLogged += compLog.duallocalday;
                HoursLogged += compLog.duallocalnight;
                GroundHoursLogged += compLog.exams;
                HoursLogged += compLog.soloccday;
                HoursLogged += compLog.soloccnight;
                HoursLogged += compLog.sololocalday;
                HoursLogged += compLog.sololocalnight;
            }
        }
    }
}