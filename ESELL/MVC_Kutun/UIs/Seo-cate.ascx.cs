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
    public partial class Seo_cate : System.Web.UI.UserControl
    {
        List_product list_pro = new List_product();
        int _Catid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            getSeo();
        }
        private void getSeo()
        {
            Literal_seo.Text = list_pro.getHmtlSeo(_Catid);
        }
    }
}