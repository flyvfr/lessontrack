using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lessonweb.Data;

namespace lessonweb.web
{
    public partial class PGAircrafts : System.Web.UI.Page
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

        }

        protected string GetTotalShips()
        {
            return ""+Aircraft.GetTotalShips();
        }
        protected IEnumerable<Aircraft> GetShipList()
        {
            return Aircraft.GetAll();
        }
    }
}