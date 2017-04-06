using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class TaskDefinition
    {
        public const int TASK_NONE = 0;
        public const int TASK_MANEUVER = 1;
        public const int TASK_FLIGHTLESSON = 2;
        public const int TASK_GROUNDLESSON = 4;
        public const int TASK_HOURS = 8;
        public const int TASK_AIRPORT = 0x10;
        public const int TASK_PINNACLE = 0x20;


        public const int TASK_DESTINATION = 0x40;
        public const int TASK_CLASS= 0x80;

        // if the user exists and is valid, return the user, else return null
        internal static TaskDefinition getTaskDefinition(Guid defid)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                TaskDefinition tsk = (from u in dbc.TaskDefinitions
                                      where u.TaskID == defid
                                      select u).SingleOrDefault();

                return tsk;
            }
        }

        public static Dictionary<int, String> GetTaskTypeCodes()
        {
            Dictionary<int, String> result = new Dictionary<int, string>();
            result.Add(TASK_AIRPORT, "Airport");
            result.Add(TASK_MANEUVER, "Maneuver");
            result.Add(TASK_FLIGHTLESSON, "Flight Lesson");
            result.Add(TASK_GROUNDLESSON, "Ground Lesson");
            result.Add(TASK_HOURS, "Flight Hours");
            result.Add(TASK_PINNACLE, "Pinnacle");
            result.Add(TASK_DESTINATION, "Destination");
            result.Add(TASK_CLASS, "Class");
            return result;
        }

        public static IEnumerable<TaskDefinition> getAllTaskDefinitions()
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                IEnumerable<TaskDefinition> tasks = (from u in dbc.TaskDefinitions
                                                     select u);

                return tasks.ToList();
            }
        }

        internal static void deleteTask(Guid taskID)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                TaskDefinition tsk = (from u in dbc.TaskDefinitions
                                      where u.TaskID == taskID
                                      select u).SingleOrDefault();
                if (tsk != null)
                {
                    dbc.TaskDefinitions.DeleteOnSubmit(tsk);
                    dbc.SubmitChanges();
                }
            }
        }

        public String GetTaskTypeName()
        {
            Dictionary<int, String> result = GetTaskTypeCodes();
            if (!result.ContainsKey(TaskType)) return "Unknown";
            return GetTaskTypeCodes()[TaskType];
        }

        public String GetTaskDetail()
        {
            switch (TaskType)
            {
                case TASK_AIRPORT: return Airport;
                case TASK_MANEUVER: return Maneuver;
                case TASK_GROUNDLESSON: return Lesson;
                case TASK_FLIGHTLESSON: return Lesson;
                case TASK_HOURS: return Hours.ToString() + " in "+ AircraftType;
                case TASK_PINNACLE: return Detail;
                case TASK_DESTINATION: return Detail;
                case TASK_CLASS: return Course;
            }
            return "Undefined";
        }
    }
}