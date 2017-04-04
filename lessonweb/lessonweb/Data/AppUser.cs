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

        public bool IsRestrictedUser()
        {
            return IsStudent && !IsAdmin && !IsInstructor;
        }

        // if the user exists and is valid, return the user, else return null
        internal static AppUser getUserIfValid(string email, string passwd)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            AppUser usr = (from u in dbc.AppUsers
                          where u.UserEmail == email
                          select u).SingleOrDefault();
            if (usr == null) return null;
            if (usr.PasswordHash != null && usr.PasswordHash.Length>0 && usr.PasswordHash.ToArray()[0] != 0)
            {
                string internalpwd = System.Text.Encoding.UTF8.GetString(usr.PasswordHash.ToArray());
                if (internalpwd != passwd)
                {
                    return null;
                }
            }
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

        internal static AppUser getUser(DBClassesDataContext dbc, string uid)
        {
            AppUser usr = (from u in dbc.AppUsers
                           where u.UserEmail == uid
                           select u).SingleOrDefault();

            return usr;
        }
        internal static AppUser getUser(string uid)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            return getUser(dbc, uid) ;
        }

        internal static IEnumerable<AppUser> GetInstructors()
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<AppUser> usrs = (from u in dbc.AppUsers
                                         where u.IsInstructor == true
                                         select u);

            return usrs;
        }

        internal static IEnumerable<AppUser> GetStudents()
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<AppUser> usrs = (from u in dbc.AppUsers
                           where u.IsStudent == true
                           select u);

            return usrs;
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