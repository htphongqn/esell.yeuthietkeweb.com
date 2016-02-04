using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVC_Kutun.Components;
using Controller;
using System.Web.UI.HtmlControls;
using vpro.functions;

namespace MVC_Kutun.vi_vn
{
    public partial class feedback : System.Web.UI.Page
    {
        #region Declare
        Config cf = new Config();
        SendMail sm = new SendMail();
        Function fun = new Function();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Loadtin();
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

            header.Title = "Phản hồi";
        }
        private void Loadtin()
        {
            Rptinnhan.DataSource = cf.loadlistcontact();
            Rptinnhan.DataBind();
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string _sEmailCC = string.Empty;
            string _sEmail = txtemail.Value;
            string _sName = txtname.Value;
            string _content = string.Empty;
            if (!String.IsNullOrEmpty(txtcontent_feed.Value))
                _content = txtcontent_feed.Value;
            else _content = txtcontent_email.Value;
            cf.Insert_contact(_sName, _sEmail, "", _content, "", "");
            string _mailBody = string.Empty;
            _mailBody += "<br/><br/><strong>Tên khách hàng</strong>: " + _sName;
            _mailBody += "<br/><br/><strong>Email</strong>: " + _sEmail;
            _mailBody += "<br/><br/><strong>Nội dung</strong>: " + _content + "<br/><br/>";
            string _sMailBody = string.Empty;
            _sMailBody += "Cám ơn quý khách: " + _sName + " đã đặt liên hệ với chúng tôi. Đây là email được gửi từ website của " + System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"] + " <br>" + _mailBody;
            _sEmailCC = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_TO : "";
            sm.SendEmailSMTP("Thông báo: Bạn đã liên hệ thành công", _sEmail, _sEmailCC, "", _sMailBody, true, false);
            string strScript = "<script>";
            strScript += "alert(' Đã gửi thành công!');";
            strScript += "window.location='/';";
            strScript += "</script>";
            Page.RegisterClientScriptBlock("strScript", strScript);
        }
        public string getDate(object date)
        {
            return fun.getDate(date);
        }
    }
}