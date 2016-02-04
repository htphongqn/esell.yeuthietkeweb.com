using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using vpro.eshop.cpanel.Components;
using DevExpress.Web.ASPxGridView;

namespace vpro.eshop.cpanel.page
{
    public partial class inventory_list : System.Web.UI.Page
    {
        #region Declare
        eshopdbDataContext DB = new eshopdbDataContext();

        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
            Loadinventory();

        }
        #region Load data
        private void Loadinventory()
        {
            string keyword = CpanelUtils.ClearUnicode(txtKeyword.Value);
            var list = DB.ESHOP_NEWs.Where(n => n.NEWS_TYPE == 1 && (DB.fClearUnicode(n.NEWS_TITLE).Contains(keyword) || DB.fClearUnicode(n.NEWS_CODE).Contains(keyword) || "" == keyword)).OrderByDescending(n => n.NEWS_ID).ToList();
            if (list.Count > 0)
            {
                ASPxGridView_inventory.DataSource = list;
                ASPxGridView_inventory.DataBind();
                HttpContext.Current.Session["buy.listinvent"] = list;
            }
            else
            {
                HttpContext.Current.Session["buy.listinvent"] = null;
                ASPxGridView_inventory.DataSource = list;
                ASPxGridView_inventory.DataBind();
            }
        }
        public int getCountBuy(object news_id)
        {
            int id = Utils.CIntDef(news_id);
            int count = (from a in DB.ESHOP_ORDER_ITEMs
                         join b in DB.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                         join c in DB.ESHOP_ORDERs on a.ORDER_ID equals c.ORDER_ID
                         where b.NEWS_ID == id && (c.ORDER_STATUS == 2 || c.ORDER_STATUS == 3)
                         select a).ToList().Count;
            return count;
        }
        #endregion
        #region function
        public int getSl(object news_id, int type)
        {
            int id = Utils.CIntDef(news_id);
            var list = DB.INVENTORies.Where(n => n.NEWS_ID == id && n.INVENT_TYPE == type);
            return Utils.CIntDef(list.Sum(n => n.INVENT_QUANTITY));
        }
        public int pareInt(object price)
        {
            return Utils.CIntDef(price);
        }
        public string formatMoney(object money)
        {
            string Money = String.Format("{0:0,0 VNĐ}", money);
            return Money.Replace(",", ".");
        }
        #endregion
        protected void Lbexport_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter_export.WriteXlsxToResponse();
        }

        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            Loadinventory();
        }

        protected void Lbexprortpdf_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter_export.WritePdfToResponse();
        }

        protected void lbtSave_Click(object sender, EventArgs e)
        {
            Save();
            Loadinventory();
        }
        private void Save()
        {
            int count = ASPxGridView_inventory.VisibleRowCount;
            for (int i = 0; i < count; i++)
            {
                GridViewDataColumn colid = ASPxGridView_inventory.Columns[0] as GridViewDataColumn;
                //GridViewDataColumn colprice = ASPxGridView_inventory.Columns[2] as GridViewDataColumn;
                GridViewDataColumn colinventory = ASPxGridView_inventory.Columns[5] as GridViewDataColumn;
                HiddenField idhd = ASPxGridView_inventory.FindRowCellTemplateControl(i, colid, "Hdid") as HiddenField;
                //TextBox txtprice = ASPxGridView_inventory.FindRowCellTemplateControl(i, colprice, "txtPricenhap") as TextBox;
                TextBox txtinventory = ASPxGridView_inventory.FindRowCellTemplateControl(i, colinventory, "txtInventory") as TextBox;
                int id = 0;
                if (idhd != null)
                    id = Utils.CIntDef(idhd.Value);
                var list = DB.ESHOP_NEWs.Where(n => n.NEWS_ID == id).ToList();
                if (list.Count > 0)
                {

                    //list[0].NEWS_PRICE3 = Utils.CDecDef(txtprice.Text);

                    list[0].NEWS_INVENTORY = Utils.CIntDef(txtinventory.Text);
                    DB.SubmitChanges();
                }

            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Loadinventory();
        }
    }
}