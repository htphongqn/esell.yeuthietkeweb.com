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
    public partial class news_index : System.Web.UI.UserControl
    {
        #region Declare
        Home index = new Home();
        Function fun = new Function();
        Propertity per = new Propertity();
        int type = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Loadindex();
            }
        }
        #region Lodata
        public void Loadindex()
        {
            try
            {
                int perior=0;
                string  _cat_seo_url = Request.QueryString["purl"];
                if (Request.RawUrl.Contains("videos"))
                {
                    _cat_seo_url = "videos";
                }
                type = per.getType(_cat_seo_url, _cat_seo_url);
                if (type == 0) perior = 8;
                else perior = 10;
                var list = index.Loadindex(0, perior, 4);
                if (list.Count > 0)
                {
                    Rpnews_sliderleft.DataSource = list;
                    Rpnews_sliderleft.DataBind();
                    Rpnews_sliderright.DataSource = list;
                    Rpnews_sliderright.DataBind();
                }

            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion
        #region function
        public string setStyle()
        {
            if (type == 0) return "style='display:none'";
            return "style='display:block'";
        }
        public string setStyle1()
        {
            if (type == 0) return "style='display:block'";
            return "style='display:none'";
        }
        public string setOpacity()
        { 
            if(type!=0) return "style='opacity: 1;'";
            return "";
        }
        public string getVideo(object NEWS_FIELD5)
        {
            return per.getVideoNews(NEWS_FIELD5);
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
        public string GetImageT(object News_Id, object News_Image1,object link)
        {

            try
            {
                if(type==0)
                return fun.GetImageT_News(News_Id, News_Image1);
                return per.getImagesYoutube(link);
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