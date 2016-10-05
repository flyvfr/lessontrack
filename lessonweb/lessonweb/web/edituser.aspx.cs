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
    public partial class PGEditUser : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected AppUser mEditingUser = null;
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

            String uid = Request.Params["uid"];
            if (String.IsNullOrEmpty(uid))
            {
                NewType = Request.Params["type"];
                if (String.IsNullOrEmpty(NewType))
                {
                    Response.Redirect("dashboard.aspx");
                    Response.Close();
                    return;
                }
                // this is a new student or instructor or admin being added
                mEditingUser = new AppUser();
                mEditingUser.IsInstructor = (NewType == "instructor");
                mEditingUser.IsStudent = (NewType == "student");
            }
            else
            {
                mEditingUser = AppUser.getUser(uid);
                if (mEditingUser == null)
                {
                    Response.Redirect("dashboard.aspx");
                    Response.Close();
                    return;
                }
            }
            if (!IsPostBack)
            {
                Email.ReadOnly = (NewType == null);
                Email.Text = mEditingUser.UserEmail;
                Address1.Text = mEditingUser.Address1;
                Address2.Text = mEditingUser.Address2;
                Address3.Text = mEditingUser.Address3;
                CellPhone.Text = mEditingUser.CellPhone;
                City.Text = mEditingUser.City;
                Country.Text = mEditingUser.Country;
                DOB.Text = mEditingUser.DOB.ToString();
                Employer.Text = mEditingUser.Employer;
                FName.Text = mEditingUser.FirstName;
                HomePhone.Text = mEditingUser.HomePhone;
                LName.Text = mEditingUser.LastName;
                MI.Text = mEditingUser.MI;
                State.Text = mEditingUser.State;
                WorkPhone.Text = mEditingUser.WorkPhone;
                ZIP.Text = mEditingUser.ZIP;
                ListGender.SelectedIndex = (mEditingUser.Gender == "M" ? 0 : (mEditingUser.Gender == "F" ? 1 : 2));
                IsAdmin.Checked = mEditingUser.IsAdmin;
                IsStudent.Checked = mEditingUser.IsStudent;
                IsInstructor.Checked = mEditingUser.IsInstructor;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            if (NewType == null)
            {
                AppUser usr = (from u in dbc.AppUsers
                               where u.UserEmail == mEditingUser.UserEmail
                               select u).SingleOrDefault();
                mEditingUser = usr;
                if (!String.IsNullOrEmpty(PasswordChange.Text))
                {
                    mEditingUser.PasswordHash = System.Text.Encoding.UTF8.GetBytes(PasswordChange.Text);
                }
            }
            else
            {
                dbc.AppUsers.InsertOnSubmit(mEditingUser);
                mEditingUser.UserEmail = Email.Text;
                if (!String.IsNullOrEmpty(Password.Text))
                {
                    mEditingUser.PasswordHash = System.Text.Encoding.UTF8.GetBytes(Password.Text);
                }
                mEditingUser.CreatedOn = DateTime.Now;
                //mEditingUser.PasswordHash = new ASCIIEncoding().GetBytes(Password.Text);
            }

            // now save all the data and move to the previous page.
            mEditingUser.Address1 = Address1.Text;
            mEditingUser.Address2 = Address2.Text;
            mEditingUser.Address3 = Address3.Text;
            mEditingUser.CellPhone = CellPhone.Text;
            mEditingUser.City = City.Text;
            mEditingUser.Country = Country.Text;
            try
            {
                mEditingUser.DOB = DateTime.Parse(DOB.Text);
            }
            catch { }
            mEditingUser.Employer = Employer.Text;
            mEditingUser.FirstName = FName.Text;
            mEditingUser.Gender = (ListGender.SelectedIndex ==0 ? "M" :(ListGender.SelectedIndex==1?"F":null));
            mEditingUser.HomePhone = HomePhone.Text;
            mEditingUser.LastName = LName.Text;
            mEditingUser.MI = MI.Text;
            mEditingUser.State = State.Text;
            mEditingUser.WorkPhone = WorkPhone.Text;
            mEditingUser.ZIP = ZIP.Text;

            mEditingUser.IsAdmin = IsAdmin.Checked;
            mEditingUser.IsInstructor = IsInstructor.Checked;
            mEditingUser.IsStudent = IsStudent.Checked;

            if (!mEditingUser.IsStudent && !mEditingUser.IsInstructor && !mEditingUser.IsAdmin)
            {
                mEditingUser.IsStudent = true;
            }
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