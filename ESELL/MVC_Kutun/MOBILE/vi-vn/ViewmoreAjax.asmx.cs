using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Controller;
using vpro.functions;
using System.Text;

namespace MVC_Kutun.MOBILE.vi_vn
{
    /// <summary>
    /// Summary description for ViewmoreAjax
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ViewmoreAjax : System.Web.Services.WebService
    {
        List_product listpro = new List_product();
        Function fun = new Function();
        Search_result searchrs = new Search_result();
        [WebMethod]
        public string viewmore(string catid, string skip)
        {
            int _catid = Utils.CIntDef(catid);
            int _skip = Utils.CIntDef(skip);
            var list = listpro.loadproAjax(_catid, _skip, 20);
            StringBuilder _res = new StringBuilder();
            foreach (var i in list)
            {
                _res.Append("<div class='item_P'>");
                _res.Append("<div class='product'>");
                _res.Append(Getgiam(i.NEWS_PRICE1, i.NEWS_PRICE2));
                _res.Append("<div class='img_product'>");
                _res.Append(" <a href='" + GetLink(i.NEWS_URL, i.NEWS_SEO_URL) + "'>");
                _res.Append("<img src='" + GetImageT(i.NEWS_ID, i.NEWS_IMAGE3) + "' alt='' />");
                _res.Append(" </a>");
                _res.Append("</div>");
                _res.Append("<div class='info_P'>");
                _res.Append(" <h3 class='product_name'>");
                _res.Append(" <a href='" + GetLink(i.NEWS_URL, i.NEWS_SEO_URL) + "'>");
                _res.Append(i.NEWS_TITLE + "</a></h3>");
                _res.Append(" <div class='txt_desc'>");
                _res.Append("  <div class='price_n'>");
                _res.Append("   <price>" + GetPrice1(i.NEWS_PRICE1, i.NEWS_PRICE2) + "</price>");
                _res.Append(" </div>");
                _res.Append("<div class='price_s'>");
                _res.Append(" <del>");
                _res.Append(GetPrice2(i.NEWS_PRICE1, i.NEWS_PRICE2) + "</del></div>");
                _res.Append("</div>");
                _res.Append("</div>");
                _res.Append(" </div>");
                _res.Append("</div>");
            }
            return _res.ToString();
        }
        [WebMethod]
        public string viewmoreSearch(string keyword,string catid, string skip)
        {
            int _catid = Utils.CIntDef(catid);
            int _skip = Utils.CIntDef(skip);
            var list = searchrs.Load_search_resultMore(keyword, 1, _catid, _skip, 20);
            StringBuilder _res = new StringBuilder();
            foreach (var i in list)
            {
                _res.Append("<div class='item_P'>");
                _res.Append("<div class='product'>");
                _res.Append(Getgiam(i.NEWS_PRICE1, i.NEWS_PRICE2));
                _res.Append("<div class='img_product'>");
                _res.Append(" <a href='" + GetLink(i.NEWS_URL, i.NEWS_SEO_URL) + "'>");
                _res.Append("<img src='" + GetImageT(i.NEWS_ID, i.NEWS_IMAGE3) + "' alt='' />");
                _res.Append(" </a>");
                _res.Append("</div>");
                _res.Append("<div class='info_P'>");
                _res.Append(" <h3 class='product_name'>");
                _res.Append(" <a href='" + GetLink(i.NEWS_URL, i.NEWS_SEO_URL) + "'>");
                _res.Append(i.NEWS_TITLE + "</a></h3>");
                _res.Append(" <div class='txt_desc'>");
                _res.Append("  <div class='price_n'>");
                _res.Append("   <price>" + GetPrice1(i.NEWS_PRICE1, i.NEWS_PRICE2) + "</price>");
                _res.Append(" </div>");
                _res.Append("<div class='price_s'>");
                _res.Append(" <del>");
                _res.Append(GetPrice2(i.NEWS_PRICE1, i.NEWS_PRICE2) + "</del></div>");
                _res.Append("</div>");
                _res.Append("</div>");
                _res.Append(" </div>");
                _res.Append("</div>");
            }
            return _res.ToString();
        }
        #region function

        public string getBuy(object news_id, object sta)
        {
            return fun.getBuy(news_id, sta);
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
        public string getdate(object date)
        {
            return fun.getDate(date);
        }
        #endregion
    }
}
