using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using System.Diagnostics;
using System.Threading.Tasks;

namespace MVC_Kutun.UIs
{
    public partial class main : System.Web.UI.UserControl
    {
        #region Declare
        Home index = new Home();
        Function fun = new Function();
        AsyntaskFunction mytask = new AsyntaskFunction();
        int _countsl = 0, _countpro = 1,_tabclass=1;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            //Stopwatch stopWatch = new Stopwatch();
            //stopWatch.Start();
            if (!IsPostBack)
            {
                Loadcate_index();
                loadProbuy();
            }
            //PageAsyncTask asynctask = new PageAsyncTask(mytask.OnBegin, mytask.OnEnd, mytask.OnTimeout, null);
            //Page.RegisterAsyncTask(asynctask);
            //Page.ExecuteRegisteredAsyncTasks();
            //stopWatch.Stop();
            //TaskMessage.InnerHtml = mytask.GetAsyncTaskProgress();
           
        }
        #region Lodata
       
        public void Loadcate_index()
        {
            try
            {
                Rpcateindex.DataSource = index.Load_cate_index(6, 1, 0);
                Rpcateindex.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
        private void loadProbuy()
        {
            Rpprobuy.DataSource = index.Loadindex(1, 2, 10);
            Rpprobuy.DataBind();
        }
        public IQueryable Load_proindex(object catid,int skip,int limit)
        {
            return index.Load_pro_index_cate(catid, skip, limit);
        }
        public IQueryable Load_proindex2(object catid, int skip, int limit, int period)
        {
            return index.Load_pro_index_cate2(catid, skip, limit, period);
        }
        public IQueryable Load_caterank2(object catid,int limit)
        {
            return index.Load_cate_index_rank2(catid,limit);
        }
        public IQueryable Load_ads_cate(object cat_id,int pos)
        {
            return index.load_ads_cate(cat_id,pos);
        }
        #endregion
        #region Asynctask
       
        #endregion
        #region function
        public int setCountsli()
        {
            return _countsl++;
        }
        public string setClass()
        {
            _countsl++;
            if (_countsl > 4)
                _countsl = 1;
            switch (_countsl)
            {
                case 1: return "hot_itemP";
                case 2: return "num1";
                case 3: return "num2";
                case 4: return "num3";
            }
            return "";
        }
        public string setFirstClass()
        {
            if (_countsl != 1)
                return "fl";
            return "";
        }
        public int setTabs()
        {
            return _tabclass++;
        }
      
        public string setCountcate()
        {
            return "cate_0"+_countpro++;
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
        public string getBuy(object news_id, object sta)
        {
            return null;// fun.getBuy(news_id, sta);
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
        public string GetImageAd(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url, object AD_ITEM_DESC)
        {
            try
            {
                return fun.GetImageAd(Ad_Id, Ad_Image1, Ad_Target, Ad_Url, AD_ITEM_DESC);
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