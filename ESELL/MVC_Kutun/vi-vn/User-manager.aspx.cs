using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using System.Data;
using System.Web.UI.HtmlControls;
using MVC_Kutun.Components;


namespace MVC_Kutun.vi_vn
{
    public partial class User_manager : System.Web.UI.Page
    {
        #region Declare
        Userinfo user = new Userinfo();
        Config cf = new Config();
        clsFormat fm = new clsFormat();
        int _iUserID = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _iUserID = Utils.CIntDef(Session["USER_ID"]);
                if (_iUserID == 0) Response.Redirect("/");
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

            header.Title = "Thông tin cá nhân";
            if (!IsPostBack)
            {
                Loaduser_info();
            }
        }
        #region Area
      
        #endregion
        #region Loadinfo
        public void Loaduser_info()
        {
            var list = user.Loaduserinfo(_iUserID);
            if (list.Count > 0)
            {
                Lbgetting.Text = "Chào " + list[0].CUSTOMER_FULLNAME;
                Lbname.Text = list[0].CUSTOMER_FULLNAME;
                Lbemail.Text = list[0].CUSTOMER_EMAIL;
                Lbadd.Text = list[0].CUSTOMER_ADDRESS + " - " + user.getnamePro(Utils.CIntDef(list[0].CUSTOMER_FIELD2)) + " - "+user.getnamePro(Utils.CIntDef(list[0].CUSTOMER_FIELD1));
            }
        }
        #endregion
    }
}