using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class PilotClass
    {
        // if the user exists and is valid, return the user, else return null
        public static ArrayList getPilotClassesForPilot(String pilotid)
        {
            ArrayList classes = new ArrayList();
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                IEnumerable<PilotClass> ach = (from u in dbc.PilotClasses
                                                     where u.PilotEmail == pilotid
                                                      select u);
                foreach (PilotClass pc in ach)
                {
                    PilotClassDefinition pcd = PilotClassDefinition.getPilotClassDefinition(pc.PilotClassID);
                    if (pcd != null)
                    {
                        classes.Add(pcd);
                    }
                }
            }
            return classes;
        }

        /// <summary>
        /// Get the date when pilot class was achieved
        /// </summary>
        /// <param name="classid"></param>
        /// <param name="user"></param>
        /// <returns></returns>
        public static DateTime WhenAchieved(Guid classid, String user)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                PilotClass ach = (from u in dbc.PilotClasses
                                               where u.PilotEmail == user && u.PilotClassID==classid
                                               select u).SingleOrDefault();
                if (ach != null)
                {
                    return ach.DateCompleted;
                }
            }
            return DateTime.MinValue;
        }

    }
}