using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using MVC_Kutun.Components;

namespace MVC_Kutun.UIs
{
    public partial class register : System.Web.UI.UserControl
    {
        #region Declare
        Account acc = new Account();
        clsFormat fm = new clsFormat();
        SendMail send = new SendMail();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Attributes.Add("onkeypress", "return clickButton(event,'" + IbtnFinish.ClientID + "')");
            txtCaptcha.Attributes.Add("onkeypress", "return clickButton(event,'" + IbtnFinish.ClientID + "')");
            txtName.Attributes.Add("onkeypress", "return clickButton(event,'" + IbtnFinish.ClientID + "')");
        }
        protected void IbtnFinish_Click(object sender, EventArgs e)
        {
            try
            {
                string _sbody = string.Empty;
                string _email = txtEmail.Value;
                string _fullname = txtName.Value;
                string _pass = fm.MaHoaMatKhau(txtPassword1.Value);
                string _sCodeActive = fm.TaoChuoiTuDong(15);
                if (this.txtCaptcha.Text == this.Session["CaptchaImageText"].ToString())
                {
                    if (acc.Register(_fullname, _email, _pass))
                    {
                        #region Mail

                        _sbody += "";
                        _sbody += "<table align='center' border='0' cellpadding='0' cellspacing='0' width='600'>";
                        _sbody += "<tbody>";
                        _sbody += "<tr>";
                        _sbody += "<td colspan='3' style='background-color:#474747' align='center' height='11' valign=''><img style='display:block;margin:0px;padding:0px' height='11' width='600' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/holder-top.gif'></td>";
                        _sbody += "</tr><tr>";
                        _sbody += "<td style='background-color:#474747' align='left' height='1' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        _sbody += "<td style='background-color:#f0f0f0;font-size:11px' align='right' valign='' width='594'><table border='0' cellpadding='0' cellspacing='0'>";
                        _sbody += "  <tbody>";
                        _sbody += "    <tr>";
                        _sbody += "<td align='right' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        _sbody += "<td align='right' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        _sbody += "<td align='right' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        _sbody += "      <td style='font-size:11px' align='left' valign=''><a href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "default.html'><span>" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "</span></a></td>";
                        _sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        _sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        _sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        _sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        _sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        _sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        _sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";

                        _sbody += "<td style='font-size:11px' align='left' height='1' valign=''><a href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "default.html'><span>";
                        _sbody += "" + System.Configuration.ConfigurationManager.AppSettings["Hotline"] + "</span></a></td>";
                        _sbody += "<td align='left' height='1' valign=''><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_top-links.gif'></td>";
                        _sbody += "    </tr>";
                        _sbody += "  </tbody>";
                        _sbody += "</table></td>";
                        _sbody += "<td style='background-color:#474747' align='left' height='1' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        _sbody += "    </tr><tr>";
                        _sbody += "<td style='background-color:#474747' align='left' height='1' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        _sbody += "<td align='left' height='8' valign='' width='594'><img alt='' style='display:block;margin:0px;padding:0px' height='8' width='594' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/top-link_bottom-border.gif'></td>";
                        _sbody += "<td style='background-color:#474747' align='left' height='1' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        _sbody += "</tr><tr>";
                        _sbody += "<td style='background-color:#474747' align='left' height='1' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        _sbody += "<td style='background:#fff' align='left' valign='' width='594'><table border='0' cellpadding='0' cellspacing='0'>";
                        _sbody += "  <tbody>";
                        _sbody += "    <tr>";
                        _sbody += "      <td height='42'>&nbsp;</td>";
                        _sbody += "      <td align='left' height='42' valign='' width='170'><h1 style='margin:0'><a href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "' target='_blank'><span><img alt='BlauMail' style='display:block;margin:0px;padding:0px' border='0' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "vi-vn/Images/logo.png'></span></a></h1></td>";
                        _sbody += "      <td height='42'>&nbsp;</td>";
                        _sbody += "      <td style='font-size:11px' align='right' height='42' valign='' width='364'>Dịch vụ khách hàng - Hotline: <strong>" + System.Configuration.ConfigurationManager.AppSettings["Phone"] + "</strong></td>";
                        _sbody += "      <td height='42'>&nbsp;</td>";
                        _sbody += "    </tr>";
                        _sbody += "  </tbody>";
                        _sbody += "</table>";
                        _sbody += "<table border='0' cellpadding='0' cellspacing='0'>";
                        _sbody += "  <tbody>";
                        _sbody += "    <tr>";
                        _sbody += "      <td height='20' width='594'><img alt='' style='display:block;margin:0px;padding:0px' height='20' width='594' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/header-bottom-border.gif'></td>";
                        _sbody += "    </tr>";
                        _sbody += "  </tbody>";
                        _sbody += "</table></td>";
                        _sbody += "<td style='background-color:#474747' align='left' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        _sbody += "</tr>";
                        _sbody += "<tr>";
                        _sbody += "<td style='background-color:#474747' align='left' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        _sbody += "<td style='background:#fff' align='left' valign='' width='594'><table border='0' cellpadding='0' cellspacing='0'>";
                        _sbody += "  <tbody>";
                        _sbody += "    <tr>";
                        _sbody += "      <td align='left' valign='' width='20'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_content.gif'></td>";
                        _sbody += "      <td align='left' valign='' width='20'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_content.gif'></td>";
                        _sbody += "    </tr>";
                        _sbody += "  </tbody>";
                        _sbody += "</table>";
                        _sbody += "<table border='0' cellpadding='0' cellspacing='0' width='100%'>";
                        _sbody += "  <tbody>";
                        _sbody += "    <tr>";
                        _sbody += "      <td align='left' valign='' width='20'><img alt='' style='display:block;margin:0px;padding:0px' height='20' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_content.gif'></td>";
                        _sbody += "      <td align='left' valign='' width='100%'><h2 style='font-weight:bold;font-size:12px'>Thư xác nhận đăng ký tài khoản từ <a href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "' target='_blank'>Hotel24h</a></h2></td>";
                        _sbody += "      <td align='left' valign='' width='20'><img style='display:block;margin:0px;padding:0px' alt='' height='20' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_content.gif'></td>";
                        _sbody += "      <td align='left' valign='' width='20'><img style='display:block;margin:0px;padding:0px' alt='' height='20' width='20' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_content.gif'></td>";
                        _sbody += "    </tr>";
                        _sbody += "    <tr>";
                        _sbody += "      <td>&nbsp;</td>";
                        _sbody += "      <td style='line-height:26px;font-size:12px' align='left' valign='' width='360'><p style='margin:0px;padding:0px;text-align:justify'>Xin chào, <span style='font-size:14px; color:#006600; font-weight:bold'>" + _fullname + "</span> <br></p>";
                        _sbody += "        <p>Chúc mừng bạn đã đăng ký  thành công.<br />";
                        _sbody += "          Mọi chi tiết xin vui lòng  tham khảo tại website <a href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "'>" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "</a> hoặc liên hệ  bộ phận hỗ trợ trực tuyến qua số điện thoại " + System.Configuration.ConfigurationManager.AppSettings["Phone"] + " để  được hỗ trợ.<br />";
                        _sbody += "    <em>Rất hân hạnh được phục vụ</em></p>";

                        _sbody += "        <p align='right'>";
                        _sbody += "        </p>";
                        _sbody += "        <table border='0' cellpadding='0' cellspacing='0' width='100%'>";
                        _sbody += "          <tbody>";
                        _sbody += "            <tr>";
                        _sbody += "              <td style='color:red;font-size:11px'>Đây là mail được gửi tự động từ hệ thống của <b><a href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "' target='_blank'>" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "</a></b>, vui lòng không trả lời mail này !</td>";
                        _sbody += "              <td align='right' height='8' valign=''><img style='display:block;margin:0px;padding:0px' alt='' height='8' width='1' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_content.gif'></td>";
                        _sbody += "            </tr>";
                        _sbody += "          </tbody>";
                        _sbody += "      </table></td>";
                        _sbody += "    </tr>";
                        _sbody += "  </tbody>";
                        _sbody += "</table></td>";
                        _sbody += "<td style='background-color:#474747' align='left' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        _sbody += "</tr>";
                        _sbody += "<tr>";
                        _sbody += "<td style='background-color:#474747' align='left' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        _sbody += "<td style='background-color:#f0f0f0;line-height:18px;font-size:11px' align='left' valign='' width='594'><table border='0' cellpadding='0' cellspacing='0'>";
                        _sbody += "  <tbody>";
                        _sbody += "    <tr>";
                        _sbody += "      <td height='20' width='594'><img alt='' style='display:block;margin:0px;padding:0px' height='20' width='594' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/footer-top-border.gif'></td>";
                        _sbody += "    </tr>";
                        _sbody += "  </tbody>";
                        _sbody += "</table>";
                        _sbody += "</td>";
                        _sbody += "<td style='background-color:#474747' align='left' valign='' width='3'><img alt='' style='display:block;margin:0px;padding:0px' height='1' width='3' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/spacer_outer-border.gif'></td>";
                        _sbody += "</tr>";
                        _sbody += "<tr>";
                        _sbody += "<td colspan='3' style='background-color:#474747' align='center' height='11' valign=''><img style='display:block;margin:0px;padding:0px' height='11' width='600' src='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "/vi-vn/images/mail/holder-bottom.gif'></td>";
                        _sbody += "</tr>";
                        _sbody += "</tbody>";
                        _sbody += "</table>";

                        #endregion

                        send.SendMail_Active_Account(txtEmail.Value, "", "", _sbody);

                        //    Response.Redirect("~/vi-vn/deal/thong-bao.html");
                        string strScript = "<script>";
                        strScript += "alert(' Đăng ký thành công!');";
                        strScript += "window.location='/trang-chu.html';";
                        strScript += "</script>";
                        Page.RegisterClientScriptBlock("strScript", strScript);
                    }
                    else
                    {
                        Panel2.CssClass = Panel2.CssClass.Replace("hidden", "");
                        Labelerrors.Text = "Email này đã có người sử dụng!";
                    }
                }
                else
                {
                    Panel2.CssClass = Panel2.CssClass.Replace("hidden", "");
                    Labelerrors.Text = "Mã xác nhận không đúng!";
                }
            }
            catch (Exception)
            {
                
                throw;
            }
        }
    }
}