using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;
using System.Web;
using System.Web.UI;
using System.IO;

namespace Controller
{
    public class Home
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        //Pro or news hien thi trang chu
        public List<ESHOP_NEW> Loadindex(int type, int period, int limit)
        {
            try
            {
                var list = db.ESHOP_NEWs.Where(n => n.NEWS_PERIOD == period && n.NEWS_TYPE == type).OrderByDescending(n=>n.NEWS_PUBLISHDATE).OrderByDescending(n=>n.NEWS_ORDER_PERIOD).ToList();
                return list;
               
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<Pro_details_entity> LoadindexMobile(int type, int period,int skip, int limit)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where b.NEWS_PERIOD == period && b.NEWS_TYPE == type
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE1, b.NEWS_IMAGE3, b.NEWS_PRICE1, b.NEWS_PRICE2, b.NEWS_DESC, b.NEWS_FIELD3, b.NEWS_FIELD5, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, b.NEWS_DIET }).Distinct().OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER_PERIOD).Skip(skip).Take(limit).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE1 = i.NEWS_IMAGE1;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = "";
                    pro.NEWS_DIET = i.NEWS_DIET;
                    pro.NEWS_FIELD3 = i.NEWS_FIELD3;
                    l.Add(pro);
                }
                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        //Pro index all
        public List<Pro_details_entity> Loadindex_all(int type,int skip, int limit)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where (b.NEWS_PERIOD > 1 && b.NEWS_PERIOD <= 5) && b.NEWS_TYPE == type
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE1, b.NEWS_IMAGE3, b.NEWS_PRICE1, b.NEWS_PRICE2, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE,b.NEWS_FIELD3, c.CAT_SEO_URL }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER_PERIOD).Skip(skip).Take(limit).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE1 = i.NEWS_IMAGE1;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.NEWS_FIELD3 = i.NEWS_FIELD3;
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    l.Add(pro);
                }
                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        //Getpro cookie
        public List<Pro_details_entity> Loadpro_cookie(int type, List<string> listnews_url)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where b.NEWS_TYPE == type && listnews_url.Contains(b.NEWS_SEO_URL)
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE1, b.NEWS_IMAGE3, b.NEWS_PRICE1, b.NEWS_PRICE2, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, c.CAT_SEO_URL }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER_PERIOD).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE1 = i.NEWS_IMAGE1;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    l.Add(pro);
                }
                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<Pro_details_entity> Loadpro_new(int type,int limit)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where b.NEWS_TYPE == type
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE1, b.NEWS_IMAGE3, b.NEWS_PRICE1, b.NEWS_PRICE2, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, c.CAT_SEO_URL }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER_PERIOD).Take(limit).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE1 = i.NEWS_IMAGE1;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    l.Add(pro);
                }
                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        //Categories hien tri trang chu
        public List<ESHOP_CATEGORy> Load_cate_index(int limit, int type,int skip)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_STATUS == 1 && n.CAT_PERIOD == 1 && n.CAT_TYPE == type&&n.CAT_RANK==1).OrderByDescending(n => n.CAT_PERIOD_ORDER).Skip(skip).Take(limit).ToList();
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Load ajax cate news
        public List<ESHOP_CATEGORy> Load_cate_ajaxnews(int id)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_STATUS == 1 && n.CAT_ID == id).OrderByDescending(n => n.CAT_PERIOD_ORDER).ToList();
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public IQueryable<ESHOP_CATEGORy> Load_cate_index_rank2(object cat_id, int limit)
        {
            int id = Utils.CIntDef(cat_id);
            var list = db.ESHOP_CATEGORies.Where(n => (n.CAT_PARENT_ID == id||n.CAT_PARENT_PATH.Contains(cat_id.ToString()))&&n.CAT_STATUS==1&&n.CAT_PERIOD==1).OrderBy(n=>n.CAT_ID).OrderByDescending(n => n.CAT_PERIOD_ORDER).Take(limit);
            return list.ToList().Count > 0 ? list : null;
        }
        public IQueryable<Pro_details_entity> Load_pro_index_cate(object catid,int skip,int limit)
        {
            try
            {
                int id = Utils.CIntDef(catid);
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where (c.CAT_ID == id || c.CAT_PARENT_PATH.Contains(id.ToString()))
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_PRICE2, b.NEWS_PRICE1, b.NEWS_URL, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, b.NEWS_FIELD3 }).Distinct().OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER_PERIOD).Skip(skip).Take(limit).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = "";
                    pro.NEWS_FIELD3 = i.NEWS_FIELD3;
                    l.Add(pro);
                }
                return l.AsQueryable();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public IQueryable<Pro_details_entity> Load_pro_index_cate2(object catid, int skip, int limit, int period)
        {
            try
            {
                int id = Utils.CIntDef(catid);
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where (c.CAT_ID == id || c.CAT_PARENT_PATH.Contains(id.ToString())) 
                            && b.NEWS_PERIOD == period
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_PRICE2, b.NEWS_PRICE1, b.NEWS_URL, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, b.NEWS_FIELD3 }).Distinct().OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER_PERIOD).Skip(skip).Take(limit).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = "";
                    pro.NEWS_FIELD3 = i.NEWS_FIELD3;
                    l.Add(pro);
                }
                return l.AsQueryable();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public IQueryable<Pro_details_entity> Load_news_index_cate(object catid, int skip, int limit)
        {
            try
            {
                int id = Utils.CIntDef(catid);
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where (c.CAT_ID == id || c.CAT_PARENT_PATH.Contains(id.ToString()))
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_PRICE2, b.NEWS_PRICE1, b.NEWS_URL, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE,b.NEWS_DIET, c.CAT_SEO_URL }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER_PERIOD).Skip(skip).Take(limit).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    pro.NEWS_DIET = i.NEWS_DIET;
                    l.Add(pro);
                }
                return l.AsQueryable();
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Tin hiển thị tức thời trang chủ
        public string Gettitle_Showfilehtml_index(int period)
        {
            try
            {
                string _result = string.Empty;
                var getnewsid = db.ESHOP_NEWs.Where(n => n.NEWS_PERIOD == period).Select(n => new { n.NEWS_TITLE }).Take(1).ToList();
                if (getnewsid.Count > 0)
                {
                    _result = getnewsid[0].NEWS_TITLE;
                }
                return _result;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string Getdesc_Showfilehtml_index(int period)
        {
            try
            {
                string _result = string.Empty;
                var getnewsid = db.ESHOP_NEWs.Where(n => n.NEWS_PERIOD == period).Select(n => new { n.NEWS_DESC }).Take(1).ToList();
                if (getnewsid.Count > 0)
                {
                    _result = getnewsid[0].NEWS_DESC;
                }
                return _result;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string getLinkHtml(int period)
        {
            try
            {
                string _result = "";
                var getnewsid = (from a in db.ESHOP_NEWS_CATs
                                 join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                                 where b.NEWS_PERIOD == period
                                 select new
                                 {
                                     a.ESHOP_CATEGORy.CAT_SEO_URL,
                                     b.NEWS_SEO_URL,
                                     b.NEWS_URL
                                 }).ToList();
                if (getnewsid.Count > 0)
                {
                    _result = string.IsNullOrEmpty(getnewsid[0].NEWS_URL) ? "/" + getnewsid[0].CAT_SEO_URL + "/" + getnewsid[0].NEWS_SEO_URL + ".html" : getnewsid[0].NEWS_URL;
                }
                return _result;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string getimgHtml(int period)
        {
            try
            {
                string _result = string.Empty;
                var list = db.ESHOP_NEWs.Where(n => n.NEWS_PERIOD == period).ToList();
                if (list.Count > 0)
                {
                    if (!String.IsNullOrEmpty(list[0].NEWS_IMAGE3))
                    {
                        _result = PathFiles.GetPathNews(list[0].NEWS_ID) + "/" + list[0].NEWS_IMAGE3;
                    }
                }
                return _result;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string Showfilehtml_index(int period)
        {
            try
            {
                int _newsID = 0;
                string _result = string.Empty;
                var getnewsid = db.ESHOP_NEWs.Where(n => n.NEWS_PERIOD == period).Select(n => new { n.NEWS_ID }).Take(1).ToList();
                if (getnewsid.Count > 0)
                {
                    _newsID = getnewsid[0].NEWS_ID;
                }
                string pathFile;
                string strHTMLContent;

                if (_newsID > 0)
                {

                    var newsInfo = db.GetTable<ESHOP_NEW>().Where(n => n.NEWS_ID == _newsID);

                    if (newsInfo.ToList().Count > 0)
                    {

                        pathFile = HttpContext.Current.Server.MapPath(PathFiles.GetPathNews(_newsID) + "/" + newsInfo.ToList()[0].NEWS_FILEHTML);
                        if ((File.Exists(pathFile)))
                        {
                            StreamReader objNewsReader;
                            objNewsReader = new StreamReader(pathFile);
                            strHTMLContent = objNewsReader.ReadToEnd();
                            objNewsReader.Close();
                            _result = strHTMLContent;
                        }

                    }

                }
                return _result;
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Danh muc cate theo vi tri
        public List<ESHOP_CATEGORy> Load_danhmuc(int type, int postion, int limit)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_TYPE == type && n.CAT_STATUS == 1 && n.CAT_POSITION == postion).Take(limit).ToList();
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public IQueryable<ESHOP_AD_ITEM> load_ads_cate(object cat_id, int pos)
        {
            int id = Utils.CIntDef(cat_id);
            var list = (from a in db.ESHOP_AD_ITEMs
                        join b in db.ESHOP_AD_ITEM_CATs on a.AD_ITEM_ID equals b.AD_ITEM_ID
                        where b.CAT_ID == id && a.AD_ITEM_POSITION == pos
                        select a).OrderByDescending(n => n.AD_ITEM_ID);
            return list.ToList().Count > 0 ? list : null;
        }
        
        public List<ESHOP_CATEGORy> loadListCateID(int cat_id)
        {
            var list = db.ESHOP_CATEGORies.Where(n => n.CAT_ID == cat_id).ToList();
            return list;
        }
        public List<ESHOP_CATEGORy> loadtopCate(int pos)
        {
            var list = db.ESHOP_CATEGORies.Where(n=>n.CAT_POSITION==pos).ToList();
            return list;
        }
    }
}
