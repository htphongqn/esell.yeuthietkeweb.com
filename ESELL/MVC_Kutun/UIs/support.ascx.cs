using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace MVC_Kutun.UIs
{
    public partial class support : System.Web.UI.UserControl
    {
        #region Declare
        Propertity per = new Propertity();
        Function fun = new Function();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Loadsupport();
                Loadhotline();
                loadEmail();
            }
        }
        #region support
        #region Hotline
        public void Loadhotline()
        {
            var list = per.Load_hotline();
            if (list.Count > 0)
            {
                Rphotline.DataSource = list;
                Rphotline.DataBind();
            }
        }
        #endregion
        private void loadEmail()
        {
            string email=per.loadSupwithType(11);
            Hpemail.NavigateUrl = "mailto:"+email;
            Hpemail.Text = email;
        }
        public void Loadsupport()
        {
            try
            {
                Rphotro.DataSource = per.Load_support();
                Rphotro.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string Bind_Online(object Type, object Description, object Nickname)
        {

            try
            {
                return fun.Bind_Online(Type, Description, Nickname);
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