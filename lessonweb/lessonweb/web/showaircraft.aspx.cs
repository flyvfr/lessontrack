using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lessonweb.Data;

namespace lessonweb.web
{
    public partial class PGShowAircraft : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected Aircraft mShip = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            mUser = dashboard.getUserFromSessionOrCookie(Request, Session);    
            if (mUser == null)
            {
                Response.Redirect("login.aspx");
                Response.Close();
                return;
            }

            String tail = Request.Params["tail"];
            if (String.IsNullOrEmpty(tail))
            {
                Response.Redirect("dashboard.aspx");
                Response.Close();
                return;
            }

            mShip = Aircraft.getAircraft(tail);
            if (mShip == null)
            {
                Response.Redirect("dashboard.aspx");
                Response.Close();
                return;
            }
        }

    }
}