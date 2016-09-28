using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using lessonweb.Data;

namespace lessonweb.web
{
    public partial class PGEditAircraft : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected Aircraft mShip = null;
        protected String Referrer = null;
        protected string NewType = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            mUser = (AppUser)Session[Constants.SESS_KEY_USER];
            if (mUser == null)
            {
                Response.Redirect("login.aspx");
                Response.Close();
                return;
            }
            Referrer = Request.Params["referer"];

            String tail = Request.Params["tail"];
            if (String.IsNullOrEmpty(tail))
            {
                NewType = Request.Params["type"];
                if (String.IsNullOrEmpty(NewType))
                {
                    Response.Redirect("dashboard.aspx");
                    Response.Close();
                    return;
                }
                // this is a new student or instructor or admin being added
                mShip = new Aircraft();
            }
            else
            {
                mShip = Aircraft.getAircraft(tail);
                if (mShip == null)
                {
                    Response.Redirect("dashboard.aspx");
                    Response.Close();
                    return;
                }
            }
            if (!IsPostBack)
            {
                TailNum.ReadOnly = (NewType == null);
                TailNum.Text = mShip.TailNumber;
                Make.Text = mShip.Make;
                Model.Text = mShip.Model;
                Year.Text = mShip.Year ;
                ListStatus.SelectedIndex = mShip.Status;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            if (NewType == null)
            {
                Aircraft ship = (from u in dbc.Aircrafts
                               where u.TailNumber == mShip.TailNumber
                               select u).SingleOrDefault();
                mShip = ship;
            }else
            {
                dbc.Aircrafts.InsertOnSubmit(mShip);
                mShip.TailNumber = TailNum.Text;
            }

            mShip.Make = Make.Text;
            mShip.Model = Model.Text;
            mShip.Year = Year.Text;
            mShip.Status = ListStatus.SelectedIndex;

            dbc.SubmitChanges();

            ExitPage();

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            ExitPage();
        }

        protected void ExitPage()
        {
            if (Referrer != null)
            {
                Response.Redirect(Referrer);
            }
            else
            {
                Response.Redirect("dashboard.aspx");
            }

        }
    }
}