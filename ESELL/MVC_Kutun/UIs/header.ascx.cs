using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using System.Data;
using MVC_Kutun.Components;

namespace MVC_Kutun.UIs
{
    public partial class header : System.Web.UI.UserControl
    {
        #region Declare
        Propertity per = new Propertity();
        Function fun = new Function();
        Cart_result cart = new Cart_result();
        Checkcookie ck = new Checkcookie();
        Home index = new Home();
        setCookieSignin setck = new setCookieSignin();
        Account acc = new Account();
        List_product list_pro = new List_product();
        Product_Details pro_detail = new Product_Details();
        Config cf = new Config();
        string _cat_seo_url = "";
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _cat_seo_url = Request.QueryString["purl"];
            if (Utils.CIntDef(Session["User_ID"]) == 0)
                setSession();
            if (!string.IsNullOrEmpty(Utils.CStrDef(Session["User_ID"])))
            {
                lbthanhvien.Text = Utils.CStrDef(Session["User_Name"]);
                div_login.Visible = false;
                div_logout.Visible = true;
                div_register.Visible = false;
            }
            else
            {
                div_register.Visible = true;
                div_login.Visible = true;
                div_logout.Visible = false;
            }
            if (!IsPostBack)
            {
                load_logo();
                Load_prolike();
                Load_Menu1();
            }
        }
        private void setSession()
        {
            acc.setSessionCokie(ck.getCookieSignin());
        }
        #region Logout

        protected void lbtnDangXuat_Click(object sender, EventArgs e)
        {
            try
            {
                //sau khi đăng xuất, xóa hết sản phẩm trong giỏ hàng của người đó
                LogOut();

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void LogOut()
        {
            try
            {
                setck.Removecookie(Utils.CStrDef(Session["User_ID"]));
                Session.Abandon();
                Response.Redirect("/");

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        #endregion
        #region loaddata
        protected void Load_Menu1()
        {
            try
            {
                Rpmenutop.DataSource = per.Loadmenu(1, 20, 1).Take(1);
                Rpmenutop.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
        protected IQueryable Load_Menu2(object cat_parent_id)
        {
            try
            {
                return per.Menu2(cat_parent_id);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        private void Load_prolike()
        {
            Rppro_like.DataSource = index.Loadpro_cookie(1, ck.Listcookie_like());
            Rppro_like.DataBind();
        }

        public int countprolike()
        {
            return index.Loadpro_cookie(1, ck.Listcookie_like()).Count;
        }
        public int totalCart()
        {
            if (Session["news_guid"] == null)
                return 0;
            Guid _guid = (Guid)Session["news_guid"];
            return cart.Total_quantity(_guid);
        }
        #endregion
        #region function
        public string Getprice(object News_Price1)
        {
            return fun.Getprice(News_Price1);
        }
        public decimal Getprice_addtocart(object News_Price1)
        {
            return fun.Getprice_addtocart(News_Price1);
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
        public string GetPrice2(object News_Price1, object News_Price2)
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
        public string Getgiam(object News_Price1, object News_Price2)
        {
            return fun.Getgiamgia(News_Price1, News_Price2);
        }
        public string GetLinkCat(object Cat_Url, object Cat_Seo_Url)
        {
            try
            {

                return fun.Getlink_Cat(Cat_Url, Cat_Seo_Url);

            }
            catch (Exception)
            {

                throw;
            }
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
        #endregion

        protected void LbcheckOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("/kiem-tra-don-hang.html?code=" + orderCode.Value + "&email=" + email.Value);
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
            string title = list_pro.Loadtitle(_cat_seo_url);
            if (title.Length == 0)
                title = pro_detail.Loadtitle(_cat_seo_url);
            var _configs = cf.Config_meta();

            if (_configs != null && _configs.ToList().Count > 0)
            {
                if (title.Length == 0)
                    title = _configs.ToList()[0].CONFIG_TITLE;
            }

            string s = "";
            if (Utils.CIntDef(Session["home"]) == 0)
                s += "<h1 style='position: fixed;left: 999999px;'>" + title;
            if (Utils.CIntDef(Session["home"]) == 0)
                s += "</h1>";
            s += fun.Getbanner(Banner_type, banner_field, Banner_ID, Banner_Image, title);
            
            return s;
        }
    }
}