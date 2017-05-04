using lessonweb.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace lessonweb.web
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class savereward : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string rewardname= context.Request.Form["rewardname"];
            string logo= context.Request.Form["rewardlogo"];
            string rewardtype = context.Request.Form["rewardtype"];
            string rewarditem = context.Request.Form["rewarddetail"];
            string rewardcount = context.Request.Form["rewardcount"];
            string rewardvalidity = context.Request.Form["rewardvalidtill"];
            string description = context.Request.Form["rewarddescription"];
            string rewardid = context.Request.Form["rewardid"];

            RewardDefinition reward = new RewardDefinition();

            using (DBClassesDataContext dc = new DBClassesDataContext())
            {
                try
                {
                    if (String.IsNullOrEmpty(rewardid))
                    {
                        dc.RewardDefinitions.InsertOnSubmit(reward);
                        reward.RewardID = Guid.NewGuid();
                    }
                    else
                    {
                        reward = (from u in dc.RewardDefinitions
                                  where u.RewardID == Guid.Parse(rewardid)
                                select u).SingleOrDefault();
                    }
                    reward.RewardName = rewardname;
                    reward.Logo = logo;
                    reward.RewardType= rewardtype;
                    try { reward.RewardCount = Decimal.Parse(rewardcount); } catch { }
                    reward.RewardDesc = description;
                    reward.RewardItem = rewarditem;
                    try{reward.RewardValidityTill = DateTime.Parse(rewardvalidity); } catch { }
                    dc.SubmitChanges();
                }
                catch (Exception e){
                   
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}