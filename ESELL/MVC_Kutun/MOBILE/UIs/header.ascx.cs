using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace MVC_Kutun.MOBILE.UIs
{
    public partial class header : System.Web.UI.UserControl
    {
        Controller.Cart_result cart = new Controller.Cart_result();
        Propertity per = new Propertity();
        Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {
            load_logo();
        }
        protected void load_logo()
        {
            var _logoSlogan = per.Load_logo_or_sologan("1", 1);
            if (_logoSlogan.ToList().Count > 0)
            {
                Rplogo.DataSource = _logoSlogan;
                Rplogo.DataBind();
            }
        }
        public string Getbanner(object Banner_type, object banner_field, object Banner_ID, object Banner_Image)
        {
            return fun.Getbannerm(Banner_type, banner_field, Banner_ID, Banner_Image);
        }
        public int getQuantityCart()
        {
            if (Session["news_guid"] != null)
            {
                Guid _guid = (Guid)Session["news_guid"];
                return cart.Total_quantity(_guid);
            }
            return 0;
        }
     
    }
}