using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using MVC_Kutun.Components;

namespace MVC_Kutun.UIs
{
    public partial class proHighlights : System.Web.UI.UserControl
    {
        #region Declare
        Home index = new Home();
        Function fun = new Function();
        Checkcookie cki = new Checkcookie();
        Order_now order = new Order_now();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Loadindex(1);

            }
        }
        public void Loadindex(int perior)
        {
            try
            {
                string s = "";
                var list = index.Loadindex(1, perior, 12);
                //for (int i = 0; i < list.Count; i++)
                //{
                //    if (i % 2 == 0)
                //        s += "<li>";
                //    s += getItem(list[i]);
                //    if (i % 2 != 0 || i == list.Count)
                //        s += "</li>";

                //}

                //lbSPNoibat.Text = s;

                Rpprohighlight.DataSource = list;
                Rpprohighlight.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private string getItem(Model.ESHOP_NEW item)
        {
            string s = "";

            s += "<div class='product'> <a class='img_product' href='" + GetLink(item.NEWS_URL, item.NEWS_SEO_URL) + "'> <img src='" + GetImageT(item.NEWS_ID, item.NEWS_IMAGE3) + "' alt='" + item.NEWS_TITLE + "'></a>";
            s += "    <h3 class='product_name'> <a href='" + GetLink(item.NEWS_URL, item.NEWS_SEO_URL) + "'>" + item.NEWS_TITLE + "</a></h3>";
            s += "    <div class='info_price'> <span class='f_price'><del> " + GetPrice2(item.NEWS_PRICE1, item.NEWS_PRICE2) + "</del></span> <span class='main_price'> " + GetPrice1(item.NEWS_PRICE1, item.NEWS_PRICE2) + "</span> </div>";
            s += Getgiam(item.NEWS_PRICE1, item.NEWS_PRICE2);
            s += getBuy(item.NEWS_ID, item.NEWS_FIELD3);
            s += "  </div>";

            return s;
        }
        #region function
        public string getBuy(object news_id, object sta)
        {
            return null;// fun.getBuy(news_id, sta);
        }
        public string Getprice(object News_Price1)
        {
            return fun.Getprice(News_Price1);
        }
        public decimal Getprice_addtocart(object News_Price1)
        {
            return fun.Getprice_addtocart(News_Price1);
        }
        public string GetPrice1(object News_Price1, object News_Price2)
        {
            try
            {
                return fun.Getprice1(News_Price1, News_Price2);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
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
            return fun.Getgiamgia(News_Price1, News_Price2);
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
        #endregion
    }
}