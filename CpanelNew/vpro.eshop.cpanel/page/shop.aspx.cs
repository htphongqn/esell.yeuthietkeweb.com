using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Data;
using System.IO;

namespace vpro.eshop.cpanel.page
{
    public partial class shop : System.Web.UI.Page
    {
        #region Declare

        private int _id = 0;
        int _count = 0, _userId = 0;
        eshopdbDataContext DB = new eshopdbDataContext();

        #endregion

        #region form event

        protected void Page_Load(object sender, EventArgs e)
        {
            _id = Utils.CIntDef(Request["id"]);
            _userId = Utils.CIntDef(Session["USER_ID"]);
            Hyperback.NavigateUrl = "shop_list.aspx";

            if (!IsPostBack)
            {
                LoadUser();
                getInfo();
            }

        }

        #endregion

        #region Button Events

        protected void lbtSave_Click(object sender, EventArgs e)
        {
            if (CheckExitsLink(txtSeoUrl.Value))
                lblError.Text = "Đã tồn tại Seo Url, vui lòng nhập Seo Url khác cho shop.";
            else
                SaveInfo();
        }

        protected void lbtSaveNew_Click(object sender, EventArgs e)
        {
            if (CheckExitsLink(txtSeoUrl.Value))
                lblError.Text = "Đã tồn tại Seo Url, vui lòng nhập Seo Url khác cho shop.";
            else
                SaveInfo("shop.aspx");
        }
        protected void LbsaveClose_Click(object sender, EventArgs e)
        {
            if (CheckExitsLink(txtSeoUrl.Value))
                lblError.Text = "Đã tồn tại Seo Url, vui lòng nhập Seo Url khác cho shop.";
            else
                SaveInfo("shop_list.aspx");
        }
        

        #endregion

        #region My functions
        private void getInfo()
        {
            try
            {
                var G_info = (from c in DB.ESHOP_SHOPs
                              where c.ID == _id
                              select c
                            );

                if (G_info.ToList().Count > 0)
                {
                    txtName.Value = G_info.ToList()[0].NAME;
                    txtPhone.Value = G_info.ToList()[0].PHONE;
                    txtAddress.Value = G_info.ToList()[0].ADDRESS;
                    txtEmail.Value = G_info.ToList()[0].EMAIL;
                    txtWebsite.Value = G_info.ToList()[0].WEBSITE;
                    ddlUser.SelectedValue = G_info.ToList()[0].FIELD1;

                    //seo
                    txtSeoTitle.Value = Utils.CStrDef(G_info.ToList()[0].SEO_TITLE);
                    txtSeoKeyword.Value = Utils.CStrDef(G_info.ToList()[0].SEO_KEYWORD);
                    txtSeoDescription.Value = Utils.CStrDef(G_info.ToList()[0].SEO_DESC);
                    txtSeoUrl.Value = Utils.CStrDef(G_info.ToList()[0].SEO_URL);


                }
                else
                    ddlUser.SelectedValue = _userId.ToString();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        private void SaveInfo(string strLink = "")
        {
            try
            {      
                if (_id == 0)
                {
                    ESHOP_SHOP insert = new ESHOP_SHOP();

                    insert.NAME = txtName.Value;
                    insert.PHONE = txtPhone.Value;
                    insert.ADDRESS = txtAddress.Value;
                    insert.EMAIL = txtEmail.Value;
                    insert.WEBSITE = txtWebsite.Value;
                    insert.FIELD1 = ddlUser.SelectedValue;

                    insert.SEO_URL = txtSeoUrl.Value;
                    insert.SEO_TITLE = txtSeoTitle.Value;
                    insert.SEO_KEYWORD = txtSeoKeyword.Value;
                    insert.SEO_DESC = txtSeoDescription.Value;
                    
                    DB.ESHOP_SHOPs.InsertOnSubmit(insert);
                    DB.SubmitChanges();
                    strLink = string.IsNullOrEmpty(strLink) ? "shop.aspx?id=" + insert.ID + "" : strLink;
                }
                else
                {
                    //update
                    var c_update = DB.GetTable<ESHOP_SHOP>().Where(g => g.ID == _id);

                    if (c_update.ToList().Count > 0)
                    {
                        c_update.Single().NAME = txtName.Value;
                        c_update.Single().PHONE = txtPhone.Value;
                        c_update.Single().ADDRESS = txtAddress.Value;
                        c_update.Single().EMAIL = txtEmail.Value;
                        c_update.Single().WEBSITE = txtWebsite.Value;
                        c_update.Single().FIELD1 = ddlUser.SelectedValue;

                        c_update.Single().SEO_URL = txtSeoUrl.Value; ;
                        c_update.Single().SEO_TITLE = txtSeoTitle.Value; ;
                        c_update.Single().SEO_KEYWORD = txtSeoKeyword.Value;
                        c_update.Single().SEO_DESC = txtSeoDescription.Value;

                        DB.SubmitChanges();

                        strLink = string.IsNullOrEmpty(strLink) ? "shop.aspx?id=" + c_update.Single().ID + "" : strLink;
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
                { Response.Redirect(strLink); }
            }
        }

        private void DeleteInfo()
        {
            try
            {
                var G_info = DB.GetTable<ESHOP_SHOP>().Where(g => g.ID == _id);

                DB.ESHOP_SHOPs.DeleteAllOnSubmit(G_info);
                DB.SubmitChanges();

                Response.Redirect("shop_list.aspx");

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        private void DeleteAllFilesInFolder(string folderpath)
        {
            foreach (var f in System.IO.Directory.GetFiles(folderpath))
                System.IO.File.Delete(f);
        }

        public string getOrder()
        {
            _count = _count + 1;
            return _count.ToString();
        }

        public string getLink(object GroupId)
        {
            return "shop.aspx?id=" + Utils.CStrDef(GroupId);
        }

        private bool CheckExitsLink(string strLink)
        {
            try
            {
                var exits = (from c in DB.ESHOP_SHOPs where c.SEO_URL == strLink && c.ID != _id select c);

                if (exits.ToList().Count > 0)
                    return true;

                return false;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return false;

            }

        }

        #endregion

        private void LoadUser()
        {
            try
            {
                var AllList = (from g in DB.ESHOP_USERs
                               select g);

                ddlUser.DataSource = AllList;
                ddlUser.DataBind();

                ddlUser.Items.Insert(0, new ListItem("--- Chọn nhân viên ---", ""));

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}