using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using Controller;
using System.Web.Services;
using vpro.functions;

namespace MVC_Kutun.MOBILE.vi_vn
{
    public partial class Ajax_morelistpro : System.Web.UI.Page
    {
        #region declare
        static List_product lpro = new List_product();
        static Function fun = new Function();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string getmorepro(string id, string skip)
        {
            int _id = Utils.CIntDef(id);
            int _skip = Utils.CIntDef(skip);
            string _res = string.Empty;
            var list = lpro.loadproAjax(_id, _skip, 15);
            foreach (var i in list)
            {

                _res += "<div class='item_P'>";
                _res += "<div class='product'>";
                _res += "<div class='img_product'>";
                _res += "<a href='" + GetLink(i.NEWS_URL, i.NEWS_SEO_URL) + "'>";
                _res += "<img src='" + GetImageT(i.NEWS_ID, i.NEWS_IMAGE3) + "' alt='' />";
                _res += "</a>";
                _res += "</div>";
                _res += "<div class='info_P'>";
                _res += "<h3 class='product_name'>";
                _res += "<a href='" + GetLink(i.NEWS_URL, i.NEWS_SEO_URL) + "'>";
                _res += i.NEWS_TITLE + "</a></h3>";
                _res += "<div class='txt_desc'>";
                _res += "Giá:";
                _res += "<price>"+GetPrice1(i.NEWS_PRICE1, i.NEWS_PRICE2) + "</price>";
                _res += "</div>";

                _res += "</div>";

                _res += "</div>";

                _res += "</div>";

            }
            return _res;
        }
        #region function


        public static string GetPrice1(object News_Price1, object News_Price2)
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
        public static string GetPrice2(object News_Price1, object News_Price2)
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
        public static string Getgiam(object News_Price1, object News_Price2)
        {
            return fun.Getgiamgia(News_Price1, News_Price2);
        }
        public static string GetLink(object News_Url, object News_Seo_Url)
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
        public static string GetImageT(object News_Id, object News_Image1)
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