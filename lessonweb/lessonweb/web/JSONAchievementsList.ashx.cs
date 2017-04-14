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
    public class JSONAchievementsList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Dictionary<String, object> res = new Dictionary<string, object>();
            List<Object> finalList = new List<object>();
            IEnumerable<AchievementDefinition> achs = AchievementDefinition.getAll();
            foreach (AchievementDefinition r in achs)
            {
                int nAchs = 0;
                int nTasks = AchievementPrereq.getPrereqTypes(AchievementPrereq.getPrereqsForAchievement(r.AchievementID), out nAchs);

                Dictionary<string, string> obj = new Dictionary<string, string>();
                obj.Add("Achievement", r.AchievementName);
                obj.Add("Tasks", nTasks.ToString());
                obj.Add("Prerequisites", nAchs.ToString());
                obj.Add("actions", r.AchievementID.ToString());
                obj.Add("AchievementID", r.AchievementID.ToString());
                obj.Add("AchievementDesc", r.AchievementDesc);
                
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