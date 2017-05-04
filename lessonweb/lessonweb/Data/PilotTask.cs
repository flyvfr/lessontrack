using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class PilotTask
    {
        // if the user exists and is valid, return the user, else return null
        public static ArrayList getTasksForPilot(String pilotid)
        {
            ArrayList tasks = new ArrayList();
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                IEnumerable<PilotTask> ach = (from u in dbc.PilotTasks
                                               where u.PilotEmail == pilotid
                                                      select u);
                foreach (PilotTask pc in ach)
                {
                    TaskDefinition pcd = TaskDefinition.getTaskDefinition(pc.TaskID);
                    if (pcd != null)
                    {
                        tasks.Add(pcd);
                    }
                }
            }
            return tasks;
        }

        // if the user exists and is valid, return the user, else return null
        public static List<Guid> getVerifiedTasksIDsForPilot(String pilotid)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                IEnumerable<Guid> tsks = (from u in dbc.PilotTasks
                                              where u.PilotEmail == pilotid && u.IsVerified == true
                                              select u.TaskID);
              return tsks.ToList();
            }
        }

        internal static List<Guid> GetToDos(string pilotid)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                IEnumerable<Guid> tsks = (from u in dbc.PilotTasks
                                          where u.PilotEmail == pilotid && u.IsCompleted == false
                                          orderby u.DateAdded
                                          select u.TaskID);
                return tsks.ToList();
            }
        }

        /// <summary>
        /// Get the date when pilot class was achieved
        /// </summary>
        /// <param name="classid"></param>
        /// <param name="user"></param>
        /// <returns></returns>
        public static DateTime WhenAchieved(Guid taskid, String user)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                PilotTask ach = (from u in dbc.PilotTasks
                                   where u.PilotEmail == user && u.TaskID== taskid
                                   select u).SingleOrDefault();
                if (ach != null)
                {
                    return ach.DateCompleted ?? DateTime.MinValue;
                }
            }
            return DateTime.MinValue;
        }

        internal static PilotTask GetTask(string userEmail, Guid taskID)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                PilotTask ach = (from u in dbc.PilotTasks
                                 where u.PilotEmail == userEmail && u.TaskID == taskID
                                 select u).SingleOrDefault();
                if (ach != null)
                {
                    return ach;
                }
            }
            return null;
        }
    }
}