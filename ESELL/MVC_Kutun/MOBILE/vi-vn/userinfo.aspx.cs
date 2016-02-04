using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using System.Data;
using System.Web.UI.HtmlControls;
using MVC_Kutun.Components;

namespace MVC_Kutun.MOBILE.vi_vn
{
    public partial class userinfo : System.Web.UI.Page
    {
        #region Declare
        Userinfo user = new Userinfo();
        Config cf = new Config();
        clsFormat fm = new clsFormat();
        int _iUserID = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _iUserID = Utils.CIntDef(Session["USER_ID"]);
            if (_iUserID == 0) Response.Redirect("/");
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

            header.Title = "Thông tin cá nhân";
            if (!IsPostBack)
            {
                loadYear();
                loadMonth();
                loadDay();
                Loaduser_info();
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

        #endregion
        #region Loadinfo
        public void Loaduser_info()
        {
            var list = user.Loaduserinfo(_iUserID);
            if (list.Count > 0)
            {
                Lbemail.Text = list.First().CUSTOMER_EMAIL;
                Txtname.Text = list.First().CUSTOMER_FULLNAME;
                Txtphone.Text = list.First().CUSTOMER_PHONE1;
                int _daybirth = list[0].CUSTOMER_UPDATE.Value.Day;
                int _monthbirth = list[0].CUSTOMER_UPDATE.Value.Month;
                int _yearbirth = list[0].CUSTOMER_UPDATE.Value.Year;
                Drday.SelectedValue = _daybirth.ToString();
                Drmoth.SelectedValue = _monthbirth.ToString();
                Dryear.SelectedValue = _yearbirth.ToString();
                Drsex.SelectedValue = list[0].CUSTOMER_FIELD3;
                if (Utils.CIntDef(list[0].CUSTOMER_TYPE) == 1)
                {
                    div_codebank.Visible = true;
                    div_code.Visible = true;
                    lbcodePartner.Text = list[0].CUSTOMER_CODEID;
                    txtCodebank.Text = list[0].CUSTOMER_CODEBANK;
                }
                else
                {
                    div_codebank.Visible = false;
                    div_code.Visible = false;
                }
            }
        }
        #endregion
        #region Update user
        protected void Lblogins_Click(object sender, EventArgs e)
        {
            string name = Txtname.Text;
            string phone = Txtphone.Text;
            string _date = Dryear.SelectedValue + "/" + Drmoth.SelectedValue + "/" + Drday.SelectedIndex;
            DateTime _birthday = Utils.CDateDef(_date, DateTime.Now);
            if (user.Updateuser(_iUserID, name, phone, Drsex.SelectedValue, _birthday))
            {
                string strScript = "<script>";
                strScript += "alert(' Cập nhật thành công!');";
                strScript += "window.location='/m-thong-tin-ca-nhan.html';";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
            else
            {
                string strScript = "<script>";
                strScript += "alert('Lỗi!');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
        }
        #endregion
        protected void Lbreset_Click(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string name = Txtname.Text;
            string phone = Txtphone.Text;
            string _date = Dryear.SelectedValue + "/" + Drmoth.SelectedValue + "/" + Drday.SelectedIndex;
            DateTime _birthday = Utils.CDateDef(_date, DateTime.Now);
            if (user.Updateuser(_iUserID, name, phone, Drsex.SelectedValue, _birthday))
            {
                string strScript = "<script>";
                strScript += "alert(' Cập nhật thành công!');";
                strScript += "window.location='/m-thong-tin-ca-nhan.html';";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
            else
            {
                string strScript = "<script>";
                strScript += "alert('Lỗi!');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
        }
    }
}