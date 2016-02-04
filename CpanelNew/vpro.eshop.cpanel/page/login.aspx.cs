using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;

namespace vpro.eshop.cpanel.page
{
    public partial class login : System.Web.UI.Page
    {
        eshopdbDataContext db = new eshopdbDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            var _configs = db.GetTable<ESHOP_CONFIG>().OrderBy(c => c.CONFIG_ID).Take(1);

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
            }
        }

        protected void lbtLogin_Click(object sender, EventArgs e)
        {
            string strLink = "";

            try
            {
                string strUn = Utils.CStrDef((txtUN.Value), "").ToUpper();
                string strPW = Utils.CStrDef(txtPW.Value, "");

                var login = db.GetTable<ESHOP_USER>().Where(u => u.USER_UN == strUn);

                if (login.ToList().Count <= 0)
                {
                    lblError.Text = "Tài khoản đăng nhập không tồn tại.";
                }
                else
                {
                    //decode pass
                    strPW = Common.Encrypt(strPW, Utils.CStrDef(login.ToList()[0].SALT));
                    //kiem tra lai salt bi null

                    if (login.ToList()[0].USER_PW != strPW)
                    { lblError.Text = "Thông tin đăng nhập không hợp lệ."; }
                    else if (login.ToList()[0].USER_ACTIVE == 0)
                    { lblError.Text = "Tài khoản chưa được kích hoạt."; }
                    else
                    {
                        Session["USER_ID"] = login.ToList()[0].USER_ID;
                        Session["USER_UN"] = login.ToList()[0].USER_UN;
                        Session["USER_NAME"] = login.ToList()[0].USER_NAME;
                        Session["GROUP_ID"] = login.ToList()[0].GROUP_ID;
                        var group = db.GetTable<ESHOP_GROUP>().Where(u => u.GROUP_ID == login.ToList()[0].GROUP_ID);
                        if (group != null)
                        {
                            Session["GROUP_TYPE"] = group.ToList()[0].GROUP_TYPE;
                            Session["GROUP_SHOP"] = group.ToList()[0].GROUP_SHOP;
                        }
                        else
                        {
                            Session["GROUP_TYPE"] = login.ToList()[0].ESHOP_GROUP.GROUP_TYPE;
                            Session["GROUP_SHOP"] = login.ToList()[0].ESHOP_GROUP.GROUP_SHOP;
                        }
                        HttpContext.Current.Response.Cookies["PITM_NGUOIDUNG_INFO"]["PITM_USER_ID"] = Session["USER_ID"].ToString();
                        HttpContext.Current.Response.Cookies["PITM_NGUOIDUNG_INFO"]["PITM_USER_UN"] = Session["USER_UN"].ToString();
                        HttpContext.Current.Response.Cookies["PITM_NGUOIDUNG_INFO"]["PITM_USER_NAME"] = Session["USER_NAME"].ToString();
                        HttpContext.Current.Response.Cookies["PITM_NGUOIDUNG_INFO"]["PITM_GROUP_ID"] = Session["GROUP_ID"].ToString();
                        HttpContext.Current.Response.Cookies["PITM_NGUOIDUNG_INFO"]["PITM_GROUP_TYPE"] = Utils.CStrDef(Session["GROUP_TYPE"]);
                        HttpContext.Current.Response.Cookies["PITM_NGUOIDUNG_INFO"]["PITM_GROUP_SHOP"] = Utils.CStrDef(Session["GROUP_SHOP"]);
                        HttpContext.Current.Response.Cookies["PITM_NGUOIDUNG_INFO"].Expires = DateTime.Now.AddDays(30);

                        if (login.ToList()[0].ESHOP_GROUP.GROUP_TYPE == 1)
                            strLink = "default.aspx";
                        else if (login.ToList()[0].ESHOP_GROUP.GROUP_TYPE == 2)
                            strLink = getmenulink(login.ToList()[0].ESHOP_GROUP.GROUP_ID);
                        else
                            strLink = "login.aspx";
                    }
                }

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            finally
            {
                if (!string.IsNullOrEmpty(strLink))
                    Response.Redirect(strLink);
            }
        }
        private string getmenulink(int _gid)
        {
            var list = (from a in db.ESHOP_GROUPs
                        join b in db.GROUP_MENUs on a.GROUP_ID equals b.GROUP_ID
                        join c in db.MENUs on b.MENU_ID equals c.ID
                        where c.MENU_RANK == 1
                        && c.MENU_ACTIVE == 1
                        && a.GROUP_ID == _gid
                        select c).OrderByDescending(n => n.MENU_ORDER).ToList();
            if (list.Count > 0)
            {
                return list[0].MENU_LINK;
            }
            return "";
        }
    }
}