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
    public class JSONPilotClassList : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            Dictionary<String, object> res = new Dictionary<string, object>();
            List<Object> finalList = new List<object>();
            IEnumerable<PilotClassDefinition> achs = PilotClassDefinition.getAll();
            foreach (PilotClassDefinition r in achs)
            {
                IEnumerable<PilotClassPrereq> pre = PilotClassPrereq.getPrereqs(r.PilotClassID);

                Dictionary<string, string> obj = new Dictionary<string, string>();
                obj.Add("PilotClass", r.PilotClassName);
                obj.Add("Prerequisites", pre.Count<PilotClassPrereq>().ToString());
                obj.Add("actions", r.PilotClassID.ToString());
                obj.Add("PilotClassID", r.PilotClassID.ToString());
                obj.Add("PilotClassDescription", r.PilotClassDescription);
                
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