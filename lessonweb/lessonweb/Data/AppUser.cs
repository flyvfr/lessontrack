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
        internal static AppUser getUserIfValid(string text1, string text2)
        {
            return null;
        }
    }
}