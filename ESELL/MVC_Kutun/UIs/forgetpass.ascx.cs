using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using MVC_Kutun.Components;
using vpro.functions;

namespace MVC_Kutun.UIs
{
    public partial class forgetpass : System.Web.UI.UserControl
    {
        #region Declare
        Account acc = new Account();
        SendMail send = new SendMail();
        clsFormat fm = new clsFormat();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            div3.Visible = true;
            Label1.Visible = false;
            div5.Visible = false;
        }
        protected void Lbforgetpass_Click(object sender, EventArgs e)
        {
            try
            {
                Panel3.CssClass = Panel3.CssClass.Replace("hidden", "");
                string _email=Txtmailforget.Value;
                if (this.Textcapchaforget.Text == this.Session["CaptchaImageText"].ToString())
                {

                    if (acc.Check_email(_email))
                    {
                         string _matKhau = fm.TaoChuoiTuDong(7);

                         acc.Sendpass(_email, fm.MaHoaMatKhau(_matKhau));
                         send.SendMail_RecoverPassword(_email, _matKhau, acc.Name);
                         div3.Visible = false;
                         div5.Visible = true;
                    }
                    else Lbforgeterrors.Text = "Địa chỉ email không tồn tại";
                }
                else
                {
                    Lbforgeterrors.Text = "Mã bảo vệ nhập không đúng";
                }

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}