using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using MVC_Kutun.Components;
using System.Web.UI.HtmlControls;
using vpro.functions;

namespace MVC_Kutun.MOBILE.vi_vn
{
    public partial class Forget_pass : System.Web.UI.Page
    {
        #region Declare
        Payment_cart pay = new Payment_cart();
        Config cf = new Config();
        Account acc = new Account();
        clsFormat fm = new clsFormat();
        SendMail send = new SendMail();
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

            header.Title = "Quên mật khẩu";

        }

       

        protected void Lbforget_Click(object sender, EventArgs e)
        {
            string url = Request.UrlReferrer.AbsolutePath;
            Session["urlrefer"]=url;
            string _email = txtemail.Value;
            if (this.Textcapchaforget.Value == this.Session["CaptchaImageText"].ToString())
            {

                if (acc.Check_email(_email))
                {
                    string _matKhau = fm.TaoChuoiTuDong(7);
                    acc.Sendpass(_email,fm.MaHoaMatKhau(_matKhau));
                    send.SendMail_RecoverPassword(_email, _matKhau, acc.Name);
                    string strScript = "<script>";
                    strScript += "alert(' Chúng tôi đã gửi mật khẩu đến email của bạn!');";
                    strScript += "window.location='/';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
                else Lbforgeterrors.Text = "Email không tồn tại";
            }
            else
            {
                Lbforgeterrors.Text = "Mã Xác Nhận Không Đúng";
            }
        }
    }
}