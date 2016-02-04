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
    public partial class Ajax_scroll_main : System.Web.UI.Page
    {
        #region Declare
        Controller.Home index = new Controller.Home();
        Function fun = new Function();
        int _countsl = 1, _countpro = 1, _section = 1, _sectionleft = 1, _classname = 1, _tabclass = 1;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            int pos = Utils.CIntDef(Request["pos"]);
            Loadcate_index(5,pos,1, ref Rpcateindex_pro);

        }
        #region Lodata
        public void Loadcate_index(int limit,int skip, int type, ref Repeater rp)
        {
            try
            {
                rp.DataSource = index.Load_cate_index(limit, type,skip);
                rp.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IQueryable Load_proindex(object catid, int skip, int limit)
        {
            return index.Load_pro_index_cate(catid, skip, limit);
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
        public int setTabs()
        {
            return _tabclass++;
        }
        public string setClassSectionLeft()
        {
            switch (_sectionleft)
            {

                case 1: { _sectionleft++; return "first_cate_main"; }
                case 2: { _sectionleft++; return "second_cate_main"; }
                case 3: { _sectionleft++; return "third_cate_main"; }
                case 4: { _sectionleft++; return "fourth_cate_main"; }
                case 5: { _sectionleft++; return "five_cate_main"; }
                default: return "";
            }
        }
        public string setClassSectionMain()
        {
            switch (_section)
            {

                case 1: { _section++; return "first_cate_main"; }
                case 2: { _section++; return "second_cate_main"; }
                case 3: { _section++; return "third_cate_main"; }
                case 4: { _section++; return "fourth_cate_main"; }
                case 5: { _section++; return "five_cate_main"; }
                default: return "";
            }
        }
        //public string setClassSectionLeft()
        //{
        //    return setClassSection(_sectionleft);
        //}
        //public string setClassSectionMain()
        //{
        //    return setClassSection(_section);
        //}
        public string setClass()
        {
            switch (_classname)
            {
                case 1: { _classname++; return "first active"; }
                case 2: { _classname++; return "second"; }
                case 3: { _classname++; return "third"; }
                case 4: { _classname++; return "fourth"; }
                case 5: { _classname++; return "five"; }
                default: return "";
            }
        }
        public int setCountcate()
        {
            return _countpro++;
        }
        public string spiltCate(object cat_name)
        {
            string name = Utils.CStrDef(cat_name);
            if (name.Length > 9)
                name = name.Substring(0, 8) + "...";
            return name;
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