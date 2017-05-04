using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lessonweb.Data;
using System.Web.SessionState;

namespace lessonweb.web
{
    public partial class dashboard : System.Web.UI.Page
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
            if (mUser == null)
            {
                Response.Redirect("login.aspx");
                Response.Close();
                return;
            }

            if (mUser.IsRestrictedUser())
            {
                Response.Redirect("showuser.aspx?uid="+mUser.UserEmail);
                Response.Close();
                return;
            }

        }

        protected string GetTotalStudents()
        {
            return ""+AppUser.GetTotalStudents();
        }
        protected string GetTotalInstructors()
        {
            return "" + AppUser.GetTotalInstructors();
        }

        protected string GetTotalAircraft()
        {
            return "" + Aircraft.GetTotalShips();
        }

    }
}