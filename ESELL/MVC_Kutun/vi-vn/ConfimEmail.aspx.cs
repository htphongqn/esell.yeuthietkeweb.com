using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Web.UI.HtmlControls;
using Controller;

namespace MVC_Kutun.vi_vn
{
    public partial class ConfimEmail : System.Web.UI.Page
    {
        Config cf = new Config();
        Account acc = new Account();
        string code = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            code = Utils.CStrDef(Request["code"]);
            confimEmail();
            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
            }

            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            header.Title = "Thank you";
        }
        private void confimEmail()
        {
            if (!acc.activeAcc(code))
            {
                string strScript = "<script>";
                strScript += "alert(' Tài khoản của bạn đã được xác thực rồi!');";
                strScript += "window.location='/';";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript); 
            }
        }
    }
}