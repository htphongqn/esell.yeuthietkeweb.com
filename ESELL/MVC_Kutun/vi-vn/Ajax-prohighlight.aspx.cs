using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using System.Web.Services;

namespace MVC_Kutun.vi_vn
{
    public partial class Ajax_prohighlight : System.Web.UI.Page
    {
        static Controller.Home index_pro = new Controller.Home();
        static Controller.List_product listpro=new Controller.List_product();
        static Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        [WebMethod]
        public static string loadproduct(string perior)
        {
            int per = Utils.CIntDef(perior);
            var list = per!=1 ? index_pro.Loadindex(1, per, 15) : index_pro.Loadindex_all(1,0,15);
            string str = "";
            foreach (var i in list)
            {
                str += "<li class='item_P fl'>";

                str += "<div class='product'>";
                str += "<a href='" + GetLink(i.NEWS_URL, i.NEWS_SEO_URL, i.CAT_SEO_URL) + "' class='img_product'>";
                str += "<img alt='" + i.NEWS_TITLE + "' src='" + GetImageT(i.NEWS_ID, i.NEWS_IMAGE3) + "'></a>";
                str += " <h3 class='product_name'>";
                str += "<a href='" + GetLink(i.NEWS_URL, i.NEWS_SEO_URL, i.CAT_SEO_URL) + "'>" + i.NEWS_TITLE + "</a></h3>";
                str += "<div class='info_price'>";
                str += "<span class='f_price'><del>" + GetPrice2(i.NEWS_PRICE1, i.NEWS_PRICE2) + "</del></span> <span class='main_price'> " + GetPrice1(i.NEWS_PRICE1, i.NEWS_PRICE2) + "</span>";
                str += " </div>";
                str += Getgiam(i.NEWS_PRICE1, i.NEWS_PRICE2);
                str += "<div class='addtocart'>";
                str += "<a href='../vi-vn/addtocart.aspx?id=" + i.NEWS_ID + "'>Mua ngay</a></div>";
                str += "</div>";
                str += "</li>";
            }
            return str;
        }
        [WebMethod]
        public static string viewmore(string perior, string skip)
        {
            int per = Utils.CIntDef(perior);
            var list = index_pro.Loadindex_all(1,Utils.CIntDef(skip),15);
            string str = "";
            foreach (var i in list)
            {
                str += "<li class='item_P fl'>";

                str += "<div class='product'>";
                str += "<a href='" + GetLink(i.NEWS_URL, i.NEWS_SEO_URL, i.CAT_SEO_URL) + "' class='img_product'>";
                str += "<img alt='" + i.NEWS_TITLE + "' src='" + GetImageT(i.NEWS_ID, i.NEWS_IMAGE3) + "'></a>";
                str += " <h3 class='product_name'>";
                str += "<a href='" + GetLink(i.NEWS_URL, i.NEWS_SEO_URL, i.CAT_SEO_URL) + "'>" + i.NEWS_TITLE + "</a></h3>";
                str += "<div class='info_price'>";
                str += "<span class='f_price'><del>" + GetPrice2(i.NEWS_PRICE1, i.NEWS_PRICE2) + "</del></span> <span class='main_price'> " + GetPrice1(i.NEWS_PRICE1, i.NEWS_PRICE2) + "</span>";
                str += " </div>";
                str += Getgiam(i.NEWS_PRICE1, i.NEWS_PRICE2);
                str += "<div class='addtocart'>";
                str += "<a href='../vi-vn/addtocart.aspx?id=" + i.NEWS_ID + "'>Mua ngay</a></div>";
                str += "</div>";
                str += "</li>";
            }
            return str;
        }
        #region function

        private static string GetPrice1(object News_Price1, object News_Price2)
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
        private static string GetPrice2(object News_Price1, object News_Price2)
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
        private static string Getgiam(object News_Price1, object News_Price2)
        {
            return fun.Getgiamgia(News_Price1, News_Price2);
        }
        private static string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        private static string GetImageT(object News_Id, object News_Image1)
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