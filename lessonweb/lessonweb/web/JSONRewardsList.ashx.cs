using lessonweb.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.web
{
    /// <summary>
    /// Summary description for deletetask
    /// </summary>
    public class JSONRewardsList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            /*Dictionary<String, object> res = new Dictionary<string, object>();
            List<Object> finalList = new List<object>();
            IEnumerable<RewardDefinition> rews = RewardDefinition.getAll();
            foreach (RewardDefinition r in rews)
            {
                List<string> obj = new List<string>();
                obj.Add("");
                obj.Add(r.RewardName);
                obj.Add(r.RewardType);
                obj.Add(r.getRewardDetail());
                finalList.Add(obj);
            }
            res.Add("data", finalList);
            string json = JsonConvert.SerializeObject(res);
            context.Response.Write(json);
            */
            Dictionary<String, object> res = new Dictionary<string, object>();
            List<Object> finalList = new List<object>();
            IEnumerable<RewardDefinition> rews = RewardDefinition.getAll();
            foreach (RewardDefinition r in rews)
            {
                Dictionary<string, string> obj = new Dictionary<string, string>();
                obj.Add("empty", "");
                obj.Add("Reward", r.RewardName);
                obj.Add("Type", r.RewardType);
                obj.Add("Detail", r.getRewardDetail());
                obj.Add("actions", r.RewardID.ToString());
                obj.Add("RewardID", r.RewardID.ToString());
                obj.Add("RewardItem", r.RewardItem);
                obj.Add("RewardCount", (r.RewardCount != null) ? r.RewardCount.ToString() : "");
                obj.Add("RewardDesc", (r.RewardDesc != null) ? r.RewardDesc:"");
                obj.Add("RewardValidity", (r.RewardValidityTill!=null)?String.Format("{0:MM/dd/yyyy}", r.RewardValidityTill):"");
                
                finalList.Add(obj);
            }
            res.Add("data", finalList);
            string json = JsonConvert.SerializeObject(res);
            context.Response.Write(json);

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