using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using lessonweb.Data;

namespace lessonweb.web
{
    public partial class PGEditCourse : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected FAACert mCourse = null;
        protected AppUser mStudent = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            mUser = (AppUser)Session[Constants.SESS_KEY_USER];    
            if (mUser == null)
            {
                Response.Redirect("login.aspx");
                Response.Close();
                return;
            }

            String studentid = Request.Params["student"];
            String certid = Request.Params["certid"];
            if (String.IsNullOrEmpty(certid))
            {
                Response.Redirect("dashboard.aspx");
                Response.Close();
                return;
            }

            mCourse = FAACert.getCert(certid);
            if (mCourse == null)
            {
                Response.Redirect("dashboard.aspx");
                Response.Close();
                return;
            }

            if (!String.IsNullOrEmpty(studentid))
            {
                mStudent = AppUser.getUser(studentid);
                if (mStudent == null)
                {
                    studentid = null;
                }
            }

            if (mStudent == null|| mUser.IsRestrictedUser())
            {
                Response.Redirect("dashboard.aspx");
                Response.Close();
                return;
            }

            mCourse.LoadStages(studentid);   // load it completely
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
    }
}