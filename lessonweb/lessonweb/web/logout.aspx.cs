using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lessonweb.web
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie currentUserCookie = HttpContext.Current.Request.Cookies["DashStaySignedIn"];
            if (currentUserCookie != null)
            {
                HttpContext.Current.Response.Cookies.Remove("DashStaySignedIn");
                currentUserCookie.Expires = DateTime.Now.AddDays(-10);
                currentUserCookie.Value = null;
                HttpContext.Current.Response.SetCookie(currentUserCookie);
            }
            Response.Redirect("login.aspx");
        }
    }
}