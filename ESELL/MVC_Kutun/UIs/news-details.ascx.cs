using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using MVC_Kutun.Components;
using System.IO;
using Controller;

namespace MVC_Kutun.UIs
{
    public partial class news_details : System.Web.UI.UserControl
    {
        #region Declare

        public clsFormat _clsFormat = new clsFormat();
        News_details ndetail = new News_details();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        string _sNews_Seo_Url = string.Empty;
        SendMail send = new SendMail();
        Attfile att = new Attfile();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            Show_File_HTML();
            //hplPrint.HRef = "/in/" + _sNews_Seo_Url + ".html";
            Loadattfile();
            Get_ViewMore();
            Tinkhac();
            gettitle();
        }
        #region Attfile
        public void Loadattfile()
        {
            Rpattfile.DataSource = att.Load_att(_sNews_Seo_Url);
            Rpattfile.DataBind();
        }
        public string BindAttItems(object News_Id, object Ext_Id, object Att_Name, object Att_Url, object Att_File, object Ext_Image)
        {
            return att.BindAttItems(News_Id, Ext_Id, Att_Name, Att_Url, Att_File, Ext_Image);
        }
        #endregion
        #region My Function
        public void gettitle()
        {
            try
            {

                //lbtitle_cate.Text = ndetail.gettitle(_sNews_Seo_Url).Count > 0 ? ndetail.gettitle(_sNews_Seo_Url)[0].Cat_name : ""; ;
                lbNewsTitle.Text = ndetail.gettitle(_sNews_Seo_Url).Count > 0 ? ndetail.gettitle(_sNews_Seo_Url)[0].News_title : "";
            }
            catch (Exception)
            {

                throw;
            }
        }



        private void Get_ViewMore()
        {
            try
            {
                int _newsID = Utils.CIntDef(Session["news_id"]);
                hplViewmore.HRef = ndetail.Get_ViewMore(_newsID);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        private void Show_File_HTML()
        {
            try
            {
                liHtml.Text = ndetail.Showfilehtm(_sNews_Seo_Url);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        public void Tinkhac()
        {
            try
            {
                if (_sNews_Seo_Url != "")
                {
                    var _tinTucKhac = ndetail.Load_othernews(_sNews_Seo_Url);
                    if (_tinTucKhac.ToList().Count > 0)
                    {
                        Rptinkhac.DataSource = _tinTucKhac;
                        Rptinkhac.DataBind();
                    }
                    else
                        dvOtherNews.Visible = false;
                }
                else dvOtherNews.Visible = false;
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
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
        public string getDate(object News_PublishDate)
        {
            return fun.getDate(News_PublishDate);
        }
        #endregion
    }
}