using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Web.UI.HtmlControls;
using Controller;
using MVC_Kutun.Components;
using System.Drawing;

namespace MVC_Kutun.vi_vn
{
    public partial class page_default : System.Web.UI.Page
    {
        #region Declare
        Get_session getsession = new Get_session();
        Config cf = new Config();
        setCookieDevice setckdv = new setCookieDevice();
        int device = 0;
        #endregion
        #region Page Event
        protected void Page_PreInit(object sender, EventArgs e)
        {
            HttpCookie cookie = setckdv.GetCookie();
            string devicechar = Utils.CStrDef(Request.UserAgent).ToLower();
            if (Request.Cookies["deviceck"] != null)
            {
                if (cookie.HasKeys)
                {
                    device = 1;
                }
                else if (Request.Browser.IsMobileDevice)
                {
                    device = 1;
                }
            }
            else if (Request.Browser.IsMobileDevice || devicechar.Contains("mobile") || devicechar.Contains("ipad"))
            {
                device = 1;
            }
            if (device == 0) Page.MasterPageFile = "/Master/Master.Master";
            else Page.MasterPageFile = "/MOBILE/Master/Master.Master";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["home"] = 1;
            bool err = false;
            try
            {                
                Bind_icon();
                string _catSeoUrl = Utils.CStrDef(Request.QueryString["purl"]);
                UserControl list_pro_shop = null;
                UserControl list_pro = null;
                UserControl prodetails = null;
                UserControl list_news = null;
                UserControl details_news = null;
                UserControl search = null;
                if (device == 0)
                {
                    list_pro_shop = Page.LoadControl("../UIs/list-product-shop.ascx") as UserControl;
                    list_pro = Page.LoadControl("../UIs/list-product.ascx") as UserControl;
                    prodetails = Page.LoadControl("../UIs/product-details.ascx") as UserControl;
                    list_news = Page.LoadControl("../UIs/listnews.ascx") as UserControl;
                    details_news = Page.LoadControl("../UIs/news-details.ascx") as UserControl;
                    search = Page.LoadControl("../UIs/search-result.ascx") as UserControl;
                }
                else
                {
                    list_pro_shop = Page.LoadControl("/MOBILE/UIs/list-product-shop.ascx") as UserControl;
                    list_pro = Page.LoadControl("/MOBILE/UIs/list-product.ascx") as UserControl;
                    prodetails = Page.LoadControl("/MOBILE/UIs/product-detail.ascx") as UserControl;
                    list_news = Page.LoadControl("/MOBILE/UIs/list-news.ascx") as UserControl;
                    details_news = Page.LoadControl("/MOBILE/UIs/news-details.ascx") as UserControl;
                    search = Page.LoadControl("/MOBILE/UIs/search-result.ascx") as UserControl;
                }
                int _type = Utils.CIntDef(Request["type"]);
                switch (_type)
                {
                    case 3:
                        if (getsession.checkShop(_catSeoUrl))
                        {
                            getsession.LoadShopInfo(_catSeoUrl);
                            Bind_meta_tag_shop();
                            phdMain.Controls.Add(list_pro_shop);                          
                        }
                        else if (getsession.check_CatorNews(_catSeoUrl))
                        {
                            getsession.LoadNewsInfo(_catSeoUrl);
                            Bind_meta_tags_news();
                            if (getsession.Getcat_type(_catSeoUrl) == 1)
                            {
                                phdMain.Controls.Add(prodetails);
                            }
                            else
                            {
                                phdMain.Controls.Add(details_news);
                            }
                        }
                        else
                        {
                            if (!getsession.check_catExits(_catSeoUrl))
                            {
                                err = true;
                            }
                            else
                            {
                                getsession.LoadCatInfo(_catSeoUrl);
                                Bind_meta_tags_cat();
                                if (Utils.CIntDef(Session["Cat_type"]) == 1 || Utils.CIntDef(Session["Cat_type"]) == 2 || Utils.CIntDef(Session["Cat_type"]) == 3 || _catSeoUrl.Contains("san-pham-yeu-thich"))
                                {
                                    phdMain.Controls.Add(list_pro);
                                }
                                else
                                {
                                    if (Utils.CIntDef(Session["Cat_showitem"]) == 1)
                                    {
                                        phdMain.Controls.Add(details_news);
                                    }
                                    else phdMain.Controls.Add(list_news);
                                }
                            }                           
                        }
                        break;
                    case 5:
                        Bind_meta_tag_index();
                        phdMain.Controls.Add(search);
                        break;
                    default:
                        //Response.Redirect("/");
                        break;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            if (err == true)
            {
                Response.Redirect("/thong-bao-loi.html");
            }
        }
        #endregion
        public void Bind_meta_tags_cat()
        {
            #region Bind Meta Tags
            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();

            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            header.Title = Utils.CStrDef(Session["Cat_seo_title"]);
            headerDes.Content = Utils.CStrDef(Session["Cat_seo_desc"]);
            headerKey.Content = Utils.CStrDef(Session["Cat_seo_keyword"]);


            if (string.IsNullOrEmpty(headerDes.Content))
            {
                headerDes.Content = "";
            }
            header.Controls.Add(headerDes);

            if (string.IsNullOrEmpty(headerKey.Content))
            {
                headerKey.Content = "";
            }

            header.Controls.Add(headerKey);
            #endregion
        }
        public void Bind_meta_tags_news()
        {
            #region Bind Meta Tags
            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            //Face tags
            HtmlMeta propety = new HtmlMeta();
            HtmlMeta propetyTitle = new HtmlMeta();
            HtmlMeta propetyDesc = new HtmlMeta();
            //Twitter tags
            HtmlMeta propetyTw = new HtmlMeta();
            HtmlMeta propetyTitleTw = new HtmlMeta();
            HtmlMeta propetyDescTw = new HtmlMeta();

            headerDes.Name = "Description";
            headerKey.Name = "Keywords";
            header.Title = Utils.CStrDef(Session["News_seo_title"]);
            headerDes.Content = Utils.CStrDef(Session["News_seo_desc"]);
            headerKey.Content = Utils.CStrDef(Session["News_seo_keyword"]);
            if (string.IsNullOrEmpty(headerDes.Content))
            {
                headerDes.Content = "";
            }
            header.Controls.Add(headerDes);

            if (string.IsNullOrEmpty(headerKey.Content))
            {
                headerKey.Content = "";
            }

            header.Controls.Add(headerKey);
            //Facebook meta
            propety.Attributes.Add("property", "og:image");
            propety.Content = String.Format("{0}{1}{2}", System.Configuration.ConfigurationManager.AppSettings["URLWebsite"], PathFiles.GetPathNews(Utils.CIntDef(Session["News_id"])), Utils.CStrDef(Session["News_image3"]));
            header.Controls.Add(propety);
            ////Title         
            //propetyTitle.Attributes.Add("property", "og:title");
            //propetyTitle.Content = Utils.CStrDef(Session["News_seo_title"]);
            //header.Controls.Add(propetyTitle);
            ////Desc
            //propetyDesc.Attributes.Add("property", "og:description");
            //propetyDesc.Content = Utils.CStrDef(Session["News_seo_desc"]);
            //header.Controls.Add(propetyDesc);
            ////Twitter meta
            //propetyTw.Attributes.Add("property", "twitter:image");
            //propetyTw.Content = "" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "" + PathFiles.GetPathNews(Utils.CIntDef(Session["News_id"])) + Utils.CStrDef(Session["News_image3"]);
            //header.Controls.Add(propetyTw);
            ////Title         
            //propetyTitleTw.Attributes.Add("property", "twitter:title");
            //propetyTitleTw.Content = Utils.CStrDef(Session["News_seo_title"]);
            //header.Controls.Add(propetyTitleTw);
            ////Desc
            //propetyDescTw.Attributes.Add("property", "twitter:description");
            //propetyDescTw.Content = Utils.CStrDef(Session["News_seo_desc"]);
            //header.Controls.Add(propetyDescTw);


            #endregion
        }
        private void Bind_icon()
        {
            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
            }
        }
        public void Bind_meta_tag_index()
        {
            #region Metaindex
            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";

                header.Title = _configs.ToList()[0].CONFIG_TITLE;

                headerDes.Content = _configs.ToList()[0].CONFIG_DESCRIPTION;
                header.Controls.Add(headerDes);

                headerKey.Content = _configs.ToList()[0].CONFIG_KEYWORD;
                header.Controls.Add(headerKey);
            }
            else
            {
                header.Title = "Enews Standard V1.0";

                headerDes.Content = "Enews Standard V1.0";
                header.Controls.Add(headerDes);

                headerKey.Content = "Enews Standard V1.0";
                header.Controls.Add(headerKey);
            }
            #endregion
        }
        public void Bind_meta_tag_shop()
        {
            #region Bind Meta Tags
            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            //Face tags
            HtmlMeta propety = new HtmlMeta();
            HtmlMeta propetyTitle = new HtmlMeta();
            HtmlMeta propetyDesc = new HtmlMeta();
            //Twitter tags
            HtmlMeta propetyTw = new HtmlMeta();
            HtmlMeta propetyTitleTw = new HtmlMeta();
            HtmlMeta propetyDescTw = new HtmlMeta();

            headerDes.Name = "Description";
            headerKey.Name = "Keywords";
            header.Title = Utils.CStrDef(Session["Shop_seo_title"]);
            headerDes.Content = Utils.CStrDef(Session["Shop_seo_desc"]);
            headerKey.Content = Utils.CStrDef(Session["Shop_seo_keyword"]);
            if (string.IsNullOrEmpty(headerDes.Content))
            {
                headerDes.Content = "";
            }
            header.Controls.Add(headerDes);

            if (string.IsNullOrEmpty(headerKey.Content))
            {
                headerKey.Content = "";
            }

            header.Controls.Add(headerKey);
            //Facebook meta
            propety.Attributes.Add("property", "og:image");
            propety.Content = String.Format("{0}{1}{2}", System.Configuration.ConfigurationManager.AppSettings["URLWebsite"], PathFiles.GetPathNews(Utils.CIntDef(Session["News_id"])), Utils.CStrDef(Session["News_image3"]));
            header.Controls.Add(propety);
            ////Title         
            //propetyTitle.Attributes.Add("property", "og:title");
            //propetyTitle.Content = Utils.CStrDef(Session["News_seo_title"]);
            //header.Controls.Add(propetyTitle);
            ////Desc
            //propetyDesc.Attributes.Add("property", "og:description");
            //propetyDesc.Content = Utils.CStrDef(Session["News_seo_desc"]);
            //header.Controls.Add(propetyDesc);
            ////Twitter meta
            //propetyTw.Attributes.Add("property", "twitter:image");
            //propetyTw.Content = "" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "" + PathFiles.GetPathNews(Utils.CIntDef(Session["News_id"])) + Utils.CStrDef(Session["News_image3"]);
            //header.Controls.Add(propetyTw);
            ////Title         
            //propetyTitleTw.Attributes.Add("property", "twitter:title");
            //propetyTitleTw.Content = Utils.CStrDef(Session["News_seo_title"]);
            //header.Controls.Add(propetyTitleTw);
            ////Desc
            //propetyDescTw.Attributes.Add("property", "twitter:description");
            //propetyDescTw.Content = Utils.CStrDef(Session["News_seo_desc"]);
            //header.Controls.Add(propetyDescTw);


            #endregion
        }
    }
}