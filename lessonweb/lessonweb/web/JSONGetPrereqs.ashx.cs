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
    public class JSONGetPrereqs : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string AchievementID = context.Request.Params["achievementid"];
            string RewardID = context.Request.Params["rewardid"];
            string PilotClassID = context.Request.Params["pilotclassid"];

            Dictionary<String, Object> finalList = null;
            if (!String.IsNullOrEmpty(AchievementID))
            {
                finalList = GetPrereqsForAchievement(AchievementID);
            }
            else if (!String.IsNullOrEmpty(RewardID))
            {
                finalList = GetPrereqsForReward(RewardID);
            }
            else if (!String.IsNullOrEmpty(PilotClassID))
            {
                finalList = GetPrereqsForPilotClass(PilotClassID);
            }
            string json = JsonConvert.SerializeObject(finalList);
            context.Response.Write(json);

        }

        private Dictionary<String, Object> GetPrereqsForAchievement(string achievementID)
        {
            Guid achievementGUID = Guid.Parse(achievementID);
            Dictionary<String, Object> finalList = new Dictionary<string, object>();
            List<Object> finalAchList = new List<object>();
            List<Object> finalTaskList = new List<object>();
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                // load All achievements, then lookup each in achievementprereq to see if they are needed for achievement ID
                IEnumerable<AchievementDefinition>achs = (from u in dbc.AchievementDefinitions
                                      select u);
                foreach(AchievementDefinition ach in achs)
                {
                    Dictionary<String, String> AchPre = new Dictionary<string, string>();
                    AchPre.Add("id", ach.AchievementID.ToString());
                    AchPre.Add("name", ach.AchievementName);
                    IEnumerable<AchievementPrereq> pre = (from u in dbc.AchievementPrereqs
                                          where u.RequiredAchievementID == ach.AchievementID && u.AchievementID == achievementGUID
                                          select u);
                    if (pre.Count<AchievementPrereq>() == 0)
                    {
                        AchPre.Add("depends", "0");
                    }
                    else
                    {
                        AchPre.Add("depends", "1");
                    }
                    finalAchList.Add(AchPre);
                }
                finalList.Add("Achievements", finalAchList);
                // load All tasks, then lookup each in achievementprereq to see if they are needed for achievement ID
                IEnumerable<TaskDefinition> tasks = (from u in dbc.TaskDefinitions
                                                           select u);
                foreach (TaskDefinition tsk in tasks)
                {
                    Dictionary<String, String> TaskPre = new Dictionary<string, string>();
                    TaskPre.Add("taskid", tsk.TaskID.ToString());
                    TaskPre.Add("taskname", tsk.TaskName);
                    IEnumerable<AchievementPrereq> pre = (from u in dbc.AchievementPrereqs
                                                          where u.TaskID == tsk.TaskID && u.AchievementID == achievementGUID
                                                          select u);
                    if (pre.Count<AchievementPrereq>() == 0)
                    {
                        TaskPre.Add("depends", "0");
                    }
                    else
                    {
                        TaskPre.Add("depends", "1");
                    }
                    finalTaskList.Add(TaskPre);
                }
            }
            finalList.Add("Tasks", finalTaskList);

            return finalList;
        }

        private Dictionary<String, Object> GetPrereqsForReward(string rewardid)
        {
            Guid RewardGUID = Guid.Parse(rewardid);
            Dictionary<String, Object> finalList = new Dictionary<string, object>();
            List<Object> finalAchList = new List<object>();
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                // load All achievements, then lookup each in achievementprereq to see if they are needed for achievement ID
                IEnumerable<AchievementDefinition> achs = (from u in dbc.AchievementDefinitions
                                                           select u);
                foreach (AchievementDefinition ach in achs)
                {
                    Dictionary<String, String> AchPre = new Dictionary<string, string>();
                    AchPre.Add("id", ach.AchievementID.ToString());
                    AchPre.Add("name", ach.AchievementName);
                    IEnumerable<RewardPrereq> pre = (from u in dbc.RewardPrereqs
                                                     where u.RequiredAchievement == ach.AchievementID && u.RewardID== RewardGUID
                                                          select u);
                    if (pre.Count<RewardPrereq>() == 0)
                    {
                        AchPre.Add("depends", "0");
                    }
                    else
                    {
                        AchPre.Add("depends", "1");
                    }
                    finalAchList.Add(AchPre);
                }
                finalList.Add("Achievements", finalAchList);
            }

            return finalList;
        }

        private Dictionary<String, Object> GetPrereqsForPilotClass(string pcid)
        {
            Guid PilotClassGUID = Guid.Parse(pcid);
            Dictionary<String, Object> finalList = new Dictionary<string, object>();
            List<Object> finalAchList = new List<object>();
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                // load All achievements, then lookup each in achievementprereq to see if they are needed for achievement ID
                IEnumerable<AchievementDefinition> achs = (from u in dbc.AchievementDefinitions
                                                           select u);
                foreach (AchievementDefinition ach in achs)
                {
                    Dictionary<String, String> AchPre = new Dictionary<string, string>();
                    AchPre.Add("id", ach.AchievementID.ToString());
                    AchPre.Add("name", ach.AchievementName);
                    IEnumerable<PilotClassPrereq> pre = (from u in dbc.PilotClassPrereqs
                                                     where u.AchievementID == ach.AchievementID && u.PilotClassID == PilotClassGUID
                                                     select u);
                    if (pre.Count<PilotClassPrereq>() == 0)
                    {
                        AchPre.Add("depends", "0");
                    }
                    else
                    {
                        AchPre.Add("depends", "1");
                    }
                    finalAchList.Add(AchPre);
                }
                finalList.Add("Achievements", finalAchList);
            }

            return finalList;
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