using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using System.Web.UI.HtmlControls;
using MVC_Kutun.Components;

namespace MVC_Kutun.MOBILE.vi_vn
{
    public partial class Sign_in : System.Web.UI.Page
    {
        #region Declare
        Payment_cart pay = new Payment_cart();
        Config cf = new Config();
        Account acc = new Account();
        clsFormat fm = new clsFormat();
        setCookieSignin setck = new setCookieSignin();
        #endregion
       
        protected void Page_Load(object sender, EventArgs e)
        {
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

            header.Title = "Đăng nhập";

        }

        protected void Lblogin_Click(object sender, EventArgs e)
        {
            if (acc.Login(txtemail.Value, fm.MaHoaMatKhau(txtpass.Value)))
            {
                setck.Addcookie(Utils.CStrDef(Session["User_ID"]));
                Response.Redirect("/");
            }
            else
            {
                string strScript = "<script>";
                strScript += "alert('Tài khoản hoặc mật khẩu không đúng');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
        }
    }
}