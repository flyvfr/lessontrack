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
    public class deleteachievement : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string sid = context.Request["achievementid"];
            Guid achID = Guid.Parse(sid);
            AchievementDefinition.delete(achID);
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