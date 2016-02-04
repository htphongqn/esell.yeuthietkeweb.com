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
    public partial class Order_payment : System.Web.UI.Page
    {
        Config cf = new Config();
        int _iUserID = 0;
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

            header.Title = "Đơn hàng của tôi";
            setOrder();
        }
        private void setOrder()
        {
            int _usertype = Utils.CIntDef(Session["User_Type"]);
            UserControl ucmember = Page.LoadControl("/MOBILE/UIs/hispayment.ascx") as UserControl;
            UserControl ucpartner = Page.LoadControl("/MOBILE/UIs/Hispayment_Partner.ascx") as UserControl;
            if (_usertype == 0)
                Plorder.Controls.Add(ucmember);
            else
                Plorder.Controls.Add(ucpartner);
        }
    }
}