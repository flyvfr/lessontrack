using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public class Planner
    {

        public static ArrayList GetNextAchievements(String UserID)
        {
            ArrayList achs = new ArrayList();
            // First a list of achievements i have
            using (DBClassesDataContext dc = new DBClassesDataContext())
            {
                ArrayList AchievementsAvailable = new ArrayList();
                IEnumerable<PilotAchievement> mine = from a in dc.PilotAchievements
                                                     where a.PilotEmail == UserID
                                                     select a;

                // Now, get a list of achievements which dont have prereqs OR has prereqs that are already achieved
                IEnumerable<AchievementDefinition> AllAchievements = AchievementDefinition.getAll();
                IEnumerable<AchievementPrereq> iprereqs = from a in dc.AchievementPrereqs
                                                          where a.RequiredAchievementID != null
                                                     select a;
                List<AchievementPrereq> prereqs = iprereqs.ToList();

                // loop through each possible achievement
                foreach (AchievementDefinition ad in AllAchievements)
                {
                    //-----------------------------------------------------
                    // first check if i already got this one
                    bool igotThis = false;
                    // look at all my achievements, did i satisfy all of them ?
                    foreach (PilotAchievement pa in mine)
                    {
                        // did i satisfy the achievement ?
                        if (pa.AchievementID == ad.AchievementID)
                        {
                            igotThis = true;
                            break;
                        }
                    }

                    if (igotThis) continue;    // i have this, skip it
                    //-----------------------------------------------------

                    //-----------------------------------------------------
                    // get all the prereq achievements for the ach
                    IEnumerable<AchievementPrereq> pres = AchievementPrereq.getPrereqsForAchievement(ad.AchievementID);
                    // if there are prereqs ?
                    if (pres.Count<AchievementPrereq>() > 0)
                    {
                        bool bSatisfied = true;
                        // look through all the prereqs for this achievement
                        foreach (AchievementPrereq pre in pres)
                        {
                            if (pre.RequiredAchievementID == null) continue; // skip task prereq
                            bool bSatisfiedThis = false;
                            // look at all my achievements, did i satisfy all of them ?
                            foreach (PilotAchievement pa in mine)
                            {
                                // did i satisfy the achievement ?
                                if (pa.AchievementID == pre.RequiredAchievementID)
                                {
                                    bSatisfiedThis = true;
                                    break;
                                }
                            }

                            if (!bSatisfiedThis)
                            {
                                bSatisfied = false;
                            }
                        }

                        // bSatisfied tells if this achievement is unlocked
                        if (!bSatisfied)
                        {
                            break;
                        }
                    }
                    //-----------------------------------------------------

                    // if i am here, this achievement has no prereqs or i have satisfied this
                    achs.Add(ad);
                }
            }

            return achs;

        }

    }
}