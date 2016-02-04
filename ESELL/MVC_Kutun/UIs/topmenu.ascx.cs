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
    public partial class topmenu : System.Web.UI.UserControl
    {
        #region Declare
        Propertity per = new Propertity();
        Function fun = new Function();
        Home index = new Home();
        string _cat_seo_url = string.Empty;
        string _sNews_Seo_Url = string.Empty;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Check_type())
            {
                addControlSlide();
                div_script.Visible = false;
            }
            else
                div_script.Visible = true;
            if (!IsPostBack)
            {
                Loaddanhmuc();                
            }
        }
        private void addControlSlide()
        {
            UserControl ucslide = Page.LoadControl("/UIs/Ucslider-ads.ascx") as UserControl;
            PlSlider.Controls.Add(ucslide);
        }
        public string setStyle()
        {
            if (Check_type()) return "";
            return "style='display: block; height: 419px'";
        }
        public string addClass()
        {
            if (Check_type()) return " class='nav_menu' ";
            return " class='nav_menu home_menu' ";
        }
        private bool Check_type()
        {
            int _type = Utils.CIntDef(Request["type"]);
            return _type != 0 ? true : false;
        }
        #region Loaddata
        public void Loaddanhmuc()
        {
            try
            {
                Rpmenucate.DataSource = per.Load_danhmuc_position(1, 2);
                Rpmenucate.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
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
        public IQueryable Load_proindex2(object catid, int skip, int limit)
        {
            return index.Load_pro_index_cate2(catid, skip, limit, 3);
        }
        #endregion

        #region Function
      
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
        public string getImagecat(object cat_id, object cat_img)
        {
            return fun.Getimages_Cat(cat_id, cat_img);
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
        #region function
        public string spiltCate(object cat_name)
        {
            string name = Utils.CStrDef(cat_name);
            if (name.Length > 9)
                name = name.Substring(0, 8) + "...";
            return name;
        }
        public string getBuy(object news_id, object sta)
        {
            return fun.getBuy(news_id, sta);
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
        public string GetLinkNews(object News_Url, object News_Seo_Url)
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