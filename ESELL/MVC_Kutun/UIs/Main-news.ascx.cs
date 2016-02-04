using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace MVC_Kutun.UIs
{
    public partial class Main_news : System.Web.UI.UserControl
    {
        #region Declare
        Home index = new Home();
        Function fun = new Function();
        Propertity per = new Propertity();
        int _countsl = 1, _countpro = 1, _type = 0, typecate=0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _type = Utils.CIntDef(Request["type"]);
            string _cat_seo_url = Request.QueryString["purl"];
            if (Request.RawUrl.Contains("videos"))
            {
                _cat_seo_url = "videos";
                typecate = 3;
            }
            Hdlink.Value = typecate.ToString();
            
            if (!IsPostBack)
            {
                if(_type==10)
                Loadcate_index(10, 0, ref Rpcate_newsindex);
                else if (_type == 12)
                { 
                    Loadcate_index(10, 3, ref Rpcate_newsindex);
                    //div_slider.Visible = false;
                }
            }

        }
        #region Lodata
        public void Loadcate_index(int limit, int type, ref Repeater rp)
        {
            try
            {
                rp.DataSource = index.Load_cate_index(limit, type,0);
                rp.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

       
        public IQueryable Load_newsindex(object catid, int skip, int limit)
        {
            return index.Load_news_index_cate(catid, skip, limit);
        }
        public IQueryable Load_caterank2(object catid, int limit)
        {
            return index.Load_cate_index_rank2(catid, limit);
        }
        public IQueryable Load_ads_cate(object cat_id, int pos)
        {
            return index.load_ads_cate(cat_id, pos);
        }
        #endregion
        #region function
        public int setCountsli()
        {
            return _countsl++;
        }
        public string setClasson()
        {
            if (_countsl == 1) return "on";
            return "";
        }
        public int setCountcate()
        {
            return _countpro++;
        }
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
        public string GetImageT(object News_Id, object News_Image1, object link)
        {

            try
            {

                if (typecate == 0)
                    return fun.GetImageT_News(News_Id, News_Image1);
                return per.getImagesYoutube(link);
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