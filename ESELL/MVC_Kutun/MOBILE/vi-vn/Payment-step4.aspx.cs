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
using System.Configuration;

namespace MVC_Kutun.MOBILE.vi_vn
{
    public partial class Payment_step4 : System.Web.UI.Page
    {
        #region Declare
        Config cf = new Config();
        Cart_result carts = new Cart_result();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Payment_cart pay = new Payment_cart();
        SendMail sm = new SendMail();
        int _ship = 0;
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

            header.Title = "Thanh toán";
            Guid _guid = (Guid)Session["news_guid"];
            if (!pay.Check_Cart(_guid))
            {
                Response.Redirect("/", false);
            }
            if (!IsPostBack)
            {
                Load_Cart(_guid);
                decimal totalmn = carts.Total_Amount(_guid);

                lbtotalmoney.Text = fm.FormatMoney(totalmn);

                if (Session["price"] != null)
                {

                    _ship = Utils.CIntDef(Session["price"]);
                    totalmn += _ship != -1 ? _ship : 0;
                    Lbtotal.Text = fm.FormatMoney(totalmn);
                    Lbship.Text = _ship > 0 ? fm.FormatMoney(_ship) : (_ship == 0 ? "Miễn phí" : "Liên hệ");
                }
                else
                {
                    Lbtotal.Text = fm.FormatMoney(totalmn);

                }
                loadInfo();
            }
        }
        public void Load_Cart(Guid _guid)
        {
            var _basket = carts.Load_cart(_guid);

            if (_basket.ToList().Count > 0)
            {

                Rpitemcart.DataSource = _basket;
                Rpitemcart.DataBind();
            }
        }
        private void loadInfo()
        {
            string _sName = Utils.CStrDef(Request["name"]);
            string _sEmail = Utils.CStrDef(Request["email"]);
            string _sAddress = Utils.CStrDef(Request["add"]);
            int _iPaymentID = Utils.CIntDef(Request["typepay"]);
            string _sDesc = Utils.CStrDef(Request["note"]);
            DateTime _dateDate = DateTime.Now;
            string _sPhone = Utils.CStrDef(Request["phone"]);
            Lbname.Text = _sName;
            Lbemail.Text = _sEmail;
            Lbphone.Text = _sPhone;
            Lbadd.Text = _sAddress;
            Lbhinhthuc.Text = "Thanh toán khi nhận hàng";
            Lbnote.Text = _sDesc;
        }
        private void Finish(int _hinhthucpay)
        {
            try
            {

                Guid _guid = (Guid)Session["News_guid"];

                //Thông tin lưu vào bảng đặt hàng
                decimal _ship = 0;
                if (Session["price"] != null)
                {
                    _ship = Utils.CIntDef(Session["price"]);
                }
                string _sName = Utils.CStrDef(Request["name"]);
                string _sEmail = Utils.CStrDef(Request["email"]);
                string _sAddress = Utils.CStrDef(Request["add"]);
                int _iPaymentID = Utils.CIntDef(Request["typepay"]);
                string _sDesc = Utils.CStrDef(Request["note"]);
                DateTime _dateDate = DateTime.Now;
                string _sEmailCC = string.Empty;
                string _sPhone = Utils.CStrDef(Request["phone"]);
                string _hinhtuc = _hinhthucpay == 1 ? "Thanh toán khi nhận hàng" : "Chuyển khoản";
                string _webname = ConfigurationManager.AppSettings["EmailDisplayName"];
                string _url = ConfigurationManager.AppSettings["URLWebsite"];
                var _ccMail = cf.Getemail(3);
                if (_ccMail.ToList().Count > 0)
                {
                    _sEmailCC = _ccMail.ToList()[0].EMAIL_TO;
                }
                if (pay.Payment_cart_rs(_guid, carts.Total_Amount(_guid), _sEmail, _sName, _sPhone, _sAddress, _iPaymentID, _hinhtuc, _sDesc, _webname, _url, _ship))
                {
                    sm.SendEmailSMTP("Thông báo: Bạn đã đặt hàng thành công", _sEmail, _sEmailCC, "", pay._Mailbody, true, false);
                    pay.Delete_basket(_guid);
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Thông báo: Xác nhận thành công. Cảm ơn bạn đã mua hàng tại cửa hàng của chúng tôi!');</script>");
                }
                else Response.Write("<script LANGUAGE='JavaScript' >alert('Lỗi!');document.location='" + ResolveClientUrl("/") + "';</script>");


            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        protected void Lbpayment_Click(object sender, EventArgs e)
        {
            Finish(1);
            Response.Redirect("/finish-mobile.aspx?orderid=" + Payment_cart._idorder);
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
    }
}