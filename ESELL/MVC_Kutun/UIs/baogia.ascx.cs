using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Net.Mail;
using System.Drawing;

namespace MVC_Kutun.UIs
{
    public partial class baogia : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region Button Handler
        protected void lbtSendEmail_Click(object sender, EventArgs e)
        {

            if (this.Send_txtCapcha.Value != this.Session["CaptchaImageText"].ToString())
            {
                Send_lblResult.ForeColor = Color.Red;
                Send_lblResult.Text = "Mã bảo vệ không đúng.";
                //mp1.Show();
            }
            else
            {
                string strEmailBody = "";
                string url = Request.RawUrl;

                strEmailBody = "<html><body>";
                //strEmailBody += "Chào  " !<br>";
                strEmailBody += Send_txtFullname.Value + " (<a href='mailto:" + Send_txtEmail.Value + "'>" + Send_txtEmail.Value + "</a>) gửi cho bạn thông tin này.<br/>Với lời nhắn : <br/>" + Send_txtContent.Value + "<br/>Click vào đường link bên dưới để xem nội dung chi tiết.<br>";
                //strEmailBody += "<a href='" + url + "'>" + url + "</a>";
                strEmailBody += "<a href='" + Request.ServerVariables["HTTP_REFERER"] + "'>" + Request.ServerVariables["HTTP_REFERER"] + "</a>";
                strEmailBody += "</body></html>";

                SendEmailSMTP("Vui lòng ghé thăm website ", Send_txtEmailTo.Value, Send_txtEmailCC.Value, "", strEmailBody, true, false);
                if (!string.IsNullOrEmpty(Request.ServerVariables["HTTP_REFERER"]))
                    Response.Redirect(Request.ServerVariables["HTTP_REFERER"]);
            }
        }

        public void SendEmailSMTP(string strSubject, string toAddress, string ccAddress, string bccAddress, string body, bool isHtml, bool isSSL)
        {
            try
            {
                using (MailMessage mail = new MailMessage())
                {
                    mail.From = new MailAddress(Utils.CStrDef(System.Configuration.ConfigurationManager.AppSettings["Email"]), Utils.CStrDef(System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"]));
                    mail.To.Add(toAddress);
                    if (ccAddress != "")
                    {
                        mail.CC.Add(ccAddress);
                    }
                    if (bccAddress != "")
                    {
                        mail.Bcc.Add(bccAddress);
                    }
                    mail.Subject = strSubject;

                    string str = body;
                    mail.Body = str;
                    mail.IsBodyHtml = isHtml;
                    SmtpClient client = new SmtpClient();
                    client.EnableSsl = isSSL;
                    client.Host = Utils.CStrDef(System.Configuration.ConfigurationManager.AppSettings["EmailHost"]);
                    client.Port = Utils.CIntDef(System.Configuration.ConfigurationManager.AppSettings["EmailPort"]);
                    client.Credentials = new System.Net.NetworkCredential(Utils.CStrDef(System.Configuration.ConfigurationManager.AppSettings["Email"]), Utils.CStrDef(System.Configuration.ConfigurationManager.AppSettings["EmailPassword"]));

                    client.Send(mail);
                }
            }
            catch (SmtpException ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        private void SendEmailToFriend()
        {
            try
            {
                string strEmailSubject = "";
                string strEmailBody = "";
                string url = Request.RawUrl;

                strEmailSubject = "Vui lòng ghé thăm website";
                strEmailBody = "<html><body>";
                //strEmailBody += "Chào  " !<br>";
                strEmailBody += Send_txtFullname.Value + " (<a href='mailto:" + Send_txtEmail.Value + "'>" + Send_txtEmail.Value + "</a>) gửi cho bạn thông tin này.<br/>Với lời nhắn : <br/>" + Send_txtContent.Value + "<br/>Click vào đường link bên dưới để xem nội dung chi tiết.<br>";
                //strEmailBody += "<a href='" + url + "'>" + url + "</a>";
                strEmailBody += "<a href='" + Request.ServerVariables["HTTP_REFERER"] + "'>" + Request.ServerVariables["HTTP_REFERER"] + "</a>";
                strEmailBody += "</body></html>";

                clsMail.SendMailNet(Send_txtEmailTo.Value, Send_txtEmailCC.Value, "", strEmailSubject, strEmailBody, true, true);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #endregion
    }
}