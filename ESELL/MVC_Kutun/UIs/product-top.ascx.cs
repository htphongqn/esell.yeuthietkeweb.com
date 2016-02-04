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
    public partial class product_top : System.Web.UI.UserControl
    {
        #region Declare
        Home index = new Home();
        Function fun = new Function();
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
                Rppro_top.DataSource = index.loadtopCate(6);
                Rppro_top.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion
        #region function
        public string GetLinkCat(object Cat_Url, object Cat_Seo_Url)
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
        #endregion
    }
}