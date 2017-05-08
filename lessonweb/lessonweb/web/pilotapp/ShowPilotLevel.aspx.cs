using lessonweb.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lessonweb.web.pilotapp
{
    public partial class ShowPilotLevel : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected string PilotClassID = null;
        protected DateTime achievedWhen = DateTime.MinValue;
        protected PilotClassDefinition pcd = null;
        protected List<AchievementDefinition> requirements = null;

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
            mUser = (AppUser)Session[Constants.SESS_KEY_USER];

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
            PilotClassID = Request.Params["PilotClassID"];
            achievedWhen = PilotClass.WhenAchieved(Guid.Parse(PilotClassID), mUser.UserEmail);
            pcd = PilotClassDefinition.getPilotClassDefinition(Guid.Parse(PilotClassID));
            IEnumerable<PilotClassPrereq> prereqs = PilotClassPrereq.getPrereqs(Guid.Parse(PilotClassID));
            requirements = new List<AchievementDefinition>();
            if (prereqs != null && prereqs.Count<PilotClassPrereq>() >= 0)
            {
                foreach (PilotClassPrereq pcp in prereqs)
                {
                    AchievementDefinition ad = AchievementDefinition.getAchievementDefinition(pcp.AchievementID);
                    requirements.Add(ad);
                }
            }

            // now we have the list of requirements too.
        }

        protected string GetAchievementHeaderClass(bool bCompleted)
        {
            if (bCompleted) return "completed-task-title";
            return "incomplete-task-title";
        }
    }
}