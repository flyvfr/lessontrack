using lessonweb.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.web
{
    class AchievementDeps
    {
        public String AchievementID { get; set; }
        public String[] Achievements { get; set; } 
        public String[] Tasks { get; set; }
    }

    /// <summary>
    /// Summary description for saveachievement
    /// </summary>
    public class saveachievementdeps : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string postData = new System.IO.StreamReader(context.Request.InputStream).ReadToEnd();
            AchievementDeps deps = JsonConvert.DeserializeObject<AchievementDeps>(postData);
            if (String.IsNullOrEmpty(deps.AchievementID)) return;

            using (DBClassesDataContext dc = new DBClassesDataContext())
            {
                try
                {
                    // first remove all existing prereqs for this ach
                    IEnumerable<AchievementPrereq> prereqs = (from u in dc.AchievementPrereqs
                       where u.AchievementID == Guid.Parse(deps.AchievementID)
                       select u);
                    if (prereqs.Count<AchievementPrereq>() > 0)
                    {
                        dc.AchievementPrereqs.DeleteAllOnSubmit(prereqs);
                    }

                    List<AchievementPrereq> newItems = new List<AchievementPrereq>();

                    foreach (String s in deps.Achievements)
                    {
                        AchievementPrereq newach = new AchievementPrereq();
                        newach.AchievementID = Guid.Parse(deps.AchievementID);
                        newach.RequiredAchievementID = Guid.Parse(s);
                        dc.AchievementPrereqs.InsertOnSubmit(newach);
                    }
                    foreach (String s in deps.Tasks)
                    {
                        AchievementPrereq newach = new AchievementPrereq();
                        newach.AchievementID = Guid.Parse(deps.AchievementID);
                        newach.TaskID = Guid.Parse(s);
                        dc.AchievementPrereqs.InsertOnSubmit(newach);
                    }


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