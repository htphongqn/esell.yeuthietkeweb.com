using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;

namespace MVC_Kutun.vi_vn
{
    public partial class ajax_news_main : System.Web.UI.Page
    {
        #region Declare
        Controller.Home index = new Controller.Home();
        Function fun = new Function();
        int _id = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _id = Utils.CIntDef(Request["id"]);
            Loadcate_newsajax();
        }
        #region Lodata
        public void Loadcate_newsajax()
        {
            try
            {
                Rpcateindex_news.DataSource = index.Load_cate_ajaxnews(_id);
                Rpcateindex_news.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
        
        public IQueryable Load_proindex(object catid, int perior)
        {
            return index.Load_pro_index_cate(catid, 20, perior);
        }
        public IQueryable Load_newsindex(object catid, int skip, int limit, int perior)
        {
            return index.Load_news_index_cate(catid, skip, limit, perior);
        }
        public IQueryable Load_caterank2(object catid)
        {
            return index.Load_cate_index_rank2(catid, 7);
        }
        public IQueryable Load_ads_cate(object cat_id, int pos)
        {
            return index.load_ads_cate(cat_id, pos);
        }
        #endregion
        #region function
      
        public string GetLinkCat(object Cat_Url, object Cat_Seo_Url)
        {
            try
            {

                return fun.Getlink_Cat(Cat_Url, Cat_Seo_Url);

            }
            catch (Exception)
            {

                throw;
            }
        }
        public string getImagecat(object cat_id, object cat_img)
        {
            return fun.Getimages_Cat(cat_id, cat_img);
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
        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
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
        public string GetImageAd(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url)
        {
            try
            {
                return fun.GetImageAd(Ad_Id, Ad_Image1, Ad_Target, Ad_Url);
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