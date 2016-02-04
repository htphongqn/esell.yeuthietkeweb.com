using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;
using System.Web;
using System.IO;

namespace Controller
{
    public class List_product
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        public List<Pro_details_entity> Load_listpro(int _Catid, int _idhangsx, int _pricetype, string _price, int _sortype,string _param)
        {
            try
            {
                List<decimal> lprice = new List<decimal>();
                decimal pri1 = 0;
                decimal pri2 = 0;
                if (!String.IsNullOrEmpty(_price))
                {
                    string[] a = _price.Split(',');
                    if (a.Length == 2)
                    {
                        pri1 = Utils.CDecDef(a[0]);
                        pri2 = Utils.CDecDef(a[1]);
                    }
                    else pri1 = Utils.CDecDef(a[0]);
                }
                
                string[] paramth = new string[50];
                if (!String.IsNullOrEmpty(_param))
                {
                    paramth = _param.Split('-');
                    
                }
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where (c.CAT_ID == _Catid || c.CAT_PARENT_PATH.Contains(_Catid.ToString()))
                            && (_pricetype == 3 ? (b.NEWS_PRICE2 != 0 ? b.NEWS_PRICE2 < pri1 : b.NEWS_PRICE1 < pri1) : (_pricetype == 1 ? (b.NEWS_PRICE2 != 0 ? b.NEWS_PRICE2 >= pri1 && b.NEWS_PRICE2 <= pri2 : b.NEWS_PRICE1 >= pri1 && b.NEWS_PRICE1 <= pri2) : (_pricetype == 2 ? (b.NEWS_PRICE2!= 0 ? b.NEWS_PRICE2>pri1 : b.NEWS_PRICE1 > pri1) : 0 == _pricetype)))
                            && (!String.IsNullOrEmpty(_param) ? paramth.Contains(b.UNIT_ID2.ToString()) : true)
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_DESC, b.NEWS_PRICE1, b.NEWS_PRICE2, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, b.NEWS_FIELD3 }).Distinct();
                switch (_sortype)
                {
                    case 1: list = list.OrderBy(n => n.NEWS_TITLE); break;
                    case 2: list = list.OrderByDescending(n => n.NEWS_TITLE); break;
                    case 3: list = list.Where(n => n.NEWS_PRICE1 != 0).OrderByDescending(n => (n.NEWS_PRICE1 > n.NEWS_PRICE2 ? n.NEWS_PRICE1 : n.NEWS_PRICE2)); break;
                    case 4: list = list.Where(n => n.NEWS_PRICE1 != 0).OrderBy(n => (n.NEWS_PRICE1 > n.NEWS_PRICE2 ? n.NEWS_PRICE1 : n.NEWS_PRICE2)); break;
                    case 5: list = list.Where(n => n.NEWS_PRICE2 != 0).OrderByDescending(n => 100 - (n.NEWS_PRICE2 * 100 / n.NEWS_PRICE1)); break;
                    case 6: list = list.Where(n => n.NEWS_PRICE2 != 0).OrderBy(n => 100 - (n.NEWS_PRICE2 * 100 / n.NEWS_PRICE1)); break;
                    default: list = list.OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER); break;
                }
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
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
        public List<ESHOP_NEW> loadproAjax(int _Catid, int skip, int limit)
        {
            bool checkhsx = checkHangsx(_Catid);
            List<Pro_details_entity> l = new List<Pro_details_entity>();
            var list = (from a in db.ESHOP_NEWS_CATs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                        where (checkhsx==true ? b.UNIT_ID2==_Catid : c.CAT_ID == _Catid || c.CAT_PARENT_PATH.Contains(_Catid.ToString()))
                        select b).Distinct().OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER).Skip(skip).Take(limit).ToList();
            return list;
        }
        public List<Pro_details_entity> loadProhangsx(int _catid, int _pricetype, string _price, int _sortype, string _param)
        {
            List<decimal> lprice = new List<decimal>();
            decimal pri1 = 0;
            decimal pri2 = 0;
            if (!String.IsNullOrEmpty(_price))
            {
                string[] a = _price.Split(',');
                if (a.Length == 2)
                {
                    pri1 = Utils.CDecDef(a[0]);
                    pri2 = Utils.CDecDef(a[1]);
                }
                else pri1 = Utils.CDecDef(a[0]);
            }
            string[] paramth = new string[100];
            if (!String.IsNullOrEmpty(_param))
            {
                paramth = _param.Split('-');
            }
            List<Pro_details_entity> l = new List<Pro_details_entity>();
            var list = (from a in db.ESHOP_NEWS_CATs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                        where 
                        (!String.IsNullOrEmpty(_param) ? paramth.Contains(b.UNIT_ID2.ToString()) : b.UNIT_ID2 == _catid)
                       && (_pricetype == 3 ? (b.NEWS_PRICE2 != 0 ? b.NEWS_PRICE2 < pri1 : b.NEWS_PRICE1 < pri1) : (_pricetype == 1 ? (b.NEWS_PRICE2 != 0 ? b.NEWS_PRICE2 >= pri1 && b.NEWS_PRICE2 <= pri2 : b.NEWS_PRICE1 >= pri1 && b.NEWS_PRICE1 <= pri2) : (_pricetype == 2 ? (b.NEWS_PRICE2 != 0 ? b.NEWS_PRICE2 > pri1 : b.NEWS_PRICE1 > pri1) : 0 == _pricetype)))
                        select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_DESC, b.NEWS_PRICE1, b.NEWS_PRICE2, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, b.NEWS_FIELD3 }).Distinct();
            switch (_sortype)
            {
                case 1: list = list.OrderBy(n => n.NEWS_TITLE); break;
                case 2: list = list.OrderByDescending(n => n.NEWS_TITLE); break;
                case 3: list = list.Where(n => n.NEWS_PRICE1 != 0).OrderByDescending(n => (n.NEWS_PRICE1 > n.NEWS_PRICE2 ? n.NEWS_PRICE1 : n.NEWS_PRICE2)); break;
                case 4: list = list.Where(n => n.NEWS_PRICE1 != 0).OrderBy(n => (n.NEWS_PRICE1 > n.NEWS_PRICE2 ? n.NEWS_PRICE1 : n.NEWS_PRICE2)); break;
                case 5: list = list.Where(n => n.NEWS_PRICE2 != 0).OrderByDescending(n => 100 - (n.NEWS_PRICE2 * 100 / n.NEWS_PRICE1)); break;
                case 6: list = list.Where(n => n.NEWS_PRICE2 != 0).OrderBy(n => 100 - (n.NEWS_PRICE2 * 100 / n.NEWS_PRICE1)); break;
                default: list = list.OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER); break;
            }
            foreach (var i in list)
            {
                Pro_details_entity pro = new Pro_details_entity();
                pro.NEWS_ID = i.NEWS_ID;
                pro.NEWS_TITLE = i.NEWS_TITLE;
                pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                pro.NEWS_DESC = i.NEWS_DESC;
                pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                pro.NEWS_URL = i.NEWS_URL;
                pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                pro.NEWS_FIELD3 = i.NEWS_FIELD3;
        
                l.Add(pro);
            }
            return l;
        }
        public List<Pro_details_entity> loadProShop(string _cat_seo_url, int _catid, int _pricetype, string _price, int _sortype)
        {
            List<decimal> lprice = new List<decimal>();
            decimal pri1 = 0;
            decimal pri2 = 0;
            if (!String.IsNullOrEmpty(_price))
            {
                string[] a = _price.Split(',');
                if (a.Length == 2)
                {
                    pri1 = Utils.CDecDef(a[0]);
                    pri2 = Utils.CDecDef(a[1]);
                }
                else pri1 = Utils.CDecDef(a[0]);
            }
            List<Pro_details_entity> l = new List<Pro_details_entity>();
            var list = (from a in db.ESHOP_NEWS_CATs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                        join d in db.ESHOP_SHOPs on b.SHOP_ID equals d.ID
                        where
                        d.SEO_URL == _cat_seo_url
                       && (c.CAT_ID == _catid || _catid == 0 || (c.CAT_PARENT_PATH.Contains(_catid.ToString())))
                       && (_pricetype == 3 ? (b.NEWS_PRICE2 != 0 ? b.NEWS_PRICE2 < pri1 : b.NEWS_PRICE1 < pri1) : (_pricetype == 1 ? (b.NEWS_PRICE2 != 0 ? b.NEWS_PRICE2 >= pri1 && b.NEWS_PRICE2 <= pri2 : b.NEWS_PRICE1 >= pri1 && b.NEWS_PRICE1 <= pri2) : (_pricetype == 2 ? (b.NEWS_PRICE2 != 0 ? b.NEWS_PRICE2 > pri1 : b.NEWS_PRICE1 > pri1) : 0 == _pricetype)))
                        select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_DESC, b.NEWS_PRICE1, b.NEWS_PRICE2, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, b.NEWS_FIELD3 }).Distinct();
            switch (_sortype)
            {
                case 1: list = list.OrderBy(n => n.NEWS_TITLE); break;
                case 2: list = list.OrderByDescending(n => n.NEWS_TITLE); break;
                case 3: list = list.Where(n => n.NEWS_PRICE1 != 0).OrderByDescending(n => (n.NEWS_PRICE1 > n.NEWS_PRICE2 ? n.NEWS_PRICE1 : n.NEWS_PRICE2)); break;
                case 4: list = list.Where(n => n.NEWS_PRICE1 != 0).OrderBy(n => (n.NEWS_PRICE1 > n.NEWS_PRICE2 ? n.NEWS_PRICE1 : n.NEWS_PRICE2)); break;
                case 5: list = list.Where(n => n.NEWS_PRICE2 != 0).OrderByDescending(n => 100 - (n.NEWS_PRICE2 * 100 / n.NEWS_PRICE1)); break;
                case 6: list = list.Where(n => n.NEWS_PRICE2 != 0).OrderBy(n => 100 - (n.NEWS_PRICE2 * 100 / n.NEWS_PRICE1)); break;
                default: list = list.OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER); break;
            }
            foreach (var i in list)
            {
                Pro_details_entity pro = new Pro_details_entity();
                pro.NEWS_ID = i.NEWS_ID;
                pro.NEWS_TITLE = i.NEWS_TITLE;
                pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                pro.NEWS_DESC = i.NEWS_DESC;
                pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                pro.NEWS_URL = i.NEWS_URL;
                pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                pro.NEWS_FIELD3 = i.NEWS_FIELD3;

                l.Add(pro);
            }
            return l;
        }
        //check hang sx
        public bool checkHangsx(int id)
        {
            var list = db.ESHOP_CATEGORies.Where(n => n.CAT_ID == id).ToList();
            if (list.Count > 0)
                if (list[0].CAT_TYPE == 2)
                    return true;
            return false;
        }
        //check shop
        public bool checkShop(string seo_url)
        {
            var list = db.ESHOP_SHOPs.Where(n => n.SEO_URL == seo_url).ToList();
            if (list != null && list.Count > 0)
                    return true;
            return false;
        }
        //xuat xu
        public List<Pro_details_entity> loadProhangXuatxu(int _catid, int _pricetype, string _price, int _sortype)
        {
            List<decimal> lprice = new List<decimal>();
            decimal pri1 = 0;
            decimal pri2 = 0;
            if (!String.IsNullOrEmpty(_price))
            {
                string[] a = _price.Split(',');
                if (a.Length == 2)
                {
                    pri1 = Utils.CDecDef(a[0]);
                    pri2 = Utils.CDecDef(a[1]);
                }
                else pri1 = Utils.CDecDef(a[0]);
            }
            List<Pro_details_entity> l = new List<Pro_details_entity>();
            var list = (from a in db.ESHOP_NEWS_CATs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                        where b.UNIT_ID1 == _catid
                        && (_pricetype == 3 ? b.NEWS_PRICE1 < pri1 : (_pricetype == 1 ? b.NEWS_PRICE1 >= pri1 && b.NEWS_PRICE1 <= pri2 : (_pricetype == 2 ? b.NEWS_PRICE1 > pri1 : 0 == _pricetype)))
                        select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_DESC, b.NEWS_PRICE1, b.NEWS_PRICE2, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, b.NEWS_FIELD3 }).Distinct();
            switch (_sortype)
            {
                case 1: list = list.OrderBy(n => n.NEWS_TITLE); break;
                case 2: list = list.OrderByDescending(n => n.NEWS_TITLE); break;
                case 3: list = list.OrderByDescending(n => n.NEWS_PRICE1); break;
                case 4: list = list.OrderBy(n => n.NEWS_PRICE1); break;
                case 5: list = list.Where(n => n.NEWS_PRICE2 != 0).OrderByDescending(n => 100 - (n.NEWS_PRICE2 * 100 / n.NEWS_PRICE1)); break;
                case 6: list = list.Where(n => n.NEWS_PRICE2 != 0).OrderBy(n => 100 - (n.NEWS_PRICE2 * 100 / n.NEWS_PRICE1)); break;
                default: list = list.OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER); break;
            }
            foreach (var i in list)
            {
                Pro_details_entity pro = new Pro_details_entity();
                pro.NEWS_ID = i.NEWS_ID;
                pro.NEWS_TITLE = i.NEWS_TITLE;
                pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                pro.NEWS_DESC = i.NEWS_DESC;
                pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                pro.NEWS_URL = i.NEWS_URL;
                pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                pro.NEWS_FIELD3 = i.NEWS_FIELD3;
 
                l.Add(pro);
            }
            return l;
        }
        public bool checkXuatxu(int id)
        {
            var list = db.ESHOP_CATEGORies.Where(n => n.CAT_ID == id).ToList();
            if (list.Count > 0)
                if (list[0].CAT_TYPE == 3)
                    return true;
            return false;
        }
        public List<Pro_details_entity> Load_listproLike(List<string> _news_seo)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where _news_seo.Contains(b.NEWS_SEO_URL)
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_DESC, b.NEWS_PRICE1, b.NEWS_PRICE2, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE }).Distinct().OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                   
                    l.Add(pro);
                }
                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        //Load title
        public string Loadtitle(string _cat_seo_url)
        {
            try
            {
                var list = db.ESHOP_CATEGORies.Where(n => n.CAT_SEO_URL == _cat_seo_url).Select(n => new { n.CAT_NAME }).ToList();
                if (list.Count > 0)
                {
                    return list[0].CAT_NAME;
                }
                return "";
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Get sotin
        public int Getsotin(int catid)
        {
            int sotin = db.ESHOP_CATEGORies.Where(n => n.CAT_ID == catid).ToList().Count > 0 ? Utils.CIntDef(db.ESHOP_CATEGORies.Where(n => n.CAT_ID == catid).First().CAT_PAGEITEM) : 0;
            return sotin;
        }
        public List<ESHOP_NEW> getTooltip(string news_url)
        {
            var list = db.ESHOP_NEWs.Where(n => n.NEWS_SEO_URL == news_url).ToList();
            return list;
        }
        public string getHmtlSeo(int id)
        {
            string pathFile;
            string strHTMLContent;
            string _result = string.Empty;
            if (id > 0)
            {
               
                var newsInfo = db.GetTable<ESHOP_CATEGORy>().Where(n => n.CAT_ID == id);

                if (newsInfo.ToList().Count > 0)
                {

                    pathFile = HttpContext.Current.Server.MapPath(PathFiles.GetPathCategory(id) + "/" + newsInfo.ToList()[0].CAT_FIELD5);
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
    }
}
