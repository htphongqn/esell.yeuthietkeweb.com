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
    public partial class left_menu_news : System.Web.UI.UserControl
    {
        #region Declare
        Propertity per = new Propertity();
        Function fun = new Function();
        string _url = string.Empty;
        int _cat_id = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _url = Request.QueryString["purl"];
            _cat_id = per.getCatidRank1(_url);
            if (!IsPostBack)
            {
                loadMenu();

            }
        }
        private void loadMenu()
        {
            Rpcateleft.DataSource = per.Load_danhmuc_position(0, 2);
            Rpcateleft.DataBind();
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
                return fun.Getlink_Cat(Cat_Url, Cat_Seo_Url);
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string getActive(object cat_id)
        {
           
            if (_cat_id == Utils.CIntDef(cat_id))
                return "style='display:block'";
            return "style='display:none'";
        }
        public string setClassCurrent(object cat_id)
        {
            if (_cat_id == Utils.CIntDef(cat_id))
                return "current";
            return "";
        }
        #endregion
    }
}