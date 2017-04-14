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
    public class deletereward : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string rewardid = context.Request["rewardid"];
            Guid rewID = Guid.Parse(rewardid);
            RewardDefinition.delete(rewID);
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