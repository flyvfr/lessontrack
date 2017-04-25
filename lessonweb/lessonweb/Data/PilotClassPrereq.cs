using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class PilotClassPrereq
    {
        // if the user exists and is valid, return the user, else return null
        public static IEnumerable<PilotClassPrereq> getPrereqs(Guid achid)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                IEnumerable<PilotClassPrereq> ach = (from u in dbc.PilotClassPrereqs
                                                     where u.PilotClassID == achid
                                                      select u);

                return ach.ToList();
            }
        }


        // if the user exists and is valid, return the user, else return null
        public static IEnumerable<Guid> getPilotClassesForPrereqAchievement(Guid achid)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<Guid> ach = (from u in dbc.PilotClassPrereqs
                                     where u.AchievementID == achid
                                     select u.PilotClassID);

            return ach;
        }
    }
}