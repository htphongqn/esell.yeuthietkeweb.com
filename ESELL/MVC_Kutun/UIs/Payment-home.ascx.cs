using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace MVC_Kutun.UIs
{
    public partial class Payment_home : System.Web.UI.UserControl
    {
        Userinfo user = new Userinfo();
        int _iUserID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            _iUserID = Utils.CIntDef(Session["USER_ID"]);
            if (!IsPostBack)
            {
                getInfoAcount();
            }
        }
        private void getInfoAcount()
        {
            var list = user.Loaduserinfo(_iUserID);
            if (list.Count > 0)
            {
                txtname.Value = list[0].CUSTOMER_FULLNAME;
                txtemail.Value = list[0].CUSTOMER_EMAIL;
                txtphone.Value = list[0].CUSTOMER_PHONE1;
                
            }
        }
        protected void lbNext_Click(object sender, EventArgs e)
        {
            string name = txtname.Value;
            string email = txtemail.Value;
            string phone = txtphone.Value;
            string remark = txtremark.Value;
            Response.Redirect("/thanh-toan-buoc-3.html?typepay=2&name=" + name + "&email=" + email + "&phone=" + phone + "&note=" + remark + "");
        }
    }
}