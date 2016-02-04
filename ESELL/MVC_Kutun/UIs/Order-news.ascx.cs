using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;

namespace MVC_Kutun.UIs
{
    public partial class Order_news : System.Web.UI.UserControl
    {
        Order_now order = new Order_now();
        Function fun = new Function();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Loadorder();
        }
        private void Loadorder()
        {
            thongbaomuahangthanhcong.DataSource = order.load_ordenow(12);
            thongbaomuahangthanhcong.DataBind();
        }
        public string GetLink(object News_Url, object News_Seo_Url)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
    }
}