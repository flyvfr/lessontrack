using lessonweb.Data;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace lessonweb.web
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class AddTaskComplete : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string email = context.Request.Params["email"];
            string taskid = context.Request.Params["taskid"];
            string reviewer = context.Request.Params["reviewer"];
            string date = context.Request.Params["date"];

            PilotTask task = new PilotTask();

            using (DBClassesDataContext dc = new DBClassesDataContext())
            {
                try
                {
                    task = (from u in dc.PilotTasks
                            where u.TaskID == Guid.Parse(taskid) && u.PilotEmail == email
                            select u).SingleOrDefault();
                    if (task == null)
                    {
                        task = new PilotTask();
                        task.TaskID = Guid.Parse(taskid);
                        task.PilotEmail = email;
                        dc.PilotTasks.InsertOnSubmit(task);
                        task.DateAdded = DateTime.Now;
                    }
                    task.InstructorEmail = reviewer;
                    try
                    {
                        task.DateCompleted = DateTime.Parse(date);
                    }
                    catch { task.DateCompleted = DateTime.Today; }

                    task.IsCompleted = true;
                    task.IsVerified = true; // for now no need to verify

                    dc.SubmitChanges();
                    // this is the right time to now look at the achievements and rewards and pilot levels this entails.
                    ProcessTaskDependents(dc, task.TaskID, email);
                }
                catch (Exception e){
                   
                }
            }
        }

        /// <summary>
        /// See all the achievements that are unlocked by this task. if they arent already conferred, confer them
        /// Recalculate rewards unlocked by the achievement, if they arent already conferred, confer them
        /// Recalculate Pilot levels unlocked by the achievement if they arent already conferred, confer them
        /// </summary>
        /// <param name="dc"></param>
        /// <param name="taskID"></param>
        /// <param name="email"></param>
        private void ProcessTaskDependents(DBClassesDataContext dc, Guid taskID, string email)
        {
            // recalculate achievements for this pilot
            List<Guid> Achievements = RecalculateAchievements(dc, email);

            // save these achievements
            if (Achievements.Count > 0)
            {
                PilotAchievement.saveAchievements(dc, email, Achievements);
            }
            dc.SubmitChanges();

            // Now calculate all rewards which are unlocked by this achievement
            List<Guid> Rewards = RecalculateRewards(dc, email, Achievements);
            if (Rewards.Count > 0)
            {
                PilotReward.saveRewards(dc, email, Rewards);
            }

            dc.SubmitChanges();

            // Now calculate all rewards which are unlocked by this achievement
            List<Guid> Levels= RecalculateLevels(dc, email, Achievements);
            if (Rewards.Count > 0)
            {
                PilotClass.saveClasses(dc, email, Levels);
            }
            dc.SubmitChanges();
        }

        /// <summary>
        /// recalculate the list of pilot levels for these achievements
        /// </summary>
        /// <param name="dc"></param>
        /// <param name="email"></param>
        /// <param name="achievements"></param>
        private List<Guid> RecalculateLevels(DBClassesDataContext dc, string email, List<Guid> achievements)
        {
            // get the achivement id list for achievements which have a task that is not verified
            List<Guid> unfulfilled = (from u in dc.PilotClassPrereqs
                                      where u.AchievementID != null && !achievements.Contains((Guid)u.AchievementID)
                                      select u.PilotClassID).Distinct().ToList();
            List<Guid> fulfilled = (from u in dc.PilotClassPrereqs
                                    where !unfulfilled.Contains((Guid)u.PilotClassID)
                                    select u.PilotClassID).Distinct().ToList();
            // these are the fulfilled rewards
            return fulfilled;
        }

        /// <summary>
        /// recalculate the list of rewards for these achievements
        /// </summary>
        /// <param name="dc"></param>
        /// <param name="email"></param>
        /// <param name="achievements"></param>
        private List<Guid> RecalculateRewards(DBClassesDataContext dc, string email, List<Guid> achievements)
        {
            // get the achivement id list for achievements which have a task that is not verified
            List<Guid> unfulfilled = (from u in dc.RewardPrereqs
                                      where u.RequiredAchievement != null && !achievements.Contains((Guid)u.RequiredAchievement)
                                      select u.RewardID).Distinct().ToList();
            List<Guid> fulfilled = (from u in dc.RewardPrereqs
                                    where !unfulfilled.Contains((Guid)u.RewardID)
                                    select u.RewardID).Distinct().ToList();
            // these are the fulfilled rewards
            return fulfilled;
        }

        /// <summary>
        /// get the list of achievements for this pilot.
        /// </summary>
        /// <param name="dc"></param>
        /// <param name="email"></param>
        /// <returns></returns>
        private static List<Guid> RecalculateAchievements(DBClassesDataContext dc, string email)
        {
            List<Guid> verifiedTasks = PilotTask.getVerifiedTasksIDsForPilot(email);
            // get the achivement id list for achievements which have a task that is not verified
            List<Guid> unfulfilled = (from u in dc.AchievementPrereqs
                                      where u.TaskID != null && !verifiedTasks.Contains((Guid)u.TaskID)
                                      select u.AchievementID).Distinct().ToList();
            // get the achievement id list for achievements that are NOT in the list of unfulfilled.
            // these are potentially fulfilled.
            List<Guid> fulfilled = (from u in dc.AchievementPrereqs
                                    where !unfulfilled.Contains((Guid)u.AchievementID)
                                    select u.AchievementID).Distinct().ToList();
            List<Guid> achieved = new List<Guid>();
            foreach (Guid g in fulfilled)
            {
                // prerequired achievements for this item
                List<Guid> prereqAch = (from u in dc.AchievementPrereqs
                                        where u.RequiredAchievementID != null
                                        select (Guid)u.RequiredAchievementID).Distinct().ToList();
                // if all items in prereqAch is present in the fulfilled list, this is achieved
                bool bachieved = true;
                foreach (Guid pre in prereqAch)
                {
                    if (!fulfilled.Contains(pre))
                    {
                        bachieved = false;
                        break;
                    }
                }
                if (bachieved) achieved.Add(g);
            }
            return achieved;
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