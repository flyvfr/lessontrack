using lessonweb.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lessonweb.web.pilotapp
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            AppUser user = AppUser.getUserIfValid(txtEmail.Text, Password.Text);
            if (user != null)
            {
                Session[Constants.SESS_KEY_USER] = user;
                if (chkStay.Checked)
                {
                    HttpCookie cook = new HttpCookie("StaySignedIn", user.UserEmail);
                    cook.Expires = DateTime.Now.AddDays(365);
                    Response.SetCookie(cook);
                }
                else
                {
                    HttpCookie currentUserCookie = HttpContext.Current.Request.Cookies["StaySignedIn"];
                    if (currentUserCookie != null)
                    {
                        HttpContext.Current.Response.Cookies.Remove("StaySignedIn");
                        currentUserCookie.Expires = DateTime.Now.AddDays(-10);
                        currentUserCookie.Value = null;
                        HttpContext.Current.Response.SetCookie(currentUserCookie);
                    }

                }
                Response.Redirect("homepage.aspx");
                return;
            }
            txtError.Visible = true;
            txtError.Text = "Invalid user or password";
        }
    }
}