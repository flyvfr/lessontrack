using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class PilotAchievement
    {
        // if the user exists and is valid, return the user, else return null
        public static ArrayList getAchievementsForPilot(String pilotid)
        {
            ArrayList classes = new ArrayList();
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                IEnumerable<PilotAchievement> ach = (from u in dbc.PilotAchievements
                                               where u.PilotEmail == pilotid
                                                      select u);
                foreach (PilotAchievement pc in ach)
                {
                    AchievementDefinition pcd = AchievementDefinition.getAchievementDefinition(pc.AchievementID);
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
                PilotAchievement ach = (from u in dbc.PilotAchievements
                                  where u.PilotEmail == user && u.AchievementID==classid
                                               select u).SingleOrDefault();
                if (ach != null)
                {
                    return ach.DateCompleted;
                }
            }
            return DateTime.MinValue;
        }

        /// <summary>
        /// if the achievement is already present, ignore, else save a new record with todays date
        /// </summary>
        /// <param name="dc"></param>
        /// <param name="email"></param>
        /// <param name="achievements"></param>
        internal static void saveAchievements(DBClassesDataContext dc, string email, List<Guid> achievements)
        {
            foreach (Guid ach in achievements)
            {
                PilotAchievement pach = (from u in dc.PilotAchievements
                                        where u.PilotEmail == email && u.AchievementID == ach
                                        select u).SingleOrDefault();
                if (pach == null)
                {
                    pach = new PilotAchievement();
                    pach.PilotEmail = email;
                    pach.AchievementID = ach;
                    pach.DateCompleted = DateTime.Now;
                    dc.PilotAchievements.InsertOnSubmit(pach);
                }
            }
        }
    }
}