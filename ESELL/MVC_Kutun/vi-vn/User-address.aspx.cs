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

namespace MVC_Kutun.vi_vn
{
    public partial class User_address : System.Web.UI.Page
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
                Load_city();
                Load_distric(-1);
                Loaduser_info();
            }
        }
        #region Area
        private void Load_city()
        {
            Drcity.DataValueField = "PROP_ID";
            Drcity.DataTextField = "PROP_NAME";
            Drcity.DataSource = user.Loadcity();
            Drcity.DataBind();
            ListItem l = new ListItem("--- Thành phố ---", "0");
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
                row["PROP_ID"] = 0;
                row["PROP_NAME"] = "---Chọn quận/huyện---";
                dt.Rows.Add(row);

                Drdistric.DataTextField = "PROP_NAME";
                Drdistric.DataValueField = "PROP_ID";
                Drdistric.DataSource = dt;
                Drdistric.DataBind();

            }
        }
        #endregion
        #region Loadinfo
        public void Loaduser_info()
        {
            var list = user.Loaduserinfo(_iUserID);
            if (list.Count > 0)
            {
                //Lbemail.Text = list.First().CUSTOMER_EMAIL;
                //Txtname.Text = list.First().CUSTOMER_FULLNAME;
                //Txtphone.Text = list.First().CUSTOMER_PHONE1;
                Txtadd.Text = list.First().CUSTOMER_ADDRESS;
                Drcity.SelectedValue = list[0].CUSTOMER_FIELD1;
                Load_distric(Utils.CIntDef(list[0].CUSTOMER_FIELD1));
                Drdistric.SelectedValue = list[0].CUSTOMER_FIELD2;
            }
        }
        #endregion
        #region Update user
        protected void Lblogins_Click(object sender, EventArgs e)
        {
           
            if (user.updateAdd(_iUserID,Txtadd.Text,Drcity.SelectedValue,Drdistric.SelectedValue))
            {
                string strScript = "<script>";
                strScript += "alert(' Cập nhật thành công!');";
                strScript += "window.location='/dia-chi-giao-hang.html';";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
            else
            {
                string strScript = "<script>";
                strScript += "alert(' 2 mật khẩu không giống nhau!');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
        }
        #endregion
        protected void Lbreset_Click(object sender, EventArgs e)
        {
            Response.Redirect("/");
        }
        protected void Drcity_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Utils.CIntDef(Drcity.SelectedValue);
            Load_distric(id);
        }
    }
}