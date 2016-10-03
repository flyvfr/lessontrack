﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class LESSONITEM
    {
        public bool IsComplete = false; // incomplete by default
        public DateTime? CompletedOn = null;
        public string Instructor = null;

        /**
         * See if there is a completion record for this student
         */
        public void LoadStudentStatus(IEnumerable<CompletionLog> loglist, string studentID)
        {
            CompletionLog log = null;
            // look in the list for the log for this lessonguid.
            foreach (CompletionLog l in loglist)
            {
                if (l.LessonGUID == LESSONGUID)
                {
                    log = l;
                    break;
                }
            }

            if (log == null)
            {
                IsComplete = false;
                return;
            }
            // load the completion details
            IsComplete = true;
            CompletedOn = log.DateCompleted;
            Instructor = log.Instructor;
        }
    }
}