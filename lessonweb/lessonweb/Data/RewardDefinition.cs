using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class RewardDefinition
    {
        // if the user exists and is valid, return the user, else return null
        internal static RewardDefinition getRewardDefinition(Guid defid)
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            RewardDefinition ach = (from u in dbc.RewardDefinitions
                                         where u.RewardID == defid
                                         select u).SingleOrDefault();

            return ach;
        }

        public static IEnumerable<RewardDefinition> getAll()
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<RewardDefinition> ach = (from u in dbc.RewardDefinitions
                                                      select u);

            return ach.ToList();
        }

        protected string GetRewardType()
        {
            switch (RewardType)
            {
                case "DISCOUNT":
                    return "Discount";
                case "CAP":
                    return "Discount";
                case "BADGE":
                    return "Discount";
                case "PATCH":
                    return "Discount";
                case "STICKER":
                    return "Discount";
                case "CHOCHKY":
                    return "Discount";
                case "SHOUT":
                    return "Discount";
                case "OTHER":
                    return "Other";
                default:
                    return "Other";
            }
        }

        public string getRewardDetail()
        {
            return "Pilot gets "+(RewardCount>0?""+RewardCount:"a")+" "+GetRewardType()+": "+RewardItem;
        }

        internal static void delete(Guid achID)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                RewardDefinition ach = (from u in dbc.RewardDefinitions
                                             where u.RewardID == achID
                                             select u).SingleOrDefault();
                if (ach != null)
                {
                    dbc.RewardDefinitions.DeleteOnSubmit(ach);
                    dbc.SubmitChanges();
                }
            }
        }
    }
}