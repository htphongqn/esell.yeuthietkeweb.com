using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Controller;
using vpro.functions;
using MVC_Kutun.Components;

namespace MVC_Kutun.MOBILE.vi_vn
{
    public partial class Payment_step1 : System.Web.UI.Page
    {
        #region Declare
        Payment_cart pay = new Payment_cart();
        Cart_result rscart = new Cart_result();
        Config cf = new Config();
        Account acc = new Account();
        clsFormat fm = new clsFormat();
        int _iUserID = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _iUserID = Utils.CIntDef(Session["USER_ID"]);
            if (_iUserID != 0) Response.Redirect("/thanh-toan-buoc-2-mobile.html");
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

            header.Title = "Thanh toán";
            Guid _guid = (Guid)Session["news_guid"];
            if (!pay.Check_Cart(_guid))
            {
                Response.Redirect("/", false);
            }

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {

            int idnext = Utils.CIntDef(Rdchecklogin.SelectedValue);
            if (idnext == 0)
                Response.Redirect("/thanh-toan-buoc-2-mobile.html");
            else
            {
                if (acc.Login(txtemail.Value, fm.MaHoaMatKhau(txtpass.Value)))
                {
                    Response.Redirect("/thanh-toan-buoc-2-mobile.html");
                }
                else
                {
                    string strScript = "<script>";
                    strScript += "alert('Tài khoản hoặc mật khẩu không đúng');";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
        }
    }
}