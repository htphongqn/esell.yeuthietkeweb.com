using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Web.UI.HtmlControls;
using Controller;

namespace MVC_Kutun.MOBILE.vi_vn
{
    public partial class support : System.Web.UI.Page
    {
        Config cf = new Config();
        Propertity per = new Propertity();
        Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {
            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
            }

            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            header.Title = "Hỗ trợ";
            loadMenu();
        }
        private void loadMenu()
        {
            RpmenunewsLeft.DataSource = per.Load_danhmuc_position(0, 2);
            RpmenunewsLeft.DataBind();
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
        #region function
        public string GetLink(object Cat_Url, object Cat_Seo_Url)
        {
            try
            {
                if (Utils.CStrDef(Cat_Seo_Url).Contains("lien-he"))
                    return "m-lien-he.html";
                return fun.Getlink_Cat(Cat_Url, Cat_Seo_Url);
            }
            catch (Exception)
            {

                throw;
            }
        }
        
        #endregion
    }
}