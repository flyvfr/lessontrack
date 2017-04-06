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
    public class savetask : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string tasktype= context.Request.Form["tasktype"];
            string aircraft = context.Request.Form["ChooseAC"];
            string hours = context.Request.Form["hours"];
            string airport = context.Request.Form["airport"];
            string taskname = context.Request.Form["taskname"];
            string description = context.Request.Form["description"];
            string maneuver = context.Request.Form["maneuver"];
            string lessonname = context.Request.Form["lessonname"];
            string pinnacle = context.Request.Form["pinnacle"];
            string destination = context.Request.Form["destination"];
            string classname = context.Request.Form["classname"];
            string taskid = context.Request.Form["taskid"];

            TaskDefinition task = new TaskDefinition();

            using (DBClassesDataContext dc = new DBClassesDataContext())
            {
                try
                {
                    if (String.IsNullOrEmpty(taskid))
                    {
                        dc.TaskDefinitions.InsertOnSubmit(task);
                        task.TaskID = Guid.NewGuid();
                    }
                    else
                    {
                        task = (from u in dc.TaskDefinitions
                                where u.TaskID == Guid.Parse(taskid)
                                select u).SingleOrDefault();
                    }
                    task.AircraftType = aircraft;
                    task.TaskType = int.Parse(tasktype);
                    try { task.Hours = Decimal.Parse(hours); } catch { }
                    task.Airport = airport;
                    task.Course = classname;
                    task.Lesson = lessonname;
                    task.Maneuver = maneuver;
                    task.TaskDescription = description;
                    task.TaskName = taskname;

                    task.AircraftType = aircraft;
                    try { task.Hours = decimal.Parse(hours); } catch { }
                    task.Lesson = lessonname;
                    if (task.TaskType == TaskDefinition.TASK_DESTINATION)
                    {
                        task.Detail = destination;
                    }
                    else if (task.TaskType == TaskDefinition.TASK_PINNACLE)
                    {
                        task.Detail = pinnacle;
                    }

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