using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace MVC_Kutun.MOBILE.UIs
{
    public partial class ProQuantam : System.Web.UI.UserControl
    {
        Product_Details pro_detail = new Product_Details();
        Function fun = new Function();
        string _sNewsSeoUrl = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
             _sNewsSeoUrl = Utils.CStrDef(Request.QueryString["purl"]);
             Load_random_quantam(_sNewsSeoUrl);
        }
        private void Load_random_quantam(string News_Seo_Url)
        {
            Rpproquantam.DataSource = pro_detail.loadPro_Random(News_Seo_Url, 10);
            Rpproquantam.DataBind();
        }
        #region function
       
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
        public string getTietkiem(object News_Price1, object News_Price2)
        {
            return fun.getTietkiem(News_Price1, News_Price2);
        }
        public string getPointietkiem(object News_Price1, object News_Price2)
        {
            return fun.getPointietkiem(News_Price1, News_Price2);
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
        public string getnamecate(object newsid)
        {
            try
            {
                return pro_detail.getnamecate(newsid);
            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion
    }
}