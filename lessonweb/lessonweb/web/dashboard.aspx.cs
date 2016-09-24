using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lessonweb.Data;

namespace lessonweb.Views
{
    public partial class dashboard : System.Web.UI.Page
    {
        protected AppUser mUser = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            mUser = (AppUser)Session[Constants.SESS_KEY_USER];    
            if (mUser == null)
            {
                Response.Redirect("login.aspx");
                Response.Close();
                return;
            }

        }
    }
}