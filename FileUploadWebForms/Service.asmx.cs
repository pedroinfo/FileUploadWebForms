using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace FileUploadWebForms
{
    /// <summary>
    /// Summary description for Service
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Service : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public void Upload()
        {
            HttpFileCollection Files = HttpContext.Current.Request.Files;
            string path = HttpContext.Current.Server.MapPath("~/App_Data/");

            for (int i = 0; i < Files.Count; i++)
            {
                HttpPostedFile File = Files[i];

                
                string fileName = File.FileName + Guid.NewGuid().ToString();
                string extension = Path.GetExtension(File.FileName);
                
                
                File.SaveAs(Path.Combine(path, String.Concat(fileName, extension)));

            }
        }
    }
}
