using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class RewardPrereq
    {
        // if the user exists and is valid, return the user, else return null
        public static IEnumerable<RewardPrereq> getPrereqs(Guid rewardID)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                IEnumerable<RewardPrereq> ach = (from u in dbc.RewardPrereqs
                                                     where u.RewardID == rewardID
                                                      select u);

                return ach.ToList();
            }
        }


        // if the user exists and is valid, return the user, else return null
        public static IEnumerable<Guid> getRewardsForPrereqAchievement(Guid achid)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<Guid> ach = (from u in dbc.RewardPrereqs
                                     where u.RequiredAchievement== achid
                                     select u.RewardID);

            return ach;
        }
    }
}