using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using vpro.functions;
using Controller;
using MVC_Kutun.Components;

namespace MVC_Kutun.vi_vn
{
    public partial class Home : System.Web.UI.Page
    {
        #region declare
        Config cf = new Config();
        int device = 0;
        setCookieDevice setckdv = new setCookieDevice();
        #endregion
        protected void Page_PreInit(object sender, EventArgs e)
        {
            HttpCookie cookie = setckdv.GetCookie();
            if (Request.Cookies["deviceck"] != null)
            {
                if (cookie.HasKeys)
                {
                    device = 1;
                }
                else if (Request.Browser.IsMobileDevice)
                {
                    device = 1;
                }
            }
            else if (Request.Browser.IsMobileDevice)
            {
                device = 1;
            }
            if (device == 0) Page.MasterPageFile = "/Master/Master.Master";
            else Page.MasterPageFile = "/MOBILE/Master/Master.Master";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            headerDes.Name = "Description";
            headerKey.Name = "Keywords";
            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
                header.Title = _configs.ToList()[0].CONFIG_TITLE;

                headerDes.Content = _configs.ToList()[0].CONFIG_DESCRIPTION;
                header.Controls.Add(headerDes);

                headerKey.Content = _configs.ToList()[0].CONFIG_KEYWORD;
                header.Controls.Add(headerKey);
            }
            else
            {
                header.Title = "Enews Standard V1.0";

                headerDes.Content = "Enews Standard V1.0";
                header.Controls.Add(headerDes);

                headerKey.Content = "Enews Standard V1.0";
                header.Controls.Add(headerKey);
            }
            UserControl main = null;
            if (device == 0)
                main = Page.LoadControl("/Uis/main.ascx") as UserControl;
            else
                main = Page.LoadControl("/MOBILE/Uis/main.ascx") as UserControl;
            Plmain.Controls.Add(main);
        }
    }
}