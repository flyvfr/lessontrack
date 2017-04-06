using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class AchievementDefinition
    {
        // if the user exists and is valid, return the user, else return null
        internal static AchievementDefinition getAchievementDefinition(Guid defid)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            AchievementDefinition ach = (from u in dbc.AchievementDefinitions
                                  where u.AchievementID == defid
                                  select u).SingleOrDefault();

            return ach;
        }

        public static IEnumerable<AchievementDefinition> getAll()
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<AchievementDefinition> ach = (from u in dbc.AchievementDefinitions
                                                        select u);

            return ach;
        }
    }
}