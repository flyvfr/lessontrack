using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class AchievementPrereq
    {
        // if the user exists and is valid, return the user, else return null
        public static IEnumerable<AchievementPrereq> getPrereqsForAchievement(Guid achid)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                IEnumerable<AchievementPrereq> ach = (from u in dbc.AchievementPrereqs
                                                      where u.AchievementID == achid
                                                      select u);

                return ach.ToList();
            }
        }

        public static int getPrereqTypes(IEnumerable<AchievementPrereq> prereqs, out int Achievements)
        {
            int nTasks = 0;
            int nAchs = 0;
            foreach (AchievementPrereq pre in prereqs)
            {
                if (pre.TaskID == null && pre.AchievementID != null)
                {
                    nAchs++;
                }
                else
                {
                    nTasks++;
                }
            }
            Achievements = nAchs;
            return nTasks;
        }

        // if the user exists and is valid, return the user, else return null
        public static IEnumerable<Guid> getAchievementsForPrereqTask(Guid taskid)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<Guid> ach = (from u in dbc.AchievementPrereqs
                                                  where u.TaskID == taskid
                                                  select u.AchievementID);

            return ach;
        }

        // if the user exists and is valid, return the user, else return null
        public static IEnumerable<Guid> getAchievementsForPrereqAchievement(Guid achid)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<Guid> ach = (from u in dbc.AchievementPrereqs
                                     where u.RequiredAchievementID == achid
                                     select u.AchievementID);

            return ach;
        }
    }
}