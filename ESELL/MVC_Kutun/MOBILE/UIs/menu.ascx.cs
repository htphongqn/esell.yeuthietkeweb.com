using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using MVC_Kutun.Components;

namespace MVC_Kutun.MOBILE.UIs
{
    public partial class menu : System.Web.UI.UserControl
    {
        #region Declare
        Propertity per = new Propertity();
        Function fun = new Function();
        Cart_result cart = new Cart_result();
        setCookieSignin setck = new setCookieSignin();
        Checkcookie cki = new Checkcookie();
        Account acc = new Account();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Utils.CIntDef(Session["User_ID"]) == 0)
                setSession();
            if (!string.IsNullOrEmpty(Utils.CStrDef(Session["User_ID"])))
            {
                //Lbname.Text = Utils.CStrDef(Session["User_Name"]);
                div_login.Visible = false;
                div_regis.Visible = false;
                div_logout.Visible = true;
                div_logout2.Visible = true;
            }
            else
            {
                div_login.Visible = true;
                div_regis.Visible = true;
                div_logout.Visible = false;
                div_logout2.Visible = false;
            }
        }
        private void setSession()
        {
            acc.setSessionCokie(cki.getCookieSignin());
        }

        protected void Lblogout_Click(object sender, EventArgs e)
        {
            setck.Removecookie(Utils.CStrDef(Session["User_ID"]));
            Session.Abandon();
            Response.Redirect("/");
        }
    }
}