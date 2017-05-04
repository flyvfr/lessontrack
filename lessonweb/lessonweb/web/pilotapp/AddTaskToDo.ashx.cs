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
    public class AddTaskToDo : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string email = context.Request.Params["email"];
            string taskid = context.Request.Params["taskid"];

            PilotTask task = new PilotTask();

            using (DBClassesDataContext dc = new DBClassesDataContext())
            {
                try
                {
                    dc.PilotTasks.InsertOnSubmit(task);
                    task.TaskID = Guid.Parse(taskid);
                    task.DateAdded = DateTime.Now;
                    task.IsCompleted = false;
                    task.IsVerified = false;
                    task.PilotEmail = email;
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