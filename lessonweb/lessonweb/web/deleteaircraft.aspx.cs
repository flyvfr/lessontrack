using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lessonweb.Data;

namespace lessonweb.web
{
    public partial class PGDeleteAircraft : System.Web.UI.Page
    {
        protected AppUser mUser = null;

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
            if (String.IsNullOrEmpty(tail) || !mUser.IsAdmin)
            {
                Response.Redirect("dashboard.aspx");
                Response.Close();
                return;
            }

            DBClassesDataContext dbc = new DBClassesDataContext();
            Aircraft ship = (from u in dbc.Aircrafts
                           where u.TailNumber == tail
                           select u).SingleOrDefault();
            if (ship != null)
            {
                dbc.Aircrafts.DeleteOnSubmit(ship);
                dbc.SubmitChanges();
            }

            Response.Redirect("dashboard.aspx");
            Response.Close();
            return;

        }

    }
}