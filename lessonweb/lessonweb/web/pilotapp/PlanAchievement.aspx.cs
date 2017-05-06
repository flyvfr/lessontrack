using lessonweb.Data;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lessonweb.web.pilotapp
{
    public partial class PlanAchievement : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected string AchievementID = null;
        protected ArrayList AllTasks = null;
        protected ArrayList RequiredTasks = null;
        protected ArrayList PendingTasks = null;
        protected ArrayList CompletedTasks = null;
        protected ArrayList TaskStatus = new ArrayList(); // this can contain nulls.


        protected void getUserFromCookie()
        {
            HttpCookie stay = Request.Cookies.Get("StaySignedIn");
            if (stay != null && !string.IsNullOrEmpty(stay.Value))
            {
                mUser = AppUser.getUser(stay.Value);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            mUser = (AppUser)Session[Constants.SESS_KEY_USER];

            if (mUser == null)
            {
                getUserFromCookie();
                if (mUser == null)
                {
                    Response.Redirect("login.aspx");
                    Response.Close();
                    return;
                }
            }

            AchievementID = Request.Params["AchievementID"];
            Guid AchGuid = Guid.Parse(AchievementID);


            AllTasks = AchievementPrereq.getPrereqTasksForAchievement(AchGuid);
            RequiredTasks = new ArrayList();
            PendingTasks = new ArrayList();
            CompletedTasks = new ArrayList();
            foreach(TaskDefinition td in AllTasks)
            {
                PilotTask tskComp = PilotTask.GetTask(mUser.UserEmail, td.TaskID);
                if (tskComp != null)
                {
                    if (tskComp.IsCompleted)
                    {
                        CompletedTasks.Add(td);
                    }
                    else
                    {
                        PendingTasks.Add(td);
                    }
                    TaskStatus.Add(tskComp); 
                }
                else
                {
                    RequiredTasks.Add(td);
                }
            }

            // sort the tasks by required and completed
            AllTasks.Clear();
            AllTasks.AddRange(RequiredTasks);
            AllTasks.AddRange(PendingTasks);
            AllTasks.AddRange(CompletedTasks);
        }

        protected bool IsCompleted(TaskDefinition td)
        {
            return CompletedTasks.Contains(td);
        }

        protected bool IsPending(TaskDefinition td)
        {
            return PendingTasks.Contains(td);
        }
        protected string GetTaskHeaderClass(TaskDefinition td)
        {
            if (IsCompleted(td)) return "completed-task-title";
            if (IsPending(td)) return "pending-task-title";
            return "incomplete-task-title";
        }
    }
}