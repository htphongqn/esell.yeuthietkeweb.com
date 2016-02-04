using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;

using System.Data;
using System.Web.UI.HtmlControls;
using vpro.eshop.cpanel.Components;
using System.IO;

namespace vpro.eshop.cpanel.page
{
    public partial class shop_list : System.Web.UI.Page
    {
        #region Declare

        int _count = 0;
        eshopdbDataContext DB = new eshopdbDataContext();
        int _gtype, _userId = 0;
        #endregion

        #region properties

        public SortDirection sortProperty
        {
            get
            {
                if (ViewState["SortingState"] == null)
                {
                    ViewState["SortingState"] = SortDirection.Ascending;
                }
                return (SortDirection)ViewState["SortingState"];
            }
            set
            {
                ViewState["SortingState"] = value;
            }
        }

        #endregion

        #region Page Events

        protected void Page_Load(object sender, EventArgs e)
        {
            _gtype = Utils.CIntDef(Session["GROUP_TYPE"]);
            _userId = Utils.CIntDef(Session["USER_ID"]);
            if (!IsPostBack)
            {
                SearchResult();
            }

        }

        #endregion

        #region My Functions

        public string getOrder()
        {
            _count = _count + 1;
            return _count.ToString();
        }

        public string getLink(object obj_id)
        {
            return "shop.aspx?id=" + Utils.CStrDef(obj_id);
        }

        public string getUser(object obj_id)
        {
            int userId = Utils.CIntDef(obj_id);
            var G_info = (from g in DB.ESHOP_USERs
                          where g.USER_ID == userId
                          select g
                            );

            if (G_info.ToList().Count > 0)
            {
                return G_info.ToList()[0].USER_NAME;
            }
            return "";
        }

        private void SearchResult()
        {
            try
            {
                string keyword = CpanelUtils.ClearUnicode(txtKeyword.Value);
                if (_gtype != 1)
                {
                    var AllList = (from g in DB.ESHOP_SHOPs
                                   where ("" == keyword || (DB.fClearUnicode(g.NAME)).Contains(keyword))
                                   && g.FIELD1 == _userId.ToString()
                                   select new
                                   {
                                       g.ID,
                                       g.NAME,
                                       g.EMAIL,
                                       g.ADDRESS,
                                       g.PHONE,
                                       g.FIELD1,
                                       g.WEBSITE,
                                       g.TYPE,
                                       g.SEO_URL
                                   });

                    Rplistcate.DataSource = AllList;
                    Rplistcate.DataBind();
                }
                else
                {
                    var AllList = (from g in DB.ESHOP_SHOPs
                                   where ("" == keyword || (DB.fClearUnicode(g.NAME)).Contains(keyword))
                                   select new
                                   {
                                       g.ID,
                                       g.NAME,
                                       g.EMAIL,
                                       g.ADDRESS,
                                       g.PHONE,
                                       g.FIELD1,
                                       g.WEBSITE,
                                       g.TYPE,
                                       g.SEO_URL
                                   });

                    Rplistcate.DataSource = AllList;
                    Rplistcate.DataBind();
                }

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        private void EventDelete(RepeaterCommandEventArgs e)
        {
            try
            {
                int Id = Utils.CIntDef(e.CommandArgument);

                var g_delete = DB.GetTable<ESHOP_SHOP>().Where(g => g.ID == Id);

                DB.ESHOP_SHOPs.DeleteAllOnSubmit(g_delete);
                DB.SubmitChanges();

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            finally
            {
                Response.Redirect("shop_list.aspx");
            }
        }

        private void DeleteAllFilesInFolder(string folderpath)
        {
            foreach (var f in System.IO.Directory.GetFiles(folderpath))
                System.IO.File.Delete(f);
        }

        #endregion

        #region Button Envents

        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            SearchResult();
        }

        protected void lbtDelete_Click(object sender, EventArgs e)
        {
            int j = 0;
            int[] items = new int[Rplistcate.Items.Count];

            try
            {
                for (int i = 0; i < Rplistcate.Items.Count; i++)
                {
                    HtmlInputCheckBox check = (HtmlInputCheckBox)Rplistcate.Items[i].FindControl("chkSelect");
                    HiddenField Hdid = Rplistcate.Items[i].FindControl("Hdid") as HiddenField;
                    int _id = Utils.CIntDef(Hdid.Value);
                    if (check.Checked)
                    {
                        items[j] = _id;
                        j++;
                    }
                }
                //delete 
                var g_delete = DB.GetTable<ESHOP_SHOP>().Where(g => items.Contains(g.ID));

                DB.ESHOP_SHOPs.DeleteAllOnSubmit(g_delete);
                DB.SubmitChanges();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            finally
            {
                items = null;
                SearchResult();
            }

        }
      
        #endregion

        protected void Rplistcate_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
                EventDelete(e);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SearchResult();
        }
    }
}