using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class CompletionLog
    {
        internal static IEnumerable<CompletionLog> LoadStudentLog(DBClassesDataContext dbc, string optionalStudent)
        {
            IEnumerable<CompletionLog> log = (from u in dbc.CompletionLogs
                                 where (u.Student == optionalStudent)
                                 select u);
            return log;
        }

        internal void SetLessonAndStage(string lessonGUID)
        {
            try
            {
                String[] comps = lessonGUID.Split(new char[] { ':' });
                int StageID = int.Parse(comps[0]);
                int LID = int.Parse(comps[1]);
                STAGEID = StageID;
                LESSONID = LID;
            }
            catch { }
        }
    }
}