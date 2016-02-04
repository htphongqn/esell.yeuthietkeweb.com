using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MVC_Kutun.Components;
using Controller;
using vpro.functions;

namespace MVC_Kutun.Master
{
    public partial class Master_payment : System.Web.UI.MasterPage
    {
        setCookieDevice setckdv = new setCookieDevice();
        Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            form1.Action = Request.RawUrl;
            if (!Request.RawUrl.Contains("thanh-toan-buoc-3.html"))
                ucAddressPayment1.Visible = false;
            if (!IsPostBack)
                load_logo();
        }
        protected void load_logo()
        {
            var _logoSlogan = per.Load_logo_or_sologan("1", 1);
            if (_logoSlogan.Count > 0)
            {
               Imag_logo.ImageUrl=PathFiles.GetPathBanner(_logoSlogan[0].BANNER_ID)+"/"+_logoSlogan[0].BANNER_FILE;
            }
        }
        protected void Lbadddevice_Click(object sender, EventArgs e)
        {
            setckdv.Addcookie("itemmobile");
            Response.Redirect("/");
        }
    }
}