using lessonweb.Data;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lessonweb.web.pilotapp
{
    public partial class homepage : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected ArrayList PilotClasses = null;
        protected ArrayList Achievements = null;
        protected ArrayList Rewards = null;

        protected void getUserFromCookie()
        {
            HttpCookie stay = Request.Cookies.Get("StaySignedIn");
            if (stay != null && !string.IsNullOrEmpty(stay.Value))
            {
                mUser = AppUser.getUser(stay.Value);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            mUser = dashboard.getUserFromSessionOrCookie(Request, Session);
            if (mUser == null)
            {
                getUserFromCookie();
                if (mUser == null)
                {
                    Response.Redirect("login.aspx");
                    Response.Close();
                    return;
                }
            }
            PilotClasses = PilotClass.getPilotClassesForPilot(mUser.UserEmail);
            Achievements = PilotAchievement.getAchievementsForPilot(mUser.UserEmail);
            Rewards = PilotReward.getRewardsForPilot(mUser.UserEmail);
        }

        protected String GetPilotClassForUser()
        {
            string pilotclass = "None";
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                IEnumerable<PilotClass> pcs = (from u in dbc.PilotClasses
                                            where u.PilotEmail == mUser.UserEmail
                                            select u);
                if (pcs != null && pcs.Count<PilotClass>()>0)
                {
                    pilotclass = "";
                    foreach(PilotClass pc in pcs)
                    {
                        PilotClassDefinition pcd = PilotClassDefinition.getPilotClassDefinition(pc.PilotClassID);
                        if (pilotclass.Length > 0) pilotclass += ", ";
                        pilotclass += pcd.PilotClassName;
                    }
                }
            }
            return pilotclass;
        }
    }
}