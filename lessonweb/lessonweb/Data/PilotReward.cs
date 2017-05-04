using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class PilotReward
    {
        // if the user exists and is valid, return the user, else return null
        public static ArrayList getRewardsForPilot(String pilotid)
        {
            ArrayList classes = new ArrayList();
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                IEnumerable<PilotReward> ach = (from u in dbc.PilotRewards
                                               where u.PilotEmail == pilotid
                                                      select u);
                foreach (PilotReward pc in ach)
                {
                    RewardDefinition pcd = RewardDefinition.getRewardDefinition(pc.RewardID);
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
                PilotReward ach = (from u in dbc.PilotRewards
                                  where u.PilotEmail == user && u.RewardID==classid
                                               select u).SingleOrDefault();
                if (ach != null)
                {
                    return ach.DateCompleted;
                }
            }
            return DateTime.MinValue;
        }

        internal static void saveRewards(DBClassesDataContext dc, string email, List<Guid> rewards)
        {
            foreach (Guid rew in rewards)
            {
                PilotReward prew= (from u in dc.PilotRewards
                                   where u.PilotEmail == email && u.RewardID == rew
                                         select u).SingleOrDefault();
                if (prew == null)
                {
                    prew = new PilotReward();
                    prew.RewardID = rew;
                    prew.PilotEmail = email;
                    prew.DateCompleted = DateTime.Now;
                    prew.IsIssued = false;
                    dc.PilotRewards.InsertOnSubmit(prew);
                }
            }
        }
    }
}