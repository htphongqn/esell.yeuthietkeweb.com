using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;

namespace MVC_Kutun.MOBILE.UIs
{
    public partial class footer_menu : System.Web.UI.UserControl
    {
        Propertity per = new Propertity();
        Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Loadmenu(3, ref Rpmenufoot);
        }
        #region Loadmenu
        public void Loadmenu(int pos, ref Repeater rp)
        {
            rp.DataSource = per.Loadmenu_footer(pos);
            rp.DataBind();
        }
        public IQueryable Load_caterank2(object catid)
        {
            return per.Menu2(catid);
        }
        #endregion
        #region function
        public string GetLink_Cat(object Cat_Url, object Cat_Seo_Url)
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

        #endregion
    }
}