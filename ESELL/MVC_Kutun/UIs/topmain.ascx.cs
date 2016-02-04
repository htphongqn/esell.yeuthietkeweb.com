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
    public partial class topmain : System.Web.UI.UserControl
    {
        #region Decclare
        Propertity per = new Propertity();
        Function fun = new Function();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Loadface();
                Loadhotline();
            }
        }
        #region Hotline
        public void Loadhotline()
        {
            var list = per.Load_hotline().ToList();
            if (list.Count > 0)
            {
                Rphotline.DataSource = list;
                Rphotline.DataBind();
            }
        }
        #endregion
        #region Loadface
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
    }
}