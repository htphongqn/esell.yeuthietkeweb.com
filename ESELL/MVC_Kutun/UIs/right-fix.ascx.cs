using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using MVC_Kutun.Components;

namespace MVC_Kutun.UIs
{
    public partial class right_fix : System.Web.UI.UserControl
    {
        #region Decclare
        Propertity per = new Propertity();
        Home index = new Home();
        Function fun = new Function();
        Cart_result cart = new Cart_result();
        Checkcookie ck = new Checkcookie();
        setCookieDevice setckdv = new setCookieDevice();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_prosee();

            }
        }
        #region loaddata
        private void Load_prosee()
        {
            Rppro_see.DataSource = index.Loadpro_cookie(1,ck.Listcookie_see());
            Rppro_see.DataBind();
        }

        public int countprosee()
        {
            return index.Loadpro_cookie(1,ck.Listcookie_see()).Count;
        }
      
        
        #endregion
        #region function
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
        #endregion
        protected void Lbadddevice_Click(object sender, EventArgs e)
        {
            setckdv.Addcookie("itemmobile");
            string _url = Utils.CStrDef(Request["purl"]);
            if (!String.IsNullOrEmpty(_url))
                Response.Redirect("/" + _url + ".html");
            else
                Response.Redirect("/");
        }
    }
}