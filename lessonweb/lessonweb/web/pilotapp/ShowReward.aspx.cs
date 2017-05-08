using lessonweb.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lessonweb.web.pilotapp
{
    public partial class ShowReward : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected string RewardID = null;
        protected DateTime achievedWhen = DateTime.MinValue;
        protected RewardDefinition rd = null;
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
            RewardID = Request.Params["RewardID"];
            achievedWhen = PilotClass.WhenAchieved(Guid.Parse(RewardID), mUser.UserEmail);
            rd = RewardDefinition.getRewardDefinition(Guid.Parse(RewardID));
            IEnumerable<RewardPrereq> prereqs = RewardPrereq.getPrereqs(Guid.Parse(RewardID));
            requirements = new List<AchievementDefinition>();
            if (prereqs != null && prereqs.Count<RewardPrereq>() >= 0)
            {
                foreach (RewardPrereq pcp in prereqs)
                {
                    AchievementDefinition ad = AchievementDefinition.getAchievementDefinition(pcp.RequiredAchievement);
                    requirements.Add(ad);
                }
            }

            // now we have the list of requirements too.
        }

        protected string GetRewardHeaderClass(bool bCompleted)
        {
            if (bCompleted) return "completed-task-title";
            return "incomplete-task-title";
        }
    }
}