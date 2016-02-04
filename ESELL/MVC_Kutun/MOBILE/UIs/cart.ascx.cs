using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using MVC_Kutun.Components;
using vpro.functions;
using System.Web.UI.HtmlControls;

namespace MVC_Kutun.MOBILE.UIs
{
    public partial class cart : System.Web.UI.UserControl
    {
        #region Declare
        Cart_result carts = new Cart_result();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        int _ship = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid _guid = (Guid)Session["news_guid"];
            if(!IsPostBack)
                Load_Cart(_guid);
            decimal totalmn = carts.Total_Amount(_guid);

            lbtotalmoney.Text = fm.FormatMoney(totalmn);
          
            if (Session["price"] != null)
            {

                _ship = Utils.CIntDef(Session["price"]);
                totalmn += _ship != -1 ? _ship : 0;
                Lbtotal.Text = fm.FormatMoney(totalmn);
                div_ship.Visible = true;
                Lbship.Text =_ship >0 ? fm.FormatMoney(_ship) :(_ship==0 ? "Miễn phí" : "Liên hệ");
            }
            else
            {
                Lbtotal.Text = fm.FormatMoney(totalmn);
                div_ship.Visible = false;
            }

                
        }
        public void Load_Cart(Guid _guid)
        {
            var _basket = carts.Load_cart(_guid);

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
                    carts.Update_cart(_guid, _sID, Utils.CIntDef(dr.SelectedValue));

            }
            Load_Cart(_guid);
           
            decimal totalmn = carts.Total_Amount(_guid);
            lbtotalmoney.Text = fm.FormatMoney(totalmn);

            _ship = Utils.CIntDef(Session["price"]);
            totalmn += _ship != -1 ? _ship : 0;
            Lbtotal.Text = fm.FormatMoney(totalmn);
        }
        protected void Rpgiohang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                Guid _guid = (Guid)Session["news_guid"];

                int _sID = int.Parse(e.CommandArgument.ToString());
                carts.Delete_cart(_guid, _sID);
                Load_Cart(_guid);
                decimal totalmn = carts.Total_Amount(_guid);

                lbtotalmoney.Text = fm.FormatMoney(totalmn);

                if (Session["price"] != null)
                {

                    _ship = Utils.CIntDef(Session["price"]);
                    totalmn += _ship != -1 ? _ship : 0;
                    Lbtotal.Text = fm.FormatMoney(totalmn);
                    Lbship.Text = _ship > 0 ? fm.FormatMoney(_ship) : (_ship == 0 ? "Miễn phí" : "Liên hệ");
                }
                else
                {
                    Lbtotal.Text = fm.FormatMoney(totalmn);
                }
            }
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
    }
}