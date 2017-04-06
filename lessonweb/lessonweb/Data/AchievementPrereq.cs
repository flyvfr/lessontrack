using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class AchievementPrereq
    {
        // if the user exists and is valid, return the user, else return null
        internal static IEnumerable<AchievementPrereq> getPrereqsForAchievement(Guid achid)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<AchievementPrereq> ach = (from u in dbc.AchievementPrereqs
                                         where u.AchievementID == achid
                                         select u);

            return ach;
        }

        // if the user exists and is valid, return the user, else return null
        internal static IEnumerable<Guid> getAchievementsForPrereqTask(Guid taskid)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<Guid> ach = (from u in dbc.AchievementPrereqs
                                                  where u.TaskID == taskid
                                                  select u.AchievementID);

            return ach;
        }

        // if the user exists and is valid, return the user, else return null
        internal static IEnumerable<Guid> getAchievementsForPrereqAchievement(Guid achid)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<Guid> ach = (from u in dbc.AchievementPrereqs
                                     where u.RequiredAchievementID == achid
                                     select u.AchievementID);

            return ach;
        }
    }
}