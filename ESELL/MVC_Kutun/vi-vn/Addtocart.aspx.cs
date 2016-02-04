using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace MVC_Kutun.vi_vn
{
    public partial class Addtocart : System.Web.UI.Page
    {
        #region Declare
        Addto_cart cart = new Addto_cart();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            
            int id = Utils.CIntDef(Request.QueryString["id"]);
            int _quantity = Utils.CIntDef(Request.QueryString["quantity"]);
            Guid _guid = (Guid)Session["news_guid"];
            if (Session["price"] != null)
                Session["price"] = null;
            if (cart.Add_To_Cart(id, _guid, _quantity))
                Response.Redirect("/gio-hang.html");
            else
            {
                string url = Request.UrlReferrer.AbsolutePath;
                string strScript = "<script>";
                strScript += "alert('Sản phẩm này đã hết hàng.Bạn hãy liên hệ chúng tôi để mua sản phẩm này!');";
                strScript += "window.location='" + (!String.IsNullOrEmpty(url) ? url : "/") + "';";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }

            
        }
    }
}