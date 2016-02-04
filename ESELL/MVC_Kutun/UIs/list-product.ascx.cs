using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using MVC_Kutun.Components;
using Controller;

namespace MVC_Kutun.UIs
{
    public partial class list_product : System.Web.UI.UserControl
    {
        #region Declare
        List_product list_pro = new List_product();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Pageindex_chage change = new Pageindex_chage();
        Home index = new Home();
        Checkcookie cki = new Checkcookie();
        int _Catid = 0,_idhangsx=0;
        string _cat_seo_url = string.Empty,_param = string.Empty;
        int _page = 0;
        string _price;
        int _pricetype,_sortvl=0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            _cat_seo_url = Request.QueryString["purl"];
            _page = Utils.CIntDef(Request.QueryString["page"]);
            _idhangsx = Utils.CIntDef(Request.QueryString["idhangsx"]);
            _pricetype = Utils.CIntDef(Request.QueryString["typepri"]);
            _price = Utils.CStrDef(Request.QueryString["price"]);
            _sortvl = Utils.CIntDef(Request.QueryString["sort"]);
            _param = Utils.CStrDef(Request.QueryString["paramTH"]);
            
            if (!IsPostBack)
            {
                Hdurl.Value = _cat_seo_url;
                Hdpage.Value = _page.ToString();
                Hdparam.Value = _param.ToString();
                Drsort.SelectedValue = _sortvl.ToString();
                Hdprice.Value = "price=" + _price + "&typepri=" + _pricetype;
                hiddenLeft();
                Loadtitle();
                Loadlist();
            }
        }
        private bool checkUrl()
        {
            if (_cat_seo_url.Contains("san-pham-yeu-thich"))
                return true;
            return false;
        }
        public string setStyle()
        {
            if (checkUrl())
                return "style='width: 100%'";
            return "";
        }
        private void hiddenLeft()
        {
            if (checkUrl())
                div_left.Visible = false;
            else
            div_left.Visible = true;
        }
        public void Loadtitle()
        {
            try
            {
                if (_cat_seo_url.Contains("san-pham-yeu-thich"))
                    Lbtitle.Text = "Sản phẩm yêu thích";
                else
                    Lbtitle.Text = list_pro.Loadtitle(_cat_seo_url);
            }
            catch (Exception)
            {

                throw;
            }
        }
        public void Loadlist()
        {
            try
            {
                if (_cat_seo_url.Contains("san-pham-yeu-thich"))
                {
                    Rplistpro.DataSource = list_pro.Load_listproLike(cki.Listcookie_like());
                    Rplistpro.DataBind();
                    return;
                }
                int sotin = list_pro.Getsotin(_Catid);
                if (list_pro.checkHangsx(_Catid))
                {
                    var listhsx = list_pro.loadProhangsx(_Catid,_pricetype, _price,_sortvl,_param);
                    if (listhsx.Count > 0)
                    {
                        if (_page != 0)
                        {
                            Rplistpro.DataSource = listhsx.Skip(sotin * _page - sotin).Take(sotin);
                            Rplistpro.DataBind();
                        }
                        else
                        {
                            Rplistpro.DataSource = listhsx.Take(sotin);
                            Rplistpro.DataBind();
                        }

                        string _listid = _sortvl.ToString();
                        ltrPage.Text = change.resultListproduct(listhsx.Count, sotin, _cat_seo_url,0, _listid,_price,_pricetype,_param, _page, 1);
                    }
                    return;
                }
                
                var list = list_pro.Load_listpro(_Catid,_idhangsx,_pricetype,_price,_sortvl,_param);
                if (list.Count > 0)
                {
                    if (_page != 0)
                    {
                        Rplistpro.DataSource = list.Skip(sotin * _page - sotin).Take(sotin);
                        Rplistpro.DataBind();
                    }
                    else
                    {
                        Rplistpro.DataSource = list.Take(sotin);
                        Rplistpro.DataBind();
                    }

                    string _listid = _sortvl.ToString();
                    ltrPage.Text = change.resultListproduct(list.Count, sotin, _cat_seo_url,0, _listid,_price,_pricetype,_param, _page, 1);

                }

            }
            catch (Exception)
            {

                throw;
            }
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