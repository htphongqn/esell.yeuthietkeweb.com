using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using MVC_Kutun.Components;
using vpro.functions;

namespace MVC_Kutun.Master
{
    public partial class Master : System.Web.UI.MasterPage
    {
        setCookieDevice setck = new setCookieDevice();
        protected void Page_Load(object sender, EventArgs e)
        {
            form1.Action = Request.RawUrl;
        }

        protected void lbchangedevice_Click(object sender, EventArgs e)
        {
            setck.Addcookie("itemmobile");
            string _url = Utils.CStrDef(Request["purl"]);
            if(!String.IsNullOrEmpty(_url))
                Response.Redirect("/"+_url+".html");
            else
                Response.Redirect("/");
        }
    }
}