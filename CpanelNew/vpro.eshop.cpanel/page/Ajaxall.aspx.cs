using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using vpro.eshop.cpanel.Components;
using vpro.functions;

namespace vpro.eshop.cpanel.page
{
    public partial class Ajaxall : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static bool addCookiecheck(string checkid, string typecheck)
        {
            try
            {
               // setck.Addcookie(checkid);
                int _typec = Utils.CIntDef(typecheck);
                List<string> lid = new List<string>();
                if (HttpContext.Current.Session["lnewsid"] == null)
                {
                    lid.Add(checkid);
                    HttpContext.Current.Session["lnewsid"] = lid;
                }
                else
                {
                    lid = (List<string>)HttpContext.Current.Session["lnewsid"];
                    if (_typec == 1)
                        lid.Add(checkid);
                    else
                        lid.Remove(checkid);
                    HttpContext.Current.Session["lnewsid"] = lid;
                }
               
                return true;
            }
            catch (Exception)
            {

                return false;
            }
            
        }
    }
}