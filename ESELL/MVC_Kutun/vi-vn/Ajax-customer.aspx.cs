using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using System.Web.Services;
using MVC_Kutun.Components;
using vpro.functions;
using System.Text;

namespace MVC_Kutun.vi_vn
{
    public partial class Ajax_customer : System.Web.UI.Page
    {
        #region Declare
        static Account acc = new Account();
        static clsFormat fm = new clsFormat();
        static Checkcookie checkck = new Checkcookie();
        static setCookieLike setck = new setCookieLike();
        static Controller.Home index = new Controller.Home();
        static Function fun = new Function();
        static Propertity per = new Propertity();
        static setCookieSignin setcklogin = new setCookieSignin();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string login(string email, string pass)
        {
            try
            {
                if (acc.Login(email, fm.MaHoaMatKhau(pass)))
                {
                    setcklogin.Addcookie(Utils.CStrDef(HttpContext.Current.Session["User_ID"]));
                    return "success";
                }
                else
                {
                    return "errors";
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return "";
            }
        }
        private static string getImgLogo()
        {
            var list = per.Load_logo_or_sologan("1", 1);
            if (list.Count > 0)
            {
                if (!String.IsNullOrEmpty(list[0].BANNER_FILE))
                    return PathFiles.GetPathBanner(list[0].BANNER_ID) + "/" + list[0].BANNER_FILE;
            }
            return string.Empty;
        }
        private static string htmlEmailRegister(string _email)
        {
            
            StringBuilder _res = new StringBuilder();
            string _imglogo = getImgLogo();
            _res.Append("<body style='padding: 0;margin: 0;font: normal 13px/1.5 Arial, Helvetica, sans-serif;color: #333333'>");
            _res.Append("<div style='background: #f4f3f3; width: 100%'>");
            _res.Append("<div class='wrap head' style='background: #f4f3f3; width: 100%;padding: 10px 0'> <a href=''><img src='http://esell.vn" + _imglogo + "' alt='' width='150' /></a> <span class='hotline' style='float: right;color: #FF0000;font-size: 18px;background: url(http://esell.vn/vi-vn/Images/phone_ico.png) 0 center no-repeat;padding-left: 28px;margin-top: 10px;'><b>(848) 39 483 961 </b></span> </div>");
            _res.Append("</div>");
            _res.Append("<div class='wrap' style='width: 600px;margin: 0 auto'>");
            _res.Append("<p><strong>Chào quý khách,</strong></p>");
            _res.Append("<p>Cảm ơn Bạn đã đăng ký email nhận <font color='red'>bản tin</font> trang <a href='http://www.esell.vn'>www.esell.vn</a></p>");
            _res.Append("<p>Esell.vn dành tặng bạn  trải nghiệm mua sắm ĐẦU TIÊN với ưu đãi CỰC HOT. Kiểm tra email của Bạn ngay  nhé! </p>");
            _res.Append("<p>Quý khách nhất định sẽ  có những trải nghiệm mua sắm online đầy thú vị trên <a href='http://www.esell.vn'>www.esell.vn</a>. </p>");
            _res.Append("</div>");
            _res.Append("<div style='background: #414141; text-align: center; padding: 5px 0; color: #FFFFFF'>");
            _res.Append("<div class='wrap'>");
            _res.Append("<p><strong>Chúng tôi luôn sẵn sàng hỗ trợ bạn qua email <a href='mailto:info@esell.vn' style='color: #FFFFFF'>info@esell.vn</a> và hotline: 0918 856 738</strong></p>");
            _res.Append("<p style='font-size:11px'><strong>CÔNG TY CỔ PHẦN CÔNG NGHỆ VÀ TRUYỀN THÔNG ĐẲNG CẤP VIỆT</strong><br>");
            _res.Append("<strong>Trụ sở</strong>: 232/17 Cộng Hòa, P. 12, Q. Tân Bình, TP. Hồ Chí Minh</p>");
            _res.Append("<p style='font-size:11px'>Bạn nhận được thư này là do địa chỉ email đã được đăng ký thành viên Esell.vn.</p>");
            _res.Append("</div>");
            _res.Append("</div>");
            _res.Append("</body>");
            return _res.ToString();
        }
        [WebMethod]
        public static string regis_mail(string email)
        {
            Register_email rg = new Register_email();
            Config cf = new Config();
            SendMail semail = new SendMail();
            if (rg.Add_email(email,1))
            {
                string _sMailBody = string.Empty;
                string _sEmailCC = string.Empty;
                _sMailBody = htmlEmailRegister(email);
                var _ccMail = cf.Getemail(2);
                if (_ccMail.ToList().Count > 0)
                {
                    _sEmailCC = _ccMail.ToList()[0].EMAIL_TO;
                }
                semail.SendEmailSMTP("Thông báo: Bạn đã đăng ký nhận tin thành công", email, _sEmailCC, "", _sMailBody, true, false);
                return "success";
            }
            else return "errors";
        }
        [WebMethod]
        public static string addLike(string seourl)
        {
            if (!checkck.Listcookie_like().Contains(seourl))
            {
                setck.Addcookie(seourl);
                return "success";
            }
            else
                return "error";
        }
        [WebMethod]
        public static string likepro(string seourl)
        {
            string res = string.Empty;
            var list = index.Loadpro_cookie(1, checkck.Listcookie_like());
            foreach (var i in list)
            {
                res += "<li>";

                res += "<div class='product_item_slide'>";
                res += "    <div class='img_general'>";
                res += "       <a href='"+GetLink(i.NEWS_URL,i.NEWS_SEO_URL)+"'>";
                res += "           <img width='40' height='40' src='"+GetImageT(i.NEWS_ID,i.NEWS_IMAGE3)+"'>";
                res += "       </a>";
                res += "</div>";
                res += " <div class='r_product_info'>";
                res += "    <h4>";
                res += "    <a href='" + GetLink(i.NEWS_URL, i.NEWS_SEO_URL) + "'>";
                res += i.NEWS_TITLE + "</a></h4>";
                res += "<div class='info_price'>";
                res += "<span class='f_price'><del>";
                res += GetPrice2(i.NEWS_PRICE1,i.NEWS_PRICE2)+"</del></span> <span class='main_price'>";
                res += GetPrice1(i.NEWS_PRICE1, i.NEWS_PRICE2) + "</span>";
                res += "   </div>";
                res += " </div>";
                res += "</div>";

                res += "</li>";
            }
            return res;
        }
        public static string GetPrice1(object News_Price1, object News_Price2)
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
        public static string GetPrice2(object News_Price1, object News_Price2)
        {
            try
            {
                return fun.Getprice2(News_Price1, News_Price2);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }

        public static string GetLink(object News_Url, object News_Seo_Url)
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
        public static string GetImageT(object News_Id, object News_Image1)
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