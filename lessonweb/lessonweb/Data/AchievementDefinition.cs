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

            return ach.ToList();
        }

        internal static void delete(Guid achID)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                // first remove any prereq involving this achievement
                IEnumerable<AchievementPrereq> achPrereqs = (from u in dbc.AchievementPrereqs where u.RequiredAchievementID == achID select u);
                dbc.AchievementPrereqs.DeleteAllOnSubmit(achPrereqs);

                // first remove any prereq involving this achievement
                IEnumerable<RewardPrereq> rewPrereqs = (from u in dbc.RewardPrereqs where u.RequiredAchievement == achID select u);
                dbc.RewardPrereqs.DeleteAllOnSubmit(rewPrereqs);

                // first remove any prereq involving this achievement
                IEnumerable<PilotClassPrereq> pcPrereqs = (from u in dbc.PilotClassPrereqs where u.AchievementID == achID select u);
                dbc.PilotClassPrereqs.DeleteAllOnSubmit(pcPrereqs);

                AchievementDefinition ach = (from u in dbc.AchievementDefinitions
                                      where u.AchievementID == achID
                                      select u).SingleOrDefault();
                if (ach != null)
                {
                    dbc.AchievementDefinitions.DeleteOnSubmit(ach);
                    dbc.SubmitChanges();
                }
            }
        }
    }
}