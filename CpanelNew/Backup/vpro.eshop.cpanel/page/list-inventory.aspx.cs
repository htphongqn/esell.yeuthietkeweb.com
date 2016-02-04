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

namespace vpro.eshop.cpanel.page
{
    public partial class list_inventory : System.Web.UI.Page
    {
        private int _count = 0;
        eshopdbDataContext db = new eshopdbDataContext();
        formatData fm = new formatData();
        int type = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            type = Utils.CIntDef(Request["type"]);
            string url = type == 0 ? "nhap-kho.aspx" : "xuat-kho.aspx";
            Hyaddnew.NavigateUrl = url;
            if (!IsPostBack)
            {
              
                loadListInventory();
            }
        }
        #region loadcate
        private void LoadCate(int type, ref DropDownList dr)
        {
            var list = db.ESHOP_CATEGORies.Where(n => n.CAT_TYPE == type && n.CAT_RANK == 2);
            dr.DataValueField = "CAT_ID";
            dr.DataTextField = "CAT_NAME";
            dr.DataSource = list;
            dr.DataBind();
            ListItem l = new ListItem("--Chọn--", "0");
            l.Selected = true;
            dr.Items.Insert(0, l);
        }
        #endregion
        #region getNamecate
        public string getNameCate(object id)
        {
            int cat_id = Utils.CIntDef(id);
            var list = db.ESHOP_CATEGORies.Where(n => n.CAT_ID == cat_id).ToList();
            if (list.Count > 0) return list[0].CAT_NAME;
            return "";
        }
        #endregion
        private void loadListInventory()
        {
            string keyword = CpanelUtils.ClearUnicode(txtKeyword.Value);
            string date = txtDate.Text;
            DateTime dt = DateTime.Now;
            if (!String.IsNullOrEmpty(date))
                dt = Utils.CDateDef(catngay(date), DateTime.Now);
            //int khoid = Utils.CIntDef(Drkho.SelectedValue);
            //int nhacccid = Utils.CIntDef(Drnhacc.SelectedValue);
            var list = (from a in db.ESHOP_NEWs
                        join b in db.INVENTORies on a.NEWS_ID equals b.NEWS_ID
                        where b.INVENT_TYPE == type && (db.fClearUnicode(a.NEWS_TITLE).Contains(keyword) || db.fClearUnicode(a.NEWS_CODE).Contains(keyword) || "" == keyword)
                            //&&(b.INVENT_KHO==khoid||0==khoid)&&(b.INVENT_NHACC==nhacccid||0==nhacccid)
                        && (!String.IsNullOrEmpty(date) ? b.INVENT_DATE.Value.Date == dt : 0 == 0)
                        select new
                        {
                            a.NEWS_TITLE,
                            a.NEWS_CODE,
                            b.INVENT_TYPE,
                            b.ID,
                            b.INVENT_DATE,
                            b.INVENT_QUANTITY,
                            b.USER_ID,
                            b.INVENT_NHACC,
                            b.INVENT_KHO,
                            b.INVENT_PRICE,
                            b.INVENT_NAMEKH,
                            b.INVENT_ADDRESS,
                            b.INVENT_CHIECKHAU,
                            b.INVENT_NO,
                            b.INVENT_NOTE

                        }).OrderByDescending(n => n.ID).ToList();
            RplistInvent.DataSource = list;
            RplistInvent.DataBind();
        }
        #region function
        public string getName(object id)
        {
            int userid = Utils.CIntDef(id);
            var list = db.ESHOP_USERs.Where(n => n.USER_ID == userid).ToList();
            if (list.Count > 0) return list[0].USER_NAME;
            return "";
        }
        protected void lbtDelete_Click(object sender, EventArgs e)
        {
            int j = 0;
            int[] items = new int[RplistInvent.Items.Count];

            try
            {

                for (int i = 0; i < RplistInvent.Items.Count; i++)
                {
                    HtmlInputCheckBox check = (HtmlInputCheckBox)RplistInvent.Items[i].FindControl("chkSelect");
                    HiddenField Hdid = RplistInvent.Items[i].FindControl("Hdid") as HiddenField;
                    int _id = Utils.CIntDef(Hdid.Value);
                    if (check.Checked)
                    {
                        items[j] = _id;
                        j++;
                    }
                }
                //delete 
                var g_delete = db.GetTable<INVENTORY>().Where(g => items.Contains(g.ID));

                db.INVENTORies.DeleteAllOnSubmit(g_delete);
                db.SubmitChanges();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
            finally
            {
                items = null;
                loadListInventory();
            }

        }
        private void EventDelete(RepeaterCommandEventArgs e)
        {
            int BannerId = Utils.CIntDef(e.CommandArgument);
            DeleteInfo(BannerId);
        }

        private void DeleteInfo(int ad_id)
        {
            string strLink = "";
            try
            {

                var G_info = db.GetTable<INVENTORY>().Where(g => g.ID == ad_id);
                db.INVENTORies.DeleteAllOnSubmit(G_info);
                db.SubmitChanges();
                strLink = "list-inventory.aspx?type=" + type;

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

       
        #endregion
        #region function
        public string catngay(string ngay)
        {
            string[] listngay = ngay.Split('-');
            return listngay[2] + "/" + listngay[1] + "/" + listngay[0];
        }
        public int pareInt(object price)
        {
            return Utils.CIntDef(price);
        }
        public string getOrder()
        {
            _count = _count + 1;
            return _count.ToString();
        }
        public string getLink(object obj_id)
        {
            string url = type == 0 ? "nhap-kho.aspx?id=" + obj_id : "xuat-kho.aspx?id=" + obj_id;
            return url;
        }
        public string getDate(object News_PublishDate)
        {
            return string.Format("{0:dd/MM/yyyy HH:mm:ss}", News_PublishDate);
        }
        public string formatMoney(object price)
        {
            return fm.FormatMoney(price);
        }
        #endregion
      
        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            loadListInventory();
        }

        protected void RplistInvent_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
                EventDelete(e);
        }
    }
}