using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using vpro.functions;
using Controller;
using MVC_Kutun.Components;

namespace MVC_Kutun.MOBILE.vi_vn
{
    public partial class Check_order : System.Web.UI.Page
    {
        #region Declare
        Config cf = new Config();
        Order_now order = new Order_now();
        clsFormat fm = new clsFormat();
        Historypayment his = new Historypayment();
        Function fun = new Function();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
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

            header.Title = "Kiểm tra đơn hàng";
            if (!IsPostBack)
                div_order.Visible = false;
        }

        protected void Lbcheckcode_Click(object sender, EventArgs e)
        {
            Loadhist_pay();
        }
        #region Loaddata
        private void Loadhist_pay()
        {
            string code = txtcode.Value.Trim();
            string email = txtemail.Value.Trim();
            var list = his.checkorderPayment(code, email);
            if (list.Count > 0)
            {
                Rphistory.DataSource = list;
                Rphistory.DataBind();
                div_order.Visible = true;
            }
            else
            {
                div_order.Visible = false;
                Lberrors.Text = "Mã đơn hàng hoặc email chưa đúng";
            }
        }
        protected IQueryable loadOrderItem(object orderid)
        {
            return his.load_ordePaymentFinalobj(orderid);
        }
        #endregion
        #region function
        
        public string getOrderStatus(object obj_status)
        {
            return his.getOrderStatus(obj_status);
        }
        public string getOrderPayment(object obj_payment)
        {
            return his.getOrderPayment(obj_payment);
        }
        public string GetMoney(object obj_value)
        {
            return his.GetMoney(obj_value);
        }
        public string getPublishDate(object obj_date)
        {
            return his.getPublishDate(obj_date);
        }
        public string getship(object ship)
        {
            decimal _ship = Utils.CDecDef(ship);
            return _ship == 0 ? "Miễn phí" : (_ship != 0 ? GetMoney(_ship) : "Liên hệ");
        }
        #endregion
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