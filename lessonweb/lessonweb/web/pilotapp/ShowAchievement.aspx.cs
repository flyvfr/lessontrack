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
    public partial class ShowAchievement : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected string AchievementID = null;
        protected DateTime achievedWhen = DateTime.MinValue;
        protected AchievementDefinition rd = null;
        protected List<AchievementDefinition> requirements = null;
        protected List<TaskDefinition> taskrequirements = null;

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
            AchievementID = Request.Params["AchievementID"];
            achievedWhen = PilotAchievement.WhenAchieved(Guid.Parse(AchievementID), mUser.UserEmail);
            rd = AchievementDefinition.getAchievementDefinition(Guid.Parse(AchievementID));
            IEnumerable<AchievementPrereq> prereqs = AchievementPrereq.getPrereqsForAchievement(Guid.Parse(AchievementID));
            requirements = new List<AchievementDefinition>();
            taskrequirements = new List<TaskDefinition>();
            if (prereqs != null && prereqs.Count<AchievementPrereq>() >= 0)
            {
                foreach (AchievementPrereq pcp in prereqs)
                {
                    if (pcp.RequiredAchievementID != null)
                    {
                        AchievementDefinition ad = AchievementDefinition.getAchievementDefinition((Guid)pcp.RequiredAchievementID);
                        if (ad != null) requirements.Add(ad);
                    }else if (pcp.TaskID != null)
                    {
                        TaskDefinition ad = TaskDefinition.getTaskDefinition((Guid)pcp.TaskID);
                        if (ad != null) taskrequirements.Add(ad);
                    }
                }
            }
        }

        protected string GetAchievementHeaderClass(bool bCompleted)
        {
            if (bCompleted) return "completed-task-title";
            return "incomplete-task-title";
        }
    }
}