using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MVC_Kutun.UIs
{
    public partial class login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Attributes.Add("onkeypress", "return clickButton(event,'" + bt_login.ClientID + "')");
            Txtpass.Attributes.Add("onkeypress", "return clickButton(event,'" + bt_login.ClientID + "')");
        }
    }
}