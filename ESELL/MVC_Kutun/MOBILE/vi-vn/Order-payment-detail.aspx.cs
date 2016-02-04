using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Web.UI.HtmlControls;
using Controller;
using MVC_Kutun.Components;

namespace MVC_Kutun.MOBILE.vi_vn
{
    public partial class Order_payment_detail : System.Web.UI.Page
    {
        Config cf = new Config();
        Historypayment hispayment = new Historypayment();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        int _idorder = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            _idorder = Utils.CIntDef(Request["id"]);
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
            loadCartFinal();
        }
        private void loadCartFinal()
        {
            var list = hispayment.load_ordePaymentFinal(_idorder).ToList();
            if (list.Count > 0)
            {
                Rpgiohang.DataSource = list;
                Rpgiohang.DataBind();
                Lbtotal.Text = fm.FormatMoney(list[0].ORDER_TOTAL_AMOUNT);
                lbtotalmoney.Text = fm.FormatMoney(list[0].ORDER_TOTAL_ALL);

                decimal _ship = Utils.CDecDef(list[0].ORDER_SHIPPING_FEE);
                Lbship.Text = _ship == 0 ? "Miễn phí" : (_ship != 0 ? fm.FormatMoney(_ship) : "Liên hệ");
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