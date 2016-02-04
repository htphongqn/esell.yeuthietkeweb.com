using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;

namespace MVC_Kutun.UIs
{
    public partial class ucAddressPayment : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) getInfo();
        }
        private void getInfo()
        {
            string _sAddress = Utils.CStrDef(Request["add"]);
            string _sPhone = Utils.CStrDef(Request["phone"]);
            Litadd.Text = "Địa chỉ giao hàng: " + _sAddress + "<br/>Số điện thoại: " + _sPhone;
        }
    }
}