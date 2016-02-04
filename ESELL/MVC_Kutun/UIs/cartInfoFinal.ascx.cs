using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using MVC_Kutun.Components;

namespace MVC_Kutun.UIs
{
    public partial class cartInfoFinal : System.Web.UI.UserControl
    {
        Order_now order = new Order_now();
        clsFormat fm = new clsFormat();
        Function fun = new Function();
        int _idorder = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            _idorder = Utils.CIntDef(Request["orderid"]);
            loadCartFinal();
        }
        private void loadCartFinal()
        {
            var list = order.load_ordePaymentFinal(_idorder).ToList();
            if (list.Count > 0)
            {
                Rpgiohang.DataSource = list;
                Rpgiohang.DataBind();
                Lbtotal.Text = fm.FormatMoney(list[0].ORDER_TOTAL_AMOUNT);
                lbtotalmoney.Text = fm.FormatMoney(list[0].ORDER_TOTAL_ALL);
                decimal _ship = Utils.CDecDef(list[0].ORDER_SHIPPING_FEE);

                Lbship.Text = _ship == 0 ? "Miễn phí" : (_ship > 0 ? fm.FormatMoney(_ship) : "Liên hệ");
            }
        }
        #region function
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

        public string GetImageT(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News(News_Id, News_Image1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetPrice1(object News_Price1, object News_Price2)
        {
            try
            {
                return fun.Getprice1(News_Price1, News_Price2);
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