using lessonweb.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.web
{
    /// <summary>
    /// Summary description for savepilotclass
    /// </summary>
    public class savepilotclass : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string pilotclassid = context.Request.Form["pilotclassid"];
            string achname = context.Request.Form["pilotclassname"];
            string achdesc = context.Request.Form["pilotclassdescription"];

            PilotClassDefinition ach = new PilotClassDefinition();

            using (DBClassesDataContext dc = new DBClassesDataContext())
            {
                try
                {
                    if (String.IsNullOrEmpty(pilotclassid))
                    {
                        dc.PilotClassDefinitions.InsertOnSubmit(ach);
                        ach.PilotClassID = Guid.NewGuid();
                    }
                    else
                    {
                        ach = (from u in dc.PilotClassDefinitions
                               where u.PilotClassID== Guid.Parse(pilotclassid)
                               select u).SingleOrDefault();
                    }
                    ach.PilotClassName = achname;
                    ach.PilotClassDescription = achdesc;

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