﻿using lessonweb.Data;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace lessonweb.web.pilotapp
{
    public partial class todo : System.Web.UI.Page
    {
        protected AppUser mUser = null;
        protected ArrayList TasksTodo= null;


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

            List<Guid> TaskIDs = PilotTask.GetToDos(mUser.UserEmail);
            TasksTodo = new ArrayList();
            foreach (Guid tid in TaskIDs)
            {
                TasksTodo.Add(TaskDefinition.getTaskDefinition(tid));
            }
        }
    }
}