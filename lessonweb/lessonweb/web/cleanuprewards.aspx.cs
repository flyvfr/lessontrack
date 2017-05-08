using lessonweb.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lessonweb.web
{
    public partial class cleanuprewards : System.Web.UI.Page
    {
        protected AppUser mUser = null;

        public static AppUser getUserFromSessionOrCookie(HttpRequest Request, HttpSessionState session)
        {
            AppUser usr = (AppUser)session[Constants.SESS_KEY_USER];
            if (usr == null)
            {
                HttpCookie stay = Request.Cookies.Get("DashStaySignedIn");
                if (stay != null && !string.IsNullOrEmpty(stay.Value))
                {
                    usr = AppUser.getUser(stay.Value);
                }
            }
            return usr;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            mUser = dashboard.getUserFromSessionOrCookie(Request, Session);

        }

        protected void DoIT_Click(object sender, EventArgs e)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                dbc.ExecuteCommand("delete from PilotClass where 1=1;", new Object[0]);
                dbc.ExecuteCommand("delete from PilotReward where 1=1;", new Object[0]);
                dbc.ExecuteCommand("delete from PilotAchievement where 1=1;", new Object[0]);
                dbc.ExecuteCommand("delete from PilotTask where 1=1;", new Object[0]);
            }
        }
    }
}