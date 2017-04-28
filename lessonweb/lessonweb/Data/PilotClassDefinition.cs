using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace lessonweb.Data
{
    public partial class PilotClassDefinition
    {
        // if the user exists and is valid, return the user, else return null
        internal static PilotClassDefinition getPilotClassDefinition(Guid defid)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                PilotClassDefinition ach = (from u in dbc.PilotClassDefinitions
                                            where u.PilotClassID == defid
                                            select u).SingleOrDefault();

                return ach;
            }
        }

        public static IEnumerable<PilotClassDefinition> getAll()
        {
            DBClassesDataContext dbc = new DBClassesDataContext();
            IEnumerable<PilotClassDefinition> ach = (from u in dbc.PilotClassDefinitions
                                                     select u);

            return ach.ToList();
        }

        internal static void delete(Guid achID)
        {
            using (DBClassesDataContext dbc = new DBClassesDataContext())
            {
                PilotClassDefinition ach = (from u in dbc.PilotClassDefinitions
                                            where u.PilotClassID == achID
                                      select u).SingleOrDefault();
                if (ach != null)
                {
                    dbc.PilotClassDefinitions.DeleteOnSubmit(ach);
                    dbc.SubmitChanges();
                }
            }
        }
    }
}