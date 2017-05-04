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
    public class RemoveTaskToDo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string email = context.Request.Params["email"];
            string taskid = context.Request.Params["taskid"];

            using (DBClassesDataContext dc = new DBClassesDataContext())
            {
                try
                {
                    PilotTask task = (from u in dc.PilotTasks
                            where u.TaskID == Guid.Parse(taskid) && u.PilotEmail == email
                            select u).SingleOrDefault();
                    if (task != null)
                    {
                        dc.PilotTasks.DeleteOnSubmit(task);
                        dc.SubmitChanges();
                    }
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