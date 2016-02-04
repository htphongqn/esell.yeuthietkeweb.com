using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Data;
using System.IO;
using vpro.eshop.cpanel.Components;

namespace vpro.eshop.cpanel.page
{
    public partial class nhap_kho : System.Web.UI.Page
    {
        eshopdbDataContext db = new eshopdbDataContext();
        int idivent = 0, _type = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            idivent = Utils.CIntDef(Request["id"]);
            Hyperback.NavigateUrl = "list-inventory.aspx?type=0";
            if (!IsPostBack)
            {
               
                if (idivent != 0)
                    getInfo();
            }
        }
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
        private void getInfo()
        {
            var list = db.INVENTORies.Where(n => n.ID == idivent).ToList();
            if (list.Count > 0)
            {
                txtquan.Value = list[0].INVENT_QUANTITY.ToString();
                txtcode.Text = getCode(Utils.CIntDef(list[0].NEWS_ID));
                txtPrice.Value = Utils.CIntDef(list[0].INVENT_PRICE).ToString();
                txtnameKH.Value = list[0].INVENT_NAMEKH;
                txtadd.Value = list[0].INVENT_ADDRESS;
                txtChieckhau.Value = list[0].INVENT_CHIECKHAU.ToString();
                txtsophieu.Value = list[0].INVENT_NO;
                txtnote.Value = list[0].INVENT_NOTE;
                //Drnhacc.SelectedValue = list[0].INVENT_NHACC.ToString();
                //Drkho.SelectedValue = list[0].INVENT_KHO.ToString();
                Hynews.Text = getName();
                Hynews.NavigateUrl = "news.aspx?type=1&news_id=" + getIdnews();

            }
        }
        protected void lbtSave_Click(object sender, EventArgs e)
        {
            Save();
        }
        protected void LbsaveClose_Click(object sender, EventArgs e)
        {
            Save("list-inventory.aspx?type=0");
        }
        private string getCode(int id)
        {
            var list = db.ESHOP_NEWs.Where(n => n.NEWS_ID == id).ToList();
            if (list.Count > 0)
            {
                return list[0].NEWS_CODE;
            }
            return "";
        }
        private string getName()
        {
            var list = db.ESHOP_NEWs.Where(n => n.NEWS_CODE == txtcode.Text.Trim()).ToList();
            if (list.Count > 0)
            {
                return list[0].NEWS_TITLE;
            }
            return "";
        }
        private int getIdnews()
        {
            var list = db.ESHOP_NEWs.Where(n => n.NEWS_CODE == txtcode.Text.Trim()).ToList();
            if (list.Count > 0)
            {
                return list[0].NEWS_ID;
            }
            return 0;
        }
        private void Save(string link = "")
        {
            int id = getIdnews();
            int type = 0;
            //int khoid = Utils.CIntDef(Drkho.SelectedValue);
            //int nhacccid = Utils.CIntDef(Drnhacc.SelectedValue);
            if (idivent != 0)
            {
                var list = db.INVENTORies.Where(n => n.ID == idivent).ToList();
                if (list.Count > 0)
                {
                    UpdateQuantity(id, Utils.CIntDef(txtquan.Value), type, 1);
                    list[0].INVENT_QUANTITY = Utils.CIntDef(txtquan.Value);
                    list[0].NEWS_ID = id;
                    list[0].INVENT_TYPE = type;
                    list[0].INVENT_NAMEKH = txtnameKH.Value;
                    list[0].INVENT_ADDRESS = txtadd.Value;
                    list[0].INVENT_NO = txtsophieu.Value;
                    list[0].INVENT_CHIECKHAU = Utils.CIntDef(txtChieckhau.Value);
                    list[0].INVENT_NOTE = txtnote.Value;
                    //list[0].INVENT_KHO = khoid;
                    //list[0].INVENT_NHACC = nhacccid;
                    list[0].INVENT_PRICE = Utils.CDecDef(txtPrice.Value);
                    list[0].USER_ID = Utils.CIntDef(Session["USER_ID"]);
                    db.SubmitChanges();

                }

            }
            else
            {
                if (id != 0)
                {
                    INVENTORY invent = new INVENTORY();
                    invent.INVENT_DATE = DateTime.Now;
                    invent.NEWS_ID = id;
                    invent.INVENT_TYPE = type;
                    invent.INVENT_QUANTITY = Utils.CIntDef(txtquan.Value);
                    invent.INVENT_NAMEKH = txtnameKH.Value;
                    invent.INVENT_ADDRESS = txtadd.Value;
                    invent.INVENT_NO = txtsophieu.Value;
                    invent.INVENT_CHIECKHAU = Utils.CIntDef(txtChieckhau.Value);
                    invent.INVENT_PRICE = Utils.CDecDef(txtPrice.Value);
                    invent.USER_ID = Utils.CIntDef(Session["USER_ID"]);
                    invent.INVENT_NOTE = txtnote.Value;
                    db.INVENTORies.InsertOnSubmit(invent);
                    db.SubmitChanges();
                    var list = db.INVENTORies.OrderByDescending(n => n.ID).ToList();
                    if (list.Count > 0)
                        idivent = list[0].ID;
                    UpdateQuantity(id, Utils.CIntDef(txtquan.Value), type, 0);
                }

            }

            if (String.IsNullOrEmpty(link)) link = "nhap-kho.aspx?id=" + idivent;
            if (!String.IsNullOrEmpty(link))
                Response.Redirect(link);
        }
        private int getQuanBeforeupdate()
        {
            var list = db.INVENTORies.Where(n => n.ID == idivent).ToList();
            if (list.Count > 0)
                return Utils.CIntDef(list[0].INVENT_QUANTITY);
            return 0;
        }
        private void UpdateQuantity(int id, int quan, int type, int status)
        {
            var list = db.ESHOP_NEWs.Where(n => n.NEWS_ID == id).ToList();
            if (list.Count > 0)
            {
                if (type == 0)
                {
                    if (status == 1)
                    {
                        if (list[0].NEWS_INVENTORY == null)
                            list[0].NEWS_INVENTORY = 0;
                        list[0].NEWS_INVENTORY = Utils.CIntDef(list[0].NEWS_INVENTORY - getQuanBeforeupdate() + quan);
                    }
                    else
                    {
                        if (list[0].NEWS_INVENTORY == null)
                            list[0].NEWS_INVENTORY = 0;
                        list[0].NEWS_INVENTORY += quan;
                    }
                    db.SubmitChanges();
                }
                else
                {
                    if (status == 1)
                    {
                        int getchenhlech = getQuanBeforeupdate() - quan;
                        if (list[0].NEWS_INVENTORY == null)
                            list[0].NEWS_INVENTORY = 0;
                        list[0].NEWS_INVENTORY = list[0].NEWS_INVENTORY + getchenhlech;
                    }
                    else
                    {
                        if (list[0].NEWS_INVENTORY == null)
                            list[0].NEWS_INVENTORY = 0;
                        list[0].NEWS_INVENTORY -= quan;
                    }
                    db.SubmitChanges();
                }
            }
        }

        protected void lbtSaveNew_Click(object sender, EventArgs e)
        {
            Save("nhap-kho.aspx");
        }

        protected void txtcode_TextChanged(object sender, EventArgs e)
        {
            Hynews.Text = getName();
            Hynews.NavigateUrl = "news.aspx?type=1&news_id=" + getIdnews();
        }

        protected void Lbprint_Click(object sender, EventArgs e)
        {
            Response.Redirect("print-kho.aspx?id=" + idivent);
        }

       
    }
}