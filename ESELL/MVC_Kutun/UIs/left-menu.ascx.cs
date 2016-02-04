using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;

namespace MVC_Kutun.UIs
{
    public partial class left_menu : System.Web.UI.UserControl
    {
        #region Declare
        Propertity per = new Propertity();
        Function fun = new Function();
        List_product listpro = new List_product();
        string _cat_seo_url = string.Empty;
        string _sNews_Seo_Url = string.Empty;
        int _Catid = 0, _page = 0, _sortvl, _pricetype=0;
        string _param = string.Empty;
        string _price=string.Empty;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _cat_seo_url = Request.QueryString["purl"];
            //_sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            _Catid = Utils.CIntDef(Session["Cat_id"]);
             _page = Utils.CIntDef(Request.QueryString["page"]);
             _sortvl = Utils.CIntDef(Request.QueryString["sort"]);
             _pricetype = Utils.CIntDef(Request.QueryString["typepri"]);
             _price = Utils.CStrDef(Request.QueryString["price"]);
             _param = Utils.CStrDef(Request.QueryString["paramTH"]);
            
             Hdurl.Value = "/" + _cat_seo_url + ".html?page=" + _page + "&price=" + _price + "&typepri=" + _pricetype + "&paramTH=" + _param;
            if (!IsPostBack)
            { 
                Loaddanhmuc();
                getHangsx();
                getTitlecate();
            }
        }
        #region Loaddata
        public void Loaddanhmuc()
        {
            try
            {
                Rpleftmenu.DataSource = per.Load_danhmuc_left(_cat_seo_url,_Catid);
                Rpleftmenu.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
        private void getHangsx()
        {
            var list = per.Load_hangsx(_cat_seo_url);
            if (list.Count > 0)
            {
                Rphangsx.DataSource = per.Load_hangsx(_cat_seo_url);
                Rphangsx.DataBind();
            }
            else
                div_thuonghieu.Visible = false;
        }
       
        protected IQueryable Load_Menu2(object cat_parent_id)
        {
            try
            {
                return per.Menu2(cat_parent_id);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        private void getTitlecate()
        {
            //Lbtitle_cate.Text = listpro.Loadtitle(_cat_seo_url);
        }
        #endregion
       
        #region Function
        public string setChecked(object cat_id)
        {
            int _catidTH = Utils.CIntDef(cat_id);
            if (!String.IsNullOrEmpty(_param))
            {
                string[] a = _param.Split('-');
                if (a.Contains(_catidTH.ToString()))
                    return "checked='true'";
            }
            return "";
        }
        public string getLink_hangsx(object cat_id)
        {
            return _cat_seo_url + ".html?page=0&idhangsx=" + cat_id;
        }
        public string getLink_price(string price,int typepri)
        {
            return _cat_seo_url + ".html?page=0&price=" + price+"&typepri="+typepri;
        }
        public string GetLink(object Cat_Url, object Cat_Seo_Url)
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
        public string GetLink_news(object News_Url, object News_Seo_Url, object cat_seo)
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
        #endregion
       
    }
}