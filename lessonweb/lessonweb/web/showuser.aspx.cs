using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lessonweb.Data;

namespace lessonweb.web
{
    public partial class PGShowUser : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected AppUser mShownUser = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            mUser = (AppUser)Session[Constants.SESS_KEY_USER];    
            if (mUser == null)
            {
                Response.Redirect("login.aspx");
                Response.Close();
                return;
            }

            String uid = Request.Params["uid"];
            if (String.IsNullOrEmpty(uid))
            {
                Response.Redirect("dashboard.aspx");
                Response.Close();
                return;
            }

            mShownUser = AppUser.getUser(uid);
            if (mShownUser == null)
            {
                Response.Redirect("dashboard.aspx");
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

        protected IEnumerable<AppUser> GetStudentList()
        {
            return AppUser.GetStudents();
        }
    }
}