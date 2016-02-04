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
    public partial class foot_menubottom : System.Web.UI.UserControl
    {
        #region Declare
        Propertity per = new Propertity();
        Function fun = new Function();
        Config cf = new Config();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Loadmenu(3, ref Rpmenu_foot);
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
        #endregion
        #region Counter
        public string Loadcounter()
        {
            var _hit = cf.Config_meta();
            if (_hit.ToList().Count > 0)
            {
                return Utils.CStrDef(_hit.ToList()[0].CONFIG_HITCOUNTER);

            }
            return "";

        }
        public string Loadonlineday()
        {
            try
            {

                return Application["Online"].ToString();

            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion
    }
}