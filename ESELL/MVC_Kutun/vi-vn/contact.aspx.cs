using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVC_Kutun.Components;
using System.IO;
using vpro.functions;
using System.Web.UI.HtmlControls;
using Controller;

namespace MVC_Kutun.vi_vn
{
    public partial class contact : System.Web.UI.Page
    {
        #region Declare
        Config cf = new Config();
        SendMail sm = new SendMail();
        #endregion
        Get_session getsession = new Get_session();
        setCookieDevice setckdv = new setCookieDevice();
        int device = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = setckdv.GetCookie();
            string devicechar = Request.UserAgent.ToLower();
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
            else if (Request.Browser.IsMobileDevice || devicechar.Contains("mobile") || devicechar.Contains("ipad"))
            {
                device = 1;
            }
            if (device == 1) Response.Redirect("/m-lien-he.html");

            if (!IsPostBack)
            {
                Show_File_HTML("contact-vi.htm",0);
                Show_File_HTML("contact-e.htm",1);
            }
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

            header.Title = "Liên hệ";
        }
        private void Show_File_HTML(string HtmlFile,int type)
        {
            string pathFile;
            string strHTMLContent;
            pathFile = Server.MapPath("../Data/contact/" + HtmlFile);

            if ((File.Exists(pathFile)))
            {
                StreamReader objNewsReader;
                objNewsReader = new StreamReader(pathFile);
                strHTMLContent = objNewsReader.ReadToEnd();
                objNewsReader.Close();
                if(type==0)
                Literal1.Text = strHTMLContent;
                else Literal2.Text = strHTMLContent;
            }
           

        }


        protected void Lbthanhtoan_Click(object sender, EventArgs e)
        {
            try
            {

                if (this.txtCapcha.Value != this.Session["CaptchaImageText"].ToString())
                {
                    lblresult.Text = "Mã bảo vệ không đúng.";
                    //mp1.Show();
                }
                else
                {

                    string _sEmailCC = string.Empty;
                    string _sEmail = txtEmail.Value;
                    string _sName = Txtname.Value;
                    string _add = Txtaddress.Value;
                    string _phone = Txtphone.Value;
                    string _content = txtContent.Value;
                    string _title = txttitle.Value;
                    cf.Insert_contact(_sName, _sEmail, _title, _content, _add, _phone);
                    string _mailBody = string.Empty;
                    _mailBody += "<br/><br/><strong>Tên khách hàng</strong>: " + _sName;
                    _mailBody += "<br/><br/><strong>Email</strong>: " + _sEmail;
                    _mailBody += "<br/><br/><strong>Số điện thoại</strong>: " + _phone;
                    _mailBody += "<br/><br/><strong>Địa chỉ</strong>: " + _add;
                    _mailBody += "<br/><br/><strong>Tiêu đề</strong>: " + _title;
                    _mailBody += "<br/><br/><strong>Nội dung</strong>: " + _content + "<br/><br/>";
                    string _sMailBody = string.Empty;
                    _sMailBody += "Cám ơn quý khách: " + _sName + " đã đặt liên hệ với chúng tôi. Đây là email được gửi từ website của " + System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"] + " <br>" + _mailBody;
                    _sEmailCC = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_TO : "";
                    sm.SendEmailSMTP("Thông báo: Bạn đã liên hệ thành công", _sEmail, "", _sEmailCC, _sMailBody, true, false);
                    string strScript = "<script>";
                    strScript += "alert(' Đã gửi thành công!');";
                    strScript += "window.location='/';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}