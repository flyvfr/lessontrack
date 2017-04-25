using lessonweb.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.web
{
    /// <summary>
    /// Summary description for deletetask
    /// </summary>
    public class deletepilotclass : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string sid = context.Request["pilotclassid"];
            Guid achID = Guid.Parse(sid);
            PilotClassDefinition.delete(achID);
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