using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using MVC_Kutun.Components;
using Controller;

namespace MVC_Kutun.MOBILE.UIs
{
    public partial class search_result : System.Web.UI.UserControl
    {
        #region Declare
        Search_result search = new Search_result();
        Function fun = new Function();
        Pageindex_chage change = new Pageindex_chage();
        string _txt = string.Empty;
        int _page = 0;
        int _catid = 0;
        clsFormat fm = new clsFormat();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

            _page = Utils.CIntDef(Request.QueryString["page"]);
            _txt = Utils.CStrDef(Request.QueryString["keyword"]);
            _catid = Utils.CIntDef(Request.QueryString["catid"]);
            Hdcatid.Value = _catid.ToString();
            Hdkeyword.Value = _txt;
            if (!IsPostBack)
            {
                Load_list();
            }
        }
        #region Loadsearch
        public void Load_list()
        {
            try
            {
                int _sotin = 20;

                if (_txt == "Từ khóa tìm kiếm")
                {
                    _txt = "";
                }
                else
                {
                    if (!_txt.Contains("%"))
                        _txt = "%" + _txt + "%";
                }
                var _vNews = search.Load_search_result(_txt, 1, _catid);
                if (_vNews.Count > 0)
                {
                    if (_page != 0)
                    {
                        Rpproduct.DataSource = _vNews.Skip(_sotin * _page - _sotin).Take(_sotin);
                        Rpproduct.DataBind();
                    }
                    else
                    {
                        Rpproduct.DataSource = _vNews.Take(_sotin);
                        Rpproduct.DataBind();
                    }
                    //ltrPage.Text = change.result(_vNews.ToList().Count, _sotin, _txt, _catid,"", _page, 2);
                }
                Hdcount.Value = _vNews.Count.ToString();

            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #endregion
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