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
    public class JSONTasksList : IHttpHandler
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

            
            Dictionary<int, String> TypeCodes = TaskDefinition.GetTaskTypeCodes();
            Dictionary<String, object> res = new Dictionary<string, object>();
            List<Object> finalList = new List<object>();
            IEnumerable<TaskDefinition> rews = TaskDefinition.getAllTaskDefinitions();
            foreach (TaskDefinition r in rews)
            {
                Dictionary<string, string> obj = new Dictionary<string, string>();
                obj.Add("TaskName", r.TaskName);
                obj.Add("TaskID", r.TaskID.ToString());
                obj.Add("actions", r.TaskID.ToString());
                obj.Add("TaskTypeName", TypeCodes[r.TaskType]);
                obj.Add("TaskType", r.TaskType.ToString());
                obj.Add("TaskDescription", r.TaskDescription);
                obj.Add("AircraftType", r.AircraftType);
                obj.Add("Airport", r.Airport);
                obj.Add("Course", r.Course);
                obj.Add("Detail", r.Detail);
                obj.Add("Distance", (r.Distance != null) ? r.Distance.ToString() : "");
                obj.Add("Hours", (r.Hours != null) ? r.Hours.ToString() : "");
                obj.Add("IsCrossCountry", (r.IsCrossCountry != null) ? r.IsCrossCountry.ToString() : "");
                obj.Add("IsDual", (r.IsDual != null) ? r.IsDual.ToString() : "");
                obj.Add("IsNight", (r.IsNight != null) ? r.IsNight.ToString() : "");
                obj.Add("IsWithPassenger", (r.IsWithPassenger != null) ? r.IsWithPassenger.ToString() : "");
                obj.Add("Lesson", r.Lesson);
                obj.Add("Maneuver", r.Maneuver);
                obj.Add("TailNo", r.TailNo);
                
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