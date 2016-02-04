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
    public partial class checkorderPayment : System.Web.UI.UserControl
    {
        Historypayment his = new Historypayment();
        Function fun = new Function();
        int _count = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) Loadhist_pay();
        }
        #region Loaddata
        private void Loadhist_pay()
        {
            string code = Utils.CStrDef(Request["code"]).Trim();
            string email = Utils.CStrDef(Request["email"]).Trim();
            var list = his.checkorderPayment(code, email);
            if (list.Count > 0)
            {
                Rphistory.DataSource = list;
                Rphistory.DataBind();
                div_error.Visible = false;
                div_checkorder.Visible = true;
            }
            else
            {
                div_error.Visible = true;
                div_checkorder.Visible = false;
                Lberrors.Text = "Mã đơn hàng hoặc email chưa đúng";
            }
        }
        protected IQueryable loadOrderItem(object orderid)
        {
            return his.load_ordePaymentFinalobj(orderid);
        }
        #endregion
        #region function
        public int getOrder()
        {
            return _count++;
        }
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