using lessonweb.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.web
{
    class PilotClassDeps
    {
        public String PilotClassID { get; set; }
        public String[] Achievements { get; set; } 
    }

    /// <summary>
    /// Summary description for saveachievement
    /// </summary>
    public class savepilotclassdeps : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string postData = new System.IO.StreamReader(context.Request.InputStream).ReadToEnd();
            PilotClassDeps deps = JsonConvert.DeserializeObject<PilotClassDeps>(postData);
            if (String.IsNullOrEmpty(deps.PilotClassID)) return;

            using (DBClassesDataContext dc = new DBClassesDataContext())
            {
                try
                {
                    // first remove all existing prereqs for this ach
                    IEnumerable<PilotClassPrereq> prereqs = (from u in dc.PilotClassPrereqs
                                                         where u.PilotClassID == Guid.Parse(deps.PilotClassID)
                                                        select u);
                    if (prereqs.Count<PilotClassPrereq>() > 0)
                    {
                        dc.PilotClassPrereqs.DeleteAllOnSubmit(prereqs);
                    }

                    List<PilotClassPrereq> newItems = new List<PilotClassPrereq>();

                    foreach (String s in deps.Achievements)
                    {
                        PilotClassPrereq newach = new PilotClassPrereq();
                        newach.PilotClassID= Guid.Parse(deps.PilotClassID);
                        newach.AchievementID= Guid.Parse(s);
                        dc.PilotClassPrereqs.InsertOnSubmit(newach);
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