using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lessonweb.Data;

namespace lessonweb.web
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // clear the session whenever we go here
            Session.Remove(Constants.SESS_KEY_USER);
        }

        /**
         * when clicked on Sign In, get the login and password and load the user
         */
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            AppUser user = AppUser.getUserIfValid(Email.Text, Password.Text);
            if (user != null)
            {
                Session[Constants.SESS_KEY_USER] = user;
                if (chkRemember.Checked)
                {
                    HttpCookie cook = new HttpCookie("DashStaySignedIn", user.UserEmail);
                    cook.Expires = DateTime.Now.AddDays(365);
                    Response.SetCookie(cook);
                }
                else
                {
                    HttpCookie currentUserCookie = HttpContext.Current.Request.Cookies["DashStaySignedIn"];
                    if (currentUserCookie != null)
                    {
                        HttpContext.Current.Response.Cookies.Remove("DashStaySignedIn");
                        currentUserCookie.Expires = DateTime.Now.AddDays(-10);
                        currentUserCookie.Value = null;
                        HttpContext.Current.Response.SetCookie(currentUserCookie);
                    }
                }
                Response.Redirect("dashboard.aspx");
                return;
            }
            ErrorLine.Visible = true;
            ErrorLine.Text = "Invalid user or password";

        }
    }
}