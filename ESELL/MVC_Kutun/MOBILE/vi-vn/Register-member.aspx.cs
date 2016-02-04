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
using System.Data;
using System.Text;

namespace MVC_Kutun.MOBILE.vi_vn
{
    public partial class Register_member : System.Web.UI.Page
    {
        #region Declare
        Account acc = new Account();
        Config cf = new Config();
        clsFormat fm = new clsFormat();
        SendMail send = new SendMail();
        Userinfo user = new Userinfo();
        Propertity per = new Propertity();
        Register_email rg = new Register_email();
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

            header.Title = "Đăng ký thành viên";
            
            if (!IsPostBack)
            {
                
                Load_city();
                Load_distric(-1);
                loadYear();
                loadMonth();
                loadDay();
               
            }
        }
        #region load birth
        private void loadYear()
        {
            for (int i = 1900; i <= DateTime.Now.Year; i++)
            {
                ListItem l = new ListItem();
                l.Value = i.ToString();
                l.Text = i.ToString();
                Dryear.Items.Add(l);
            }
            ListItem s = new ListItem("Năm", "0");
            s.Selected = true;
            Dryear.Items.Insert(0, s);
        }
        private void loadMonth()
        {
            for (int i = 1; i <= 12; i++)
            {
                ListItem l = new ListItem();
                l.Value = i.ToString();
                l.Text = i.ToString();
                Drmoth.Items.Add(l);
            }
            ListItem s = new ListItem("Tháng", "0");
            s.Selected = true;
            Drmoth.Items.Insert(0, s);
        }
        private void loadDay()
        {
            int _month = Utils.CIntDef(Drmoth.SelectedValue);
            int[] leday = new int[] { 1, 3, 5, 7, 8, 10, 12 };
            int limitday = 30;
            if (leday.Contains(_month))
                limitday = 31;
            else if (_month == 2)
                limitday = 28;
            for (int i = 1; i <= 31; i++)
            {
                ListItem l = new ListItem();
                l.Value = i.ToString();
                l.Text = i.ToString();
                Drday.Items.Add(l);
            }
            ListItem s = new ListItem("Ngày sinh", "0");
            s.Selected = true;
            Drday.Items.Insert(0, s);
        }
        protected void Drmoth_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadDay();
        }
        #endregion
        #region Area
        private void Load_city()
        {
            Drcity.DataValueField = "PROP_ID";
            Drcity.DataTextField = "PROP_NAME";
            Drcity.DataSource = user.Loadcity();
            Drcity.DataBind();
            ListItem l = new ListItem("---Chọn tỉnh/thành phố---", "0");
            l.Selected = true;
            Drcity.Items.Insert(0, l);
        }
        private void Load_distric(int id)
        {
            var list = user.Loaddistric(id);
            if (list.Count > 0)
            {
                Drdistric.DataValueField = "PROP_ID";
                Drdistric.DataTextField = "PROP_NAME";
                Drdistric.DataSource = list;
                Drdistric.DataBind();
                ListItem l = new ListItem("---Chọn quận/huyện---", "0");
                l.Selected = true;
                Drdistric.Items.Insert(0, l);
            }
            else
            {
                DataTable dt = new DataTable("Newtable");

                dt.Columns.Add(new DataColumn("PROP_ID"));
                dt.Columns.Add(new DataColumn("PROP_NAME"));

                DataRow row = dt.NewRow();
                row["PROP_ID"] = "0";
                row["PROP_NAME"] = "---Chọn quận/huyện---";
                dt.Rows.Add(row);

                Drdistric.DataTextField = "PROP_NAME";
                Drdistric.DataValueField = "PROP_ID";
                Drdistric.DataSource = dt;
                Drdistric.DataBind();

            }
        }
        protected void Drcity_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtPassword1.Attributes.Add("value", txtPassword1.Text);
            txtRePassword.Attributes.Add("value", txtRePassword.Text);
            int id = Utils.CIntDef(Drcity.SelectedValue);
            Load_distric(id);
            Drdistric.Focus();
           
        }
        #endregion
        private string getImgLogo()
        {
            var list = per.Load_logo_or_sologan("1", 1);
            if (list.Count > 0)
            {
                if (!String.IsNullOrEmpty(list[0].BANNER_FILE))
                    return PathFiles.GetPathBanner(list[0].BANNER_ID) + "/" + list[0].BANNER_FILE;
            }
            return string.Empty;
        }
        private void addEmail(string email,int _active)
        {
            rg.Add_email(email,_active);
        }
        private string htmlEmailRegister(string _username, string _email, string _code)
        {
            
            StringBuilder _res = new StringBuilder();
            string _imglogo = getImgLogo();
            _res.Append("<body style='padding: 0;margin: 0;font: normal 13px/1.5 Arial, Helvetica, sans-serif;color: #333333'>");
            _res.Append("<div style='background: #f4f3f3; width: 100%'>");
            _res.Append("<div class='wrap head' style='background: #f4f3f3; width: 100%;padding: 10px 0'> <a href=''><img src='http://esell.vn" + _imglogo + "' alt='' width='150' /></a> <span class='hotline' style='float: right;color: #FF0000;font-size: 18px;background: url(http://esell.vn/vi-vn/Images/phone_ico.png) 0 center no-repeat;padding-left: 28px;margin-top: 10px;'><b>(848) 39 483 961 </b></span> </div>");
            _res.Append("</div>");
            _res.Append("<div class='wrap' style='width: 600px;margin: 0 auto'>");
            _res.Append("<p><strong>Chào " + _username + ",</strong></p>");
            _res.Append("<p>Cảm ơn Bạn đã đăng ký thành viên trang <a href='http://www.esell.vn'>www.esell.vn</a></p>");
            _res.Append("<p>Bạn vui lòng xác nhận thành viên của Esell.vn bằng cách click vào đường");
            _res.Append("link này: <a href='http://www.esell.vn/xac-thuc-email.html?code=" + _code + "'>http://www.esell.vn/xac-thuc-email.html?code=" + _code + "</a></p>");
            _res.Append("<p>Esell.vn dành tặng bạn  trải nghiệm mua sắm ĐẦU TIÊN với ưu đãi CỰC HOT. Kiểm tra email của Bạn ngay  nhé! </p>");
            _res.Append("<p>" + _username + " nhất định sẽ  có những trải nghiệm mua sắm online đầy thú vị trên <a href='http://www.esell.vn'>www.esell.vn</a>. </p>");
            _res.Append("</div>");
            _res.Append("<div style='background: #414141; text-align: center; padding: 5px 0; color: #FFFFFF'>");
            _res.Append("<div class='wrap'>");
            _res.Append("<p><strong>Chúng tôi luôn sẵn sàng hỗ trợ bạn qua email <a href='mailto:info@esell.vn' style='color: #FFFFFF'>info@esell.vn</a> và hotline: 0918 856 738</strong></p>");
            _res.Append("<p style='font-size:11px'><strong>CÔNG TY CỔ PHẦN CÔNG NGHỆ VÀ TRUYỀN THÔNG ĐẲNG CẤP VIỆT</strong><br>");
            _res.Append("<strong>Trụ sở</strong>: 232/17 Cộng Hòa, P. 12, Q. Tân Bình, TP. Hồ Chí Minh</p>");
            _res.Append("<p style='font-size:11px'>Bạn nhận được thư này là do địa chỉ email đã được đăng ký thành viên Esell.vn.</p>");
            _res.Append("</div>");
            _res.Append("</div>");
            _res.Append("</body>");
            return _res.ToString();
        }
        protected void Lbregis_Click(object sender, EventArgs e)
        {
            string _sbody = string.Empty;
            string _email = txtEmail.Value;
            string _fullname = txtName.Value;
            string _pass = fm.MaHoaMatKhau(txtPassword1.Text);
            string _sCodeActive = fm.TaoChuoiTuDong(15);
            string _sphone = txtphone.Value;
            string _add = txtadd.Value;
            int _sex = Utils.CIntDef(Rdsex.SelectedValue);
            string _idcity = Drcity.SelectedValue;
            string _iddistrict = Drdistric.SelectedValue;
            string _date = Dryear.SelectedValue + "/" + Drmoth.SelectedValue + "/" + Drday.SelectedIndex;
            DateTime _birthday = Utils.CDateDef(_date, DateTime.Now);
            if (this.txtcode.Value == this.Session["CaptchaImageText"].ToString())
            {
                if (acc.Register(_fullname, _email, _pass,_sCodeActive, _sphone, _add, _sex, _idcity, _iddistrict, _birthday))
                {
                    int _active = 0;
                    if (Checkemail.Checked)
                        _active = 1;
                    addEmail(_email, _active);
                    _sbody = htmlEmailRegister(_fullname, _email, _sCodeActive);
                    send.SendMail_Active_Account(txtEmail.Value, "", "", _sbody);

                    //    Response.Redirect("~/vi-vn/deal/thong-bao.html");
                    string strScript = "<script>";
                    strScript += "alert(' Đăng ký thành công!');";
                    strScript += "window.location='/';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
                else
                {

                    Labelerrors.Text = "Email này đã có người sử dụng!";
                }
            }
            else
            {

                Labelerrors.Text = "Mã xác nhận không đúng!";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string _sbody = string.Empty;
            string _email = txtEmail.Value;
            string _fullname = txtName.Value;
            string _pass = fm.MaHoaMatKhau(txtPassword1.Text);
            string _sCodeActive = fm.TaoChuoiTuDong(15);
            string _sphone = txtphone.Value;
            string _add = txtadd.Value;
            int _sex = Utils.CIntDef(Rdsex.SelectedValue);
            string _idcity = Drcity.SelectedValue;
            string _iddistrict = Drdistric.SelectedValue;
            string _date = Dryear.SelectedValue + "/" + Drmoth.SelectedValue + "/" + Drday.SelectedIndex;
            DateTime _birthday = Utils.CDateDef(_date, DateTime.Now);
            if (this.txtcode.Value == this.Session["CaptchaImageText"].ToString())
            {
                if (acc.Register(_fullname, _email, _pass, _sCodeActive, _sphone, _add, _sex, _idcity, _iddistrict, _birthday))
                {
                    int _active = 0;
                    if (Checkemail.Checked)
                        _active = 1;
                    addEmail(_email, _active);
                    _sbody = htmlEmailRegister(_fullname, _email, _sCodeActive);
                    send.SendMail_Active_Account(txtEmail.Value, "", "", _sbody);

                    //    Response.Redirect("~/vi-vn/deal/thong-bao.html");
                    string strScript = "<script>";
                    strScript += "alert(' Đăng ký thành công!');";
                    strScript += "window.location='/';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
                else
                {

                    Labelerrors.Text = "Email này đã có người sử dụng!";
                }
            }
            else
            {

                Labelerrors.Text = "Mã xác nhận không đúng!";
            }
        }
    }
}