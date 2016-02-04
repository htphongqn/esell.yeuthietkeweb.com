using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using MVC_Kutun.Components;
using System.Web.UI.HtmlControls;

namespace MVC_Kutun.vi_vn
{
    public partial class cart_result : System.Web.UI.Page
    {
        #region Declare
        Cart_result cart = new Cart_result();
        clsFormat fm = new clsFormat();
        Function fun = new Function();
        Config cf = new Config();
        Propertity per = new Propertity();
        int _count = 1;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid _guid = (Guid)Session["news_guid"];
            if (!IsPostBack)
            {
                Load_Cart(_guid);
                Lbtotal.Text =Lbtotal2.Text = fm.FormatMoney(cart.Total_Amount(_guid));

            }
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

            header.Title = "Giỏ hàng";
        }
        public void Load_Cart(Guid _guid)
        {
            if (string.IsNullOrEmpty(Utils.CStrDef(Session["news_guid"])))
            {
                string strScript = "<script>";
                strScript += "alert('Thông báo: Giỏ hàng của bạn trống! Quay trở lại mua hàng... ');";
                strScript += "window.location='/';";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
            else
            {

                var _basket = cart.Load_cart(_guid);

                if (_basket.ToList().Count > 0)
                {
                   
                    Rpgiohang.DataSource = _basket;
                    Rpgiohang.DataBind();
                    for (int i = 0; i < Rpgiohang.Items.Count; i++)
                    {
                        DropDownList dr = Rpgiohang.Items[i].FindControl("Drquan") as DropDownList;
                        dr.SelectedValue = _basket[i].Basket_quantity.ToString();
                    }
                }
                else
                {
                    string strScript = "<script>";
                    strScript += "alert('Thông báo: Giỏ hàng của bạn trống! Quay trở lại mua hàng... ');";
                    strScript += "window.location='/';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
        }

        public string getNamethuognhieu(object id)
        {
            int _id = Utils.CIntDef(id);
            return per.getLinkHangsx(_id);
        }
        public string GetLink(object News_Url, object News_Seo_Url)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetPrice2(object News_Price1, object News_Price2)
        {
            try
            {
                return fun.Getprice2(News_Price1, News_Price2);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string Getgiam(object News_Price1, object News_Price2)
        {
            return fun.GetgiamgiaCart(News_Price1, News_Price2);
        }
        public string GetImageT(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News(News_Id, News_Image1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        
        public string GetProductName(object Title, int intLength)
        {
            if (Utils.CStrDef(Title).Length > intLength)
                return Utils.CStrDef(Title).Substring(0, intLength) + "...";
            return Utils.CStrDef(Title);
        }
        public string Getnamecolor_size(object cat_id)
        {
            return cart.Getnamecolor_size(cat_id);
        }

        protected void Rpgiohang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                Guid _guid = (Guid)Session["news_guid"];

                int _sID = int.Parse(e.CommandArgument.ToString());
                cart.Delete_cart(_guid, _sID);
                Response.Redirect("/gio-hang.html");
            }
        }

        protected void Lbcapnhap_Click(object sender, EventArgs e)
        {
            Guid _guid = (Guid)Session["news_guid"];
            for (int i = 0; i < Rpgiohang.Items.Count; i++)
            {
                TextBox txt = Rpgiohang.Items[i].FindControl("Txtquantity") as TextBox;
                HtmlInputHidden s = Rpgiohang.Items[i].FindControl("newsid") as HtmlInputHidden;
                int _newid = int.Parse(s.Value);
                if (int.Parse(txt.Text) <= 0 || int.Parse(txt.Text) > 50)
                {
                    string strScript = "<script>";
                    strScript += "alert('Số lượng sản phẩm phải lớn hơn 0 và nhỏ hơn 100 ');";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
                else
                {
                    cart.Update_cart(_guid, _newid, Utils.CIntDef(txt.Text));
                }
            }
            Load_Cart(_guid);
            Lbtotal.Text = fm.FormatMoney(cart.Total_Amount(_guid));
        }
        protected void drSoLuong_SelectedIndexChanged(object sender, EventArgs e)
        {
            Guid _guid = (Guid)Session["news_guid"];

            for (int i = 0; i < Rpgiohang.Items.Count; i++)
            {
                //TextBox txt = Rpgiohang.Rows[i].FindControl("txtSoLuong") as TextBox;
                DropDownList dr = Rpgiohang.Items[i].FindControl("Drquan") as DropDownList;
                HtmlInputHidden s = Rpgiohang.Items[i].FindControl("newsid") as HtmlInputHidden;
                int _sID = Utils.CIntDef(s.Value);
                if (_sID != 0)
                    cart.Update_cart(_guid, _sID, Utils.CIntDef(dr.SelectedValue));

            }
            Load_Cart(_guid);
            Lbtotal.Text = fm.FormatMoney(cart.Total_Amount(_guid));
        }
        public int getorder()
        {
            return _count++;
        }
        public string setStyle(object price2)
        {
            decimal _price = Utils.CDecDef(price2);
            if (_price == 0)
                return "style='margin-top:25px'";
            return "";
        }
    }
}