using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace MVC_Kutun.MOBILE.vi_vn
{
    public partial class User_manager : System.Web.UI.Page
    {
        Register_email rg = new Register_email();
        protected void Page_Load(object sender, EventArgs e)
        {
            int _iUserID = Utils.CIntDef(Session["USER_ID"]);
                if (_iUserID == 0) Response.Redirect("/");
            Lbname.Text = Utils.CStrDef(Session["User_Name"]);
            if (!IsPostBack)
                setChecked();
        }
        private void setChecked()
        {
            if (rg.setChecked(Utils.CStrDef(Session["User_Email"])))
                Checkreceiemail.Checked = true;
            else
                Checkreceiemail.Checked = false;
        }
        protected void Lblogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/");
        }
        protected void Checkreceiemail_CheckedChanged(object sender, EventArgs e)
        {
            int _active = 0;
            if (Checkreceiemail.Checked)
                _active = 1;
            if (rg.updateActive(Utils.CStrDef(Session["User_Email"]), _active))
                Response.Redirect("/m-quan-ly-tai-khoan.html");
        }
    }
}