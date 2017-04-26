using lessonweb.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.web
{
    class RewardDeps
    {
        public String RewardID { get; set; }
        public String[] Achievements { get; set; } 
    }

    /// <summary>
    /// Summary description for saveachievement
    /// </summary>
    public class saverewarddeps : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string postData = new System.IO.StreamReader(context.Request.InputStream).ReadToEnd();
            RewardDeps deps = JsonConvert.DeserializeObject<RewardDeps>(postData);
            if (String.IsNullOrEmpty(deps.RewardID)) return;

            using (DBClassesDataContext dc = new DBClassesDataContext())
            {
                try
                {
                    // first remove all existing prereqs for this ach
                    IEnumerable<RewardPrereq> prereqs = (from u in dc.RewardPrereqs
                                                         where u.RewardID == Guid.Parse(deps.RewardID)
                                                        select u);
                    if (prereqs.Count<RewardPrereq>() > 0)
                    {
                        dc.RewardPrereqs.DeleteAllOnSubmit(prereqs);
                    }

                    List<RewardPrereq> newItems = new List<RewardPrereq>();

                    foreach (String s in deps.Achievements)
                    {
                        RewardPrereq newach = new RewardPrereq();
                        newach.RewardID= Guid.Parse(deps.RewardID);
                        newach.RequiredAchievement= Guid.Parse(s);
                        dc.RewardPrereqs.InsertOnSubmit(newach);
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