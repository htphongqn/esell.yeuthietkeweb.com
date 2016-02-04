using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using MVC_Kutun.Components;

namespace MVC_Kutun.vi_vn
{
    /// <summary>
    /// Summary description for Ajaxallservice
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Ajaxallservice : System.Web.Services.WebService
    {
        setCookieRating setck = new setCookieRating();
        Checkcookie ckie = new Checkcookie();
        [WebMethod]
        public string addRatting(string seourl, string score)
        {
            List<string> l = ckie.Listcookie_Rating();
            List<string> url=new List<string>();
            foreach (string s in l)
            {
                string []a = s.Split(',');
                if (a.Length == 2)
                    url.Add(a[0]);
            }
            if (!url.Contains(seourl))
            {
                setck.Addcookie(seourl + "," + score);
                return "success";
            }
            return "errors";
            
        }
    }
}
