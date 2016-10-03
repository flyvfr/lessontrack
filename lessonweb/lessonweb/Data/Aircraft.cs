using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class Aircraft
    {
        public const int STATUS_NOT_AVAIL = 0;
        public const int STATUS_READY = 1;
        public const int STATUS_FLYING = 2;
        public const int STATUS_MAINTENANCE = 3;
        public const int STATUS_RESERVED = 4;

        // if the user exists and is valid, return the user, else return null
        internal static Aircraft getAircraft(string tail)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            Aircraft ac = (from u in dbc.Aircrafts
                          where u.TailNumber == tail
                          select u).SingleOrDefault();

            return ac;
        }

        internal static int GetTotalShips()
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            int nAc = (from u in dbc.Aircrafts
                           select u).Count();
            return nAc;
        }


        internal static IEnumerable<Aircraft> GetAll()
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<Aircraft> usrs = (from u in dbc.Aircrafts
                                         select u);

            return usrs;
        }

        public string GetStatusString()
        {
            switch (Status)
            {
                case STATUS_NOT_AVAIL:
                    return "Unavailable";

                case STATUS_READY:
                    return "Ready";
                case STATUS_FLYING:
                    return "Flying";
                case STATUS_MAINTENANCE:
                    return "Maintenance";
                case STATUS_RESERVED:
                    return "Reserved";
            }

            return "Unknown";
        }
    }
}