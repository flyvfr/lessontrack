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
    public partial class DlgCompleteTask : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected String Email = null;
        protected String Task = null;
        protected String AchievementID = null;
        protected IEnumerable<AppUser> Instructors = null;

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
            Email = Request.Params["Email"];
            Task = Request.Params["Task"];
            AchievementID = Request.Params["Achievement"];

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

            // Load instructor list
            Instructors = AppUser.GetInstructors();

        }

    }
}