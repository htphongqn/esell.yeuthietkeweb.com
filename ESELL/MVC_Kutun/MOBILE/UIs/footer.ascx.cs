using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;

namespace MVC_Kutun.MOBILE.UIs
{
    public partial class footer : System.Web.UI.UserControl
    {
        #region Declare
        Config cf = new Config();
        Propertity per = new Propertity();
        Function fun = new Function();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Show_File_HTML();
                Loadface();
                //loadMenuFooter();
            }
        }
        private void Show_File_HTML()
        {
            Literal1.Text = cf.Show_File_HTML("footer-vi.htm", "/Data/footer/");
        }
        #region Facebook
        public void Loadface()
        {
            var list = per.Load_face();
            if (list.Count > 0)
            {
                Rpfacebook.DataSource = list;
                Rpfacebook.DataBind();
            }
        }
        public string LoadOnline(object online_type, object ONLINE_DESC, object nick)
        {
            return per.LoadOnline(online_type, ONLINE_DESC, nick);
        }
        #endregion
        //private void loadMenuFooter()
        //{
        //    Rpmenu_foot.DataSource = per.Loadmenu_footer(1);
        //    Rpmenu_foot.DataBind();
        //}
        //public string getLink(object cat_url, object _catseo)
        //{
        //    return fun.Getlink_Cat(cat_url, _catseo);
        //}
    }
}