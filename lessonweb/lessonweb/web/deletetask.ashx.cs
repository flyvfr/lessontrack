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
    public class deletetask : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string staskid = context.Request["taskid"];
            Guid taskID = Guid.Parse(staskid);
            TaskDefinition.deleteTask(taskID);
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