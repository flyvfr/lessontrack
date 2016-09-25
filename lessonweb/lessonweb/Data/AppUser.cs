using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class AppUser
    {
        public string GetFullName()
        {
            return FirstName + " " + LastName;
        }

        // if the user exists and is valid, return the user, else return null
        internal static AppUser getUserIfValid(string email, string passwd)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            AppUser usr = (from u in dbc.AppUsers
                          where u.UserEmail == email
                          select u).SingleOrDefault();

            return usr;
        }

        internal static int GetTotalStudents()
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            int nUsers = (from u in dbc.AppUsers
                           where u.IsStudent == true
                           select u).Count();
            return nUsers;
        }

        internal static int GetTotalInstructors()
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            int nUsers = (from u in dbc.AppUsers
                          where u.IsInstructor == true
                          select u).Count();
            return nUsers;
        }
    }
}