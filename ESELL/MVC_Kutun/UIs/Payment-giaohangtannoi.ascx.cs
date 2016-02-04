using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using System.Data;
using vpro.functions;

namespace MVC_Kutun.UIs
{
    public partial class Payment_giaohangtannoi : System.Web.UI.UserControl
    {
        Userinfo user = new Userinfo();
        int _iUserID = 0;
        Cart_result carts = new Cart_result();
        protected void Page_Load(object sender, EventArgs e)
        {
            _iUserID = Utils.CIntDef(Session["USER_ID"]);
            if (!IsPostBack)
            {
                Load_city();
                Load_distric(-1);
                getInfoAcount();
            }
            if (Utils.CIntDef(Drdistric.SelectedValue) != 0)
                Drdistric_SelectedIndexChanged(sender, e);
        }
        private void Load_city()
        {
            Drcity.DataValueField = "PROP_ID";
            Drcity.DataTextField = "PROP_NAME";
            Drcity.DataSource = user.Loadcity();
            Drcity.DataBind();
            ListItem l = new ListItem("---Chọn tỉnh/thành phố---","0");
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
        private string getNameArea(int id)
        {
            return user.getnamePro(id);
        }
        private void getInfoAcount()
        {
            var list = user.Loaduserinfo(_iUserID);
            if (list.Count > 0)
            {
                Txtname.Value = list[0].CUSTOMER_FULLNAME;
                txtemail.Value = list[0].CUSTOMER_EMAIL;
                txtphone.Value = list[0].CUSTOMER_PHONE1;
                txtadd.Value = list[0].CUSTOMER_ADDRESS;
                Drcity.SelectedValue = list[0].CUSTOMER_FIELD1;
                Load_distric(Utils.CIntDef(list[0].CUSTOMER_FIELD1));
                Drdistric.SelectedValue = list[0].CUSTOMER_FIELD2;
            }
        }
        protected void lbnext_Click(object sender, EventArgs e)
        {
            string name = Txtname.Value;
            string phone = txtphone.Value;
            string email = txtemail.Value;
            if (String.IsNullOrEmpty(email))
                email = "esell@gmail.com";
            string add = txtadd.Value + " - " +getNameArea(Utils.CIntDef(Drdistric.SelectedValue)) + " - "+ getNameArea(Utils.CIntDef(Drcity.SelectedValue));
            //string date = txtdate.Value;
            //if (!String.IsNullOrEmpty(date))
            //{
            //    string[] a = date.Split('/');
            //    string formatd = a[2] + "/" + a[1] + "/" + a[0];
            //    DateTime dtnow = Utils.CDateDef(formatd, DateTime.Now);
            //    if (DateTime.Today > dtnow)
            //    {
            //        string strScript = "<script>";
            //        strScript += "alert('Ngày giao hàng phải lớn hơn hoặc  bằng ngày hiện tại!');";
            //        strScript += "</script>";
            //        Page.RegisterClientScriptBlock("strScript", strScript);
            //        return;
            //    }
            //}
            string remark = txtnote.Value;
            Response.Redirect("/thanh-toan-buoc-3.html?typepay=1&name=" + name + "&phone=" + phone + "&email=" + email + "&add=" + add + "&note=" + remark + "");
        }

        protected void Drcity_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Utils.CIntDef(Drcity.SelectedValue);
            Load_distric(id);
            lbnext.Focus();
        }

        protected void Drdistric_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = Utils.CIntDef(Drdistric.SelectedValue);
            decimal price = user.getShip(id);
            Session["price"] = price;
            lbnext.Focus();
        }
    }
}