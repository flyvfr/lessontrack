using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace lessonweb.Data
{
    public class Utils
    {
        public static T CloneObject<T>(T srcObject) where T : class, new()
        {
            // Get the object type
            Type objectType = typeof(T);

            // Get the public properties of the object
            PropertyInfo[] propInfo = srcObject.GetType()
               .GetProperties(
                  System.Reflection.BindingFlags.Instance |
                  System.Reflection.BindingFlags.Public
               );

            // Create a new  object
            T newObject = new T();

            // Loop through all the properties and copy the information 
            // from the source object to the new instance
            foreach (PropertyInfo p in propInfo)
            {
                Type t = p.PropertyType;
                if ((t.IsValueType || t == typeof(string)) && (p.CanRead) && (p.CanWrite))
                {
                    p.SetValue(newObject, p.GetValue(srcObject, null), null);
                }
            }

            // Return the cloned object.
            return newObject;
        }
    }
}