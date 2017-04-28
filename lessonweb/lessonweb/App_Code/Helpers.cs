using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.App_Code
{
    public class Helpers
    {
        public enum DATEFORMAT{
            FORMAT_SHORT,
            FORMAT_LONG,
        } ; 

        public static String FormatDateTime(DateTime when, DATEFORMAT fmt)
        {
            String sdt = "";
            if (when == DateTime.MinValue) return "None";
            if (when.Year == DateTime.Now.Year && when.Month == DateTime.Now.Month && when.Day == DateTime.Now.Day)
            {
                return "Today";
            }
            if (when.Year == DateTime.Now.Year && when.Month == DateTime.Now.Month && when.Day == DateTime.Now.Day-1)
            {
                return "Yesterday";
            }

            switch (fmt)
            {
                case DATEFORMAT.FORMAT_SHORT:
                    return when.ToShortDateString();
                case DATEFORMAT.FORMAT_LONG:
                    return when.ToLongDateString();
            }

            return sdt;
        }
    }
}