using lessonweb.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.web
{
    /// <summary>
    /// Summary description for saveachievement
    /// </summary>
    public class saveachievement : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string achievementid = context.Request.Form["achievementid"];
            string achname = context.Request.Form["achievementname"];
            string achdesc = context.Request.Form["achievementdescription"];

            AchievementDefinition ach = new AchievementDefinition();

            using (DBClassesDataContext dc = new DBClassesDataContext())
            {
                try
                {
                    if (String.IsNullOrEmpty(achievementid))
                    {
                        dc.AchievementDefinitions.InsertOnSubmit(ach);
                        ach.AchievementID = Guid.NewGuid();
                    }
                    else
                    {
                        ach = (from u in dc.AchievementDefinitions
                               where u.AchievementID == Guid.Parse(achievementid)
                               select u).SingleOrDefault();
                    }
                    ach.AchievementName = achname;
                    ach.AchievementDesc = achdesc;

                    dc.SubmitChanges();
                }
                catch (Exception e)
                {

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