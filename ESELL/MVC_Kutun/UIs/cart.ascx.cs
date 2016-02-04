using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using MVC_Kutun.Components;
using vpro.functions;

namespace MVC_Kutun.UIs
{
    public partial class cart : System.Web.UI.UserControl
    {
        #region Declare
        Cart_result carts = new Cart_result();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        int _ship = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid _guid = (Guid)Session["news_guid"];
            if (!IsPostBack)
                Load_Cart(_guid);
            decimal totalmn = carts.Total_Amount(_guid);

            lbtotalmoney.Text = fm.FormatMoney(totalmn);

            if (Session["price"] != null)
            {

                _ship = Utils.CIntDef(Session["price"]);
                totalmn += _ship != -1 ? _ship : 0;
                Lbtotal.Text = fm.FormatMoney(totalmn);
                div_ship.Visible = true;
                Lbship.Text = _ship > 0 ? fm.FormatMoney(_ship) : (_ship == 0 ? "Miễn phí" : "Liên hệ");
            }
            else
            {
                Lbtotal.Text = fm.FormatMoney(totalmn);
                div_ship.Visible = false;
            }


        }
        public void Load_Cart(Guid _guid)
        {
            var _basket = carts.Load_cart(_guid);

            if (_basket.ToList().Count > 0)
            {

                Rpgiohang.DataSource = _basket;
                Rpgiohang.DataBind();
                for (int i = 0; i < Rpgiohang.Items.Count; i++)
                {
                    DropDownList dr = Rpgiohang.Items[i].FindControl("Drquan") as DropDownList;
                    dr.SelectedValue = _basket[i].Basket_quantity.ToString();
                }
            }
        }
        protected void drSoLuong_SelectedIndexChanged(object sender, EventArgs e)
        {
            Guid _guid = (Guid)Session["news_guid"];

            for (int i = 0; i < Rpgiohang.Items.Count; i++)
            {
                //TextBox txt = Rpgiohang.Rows[i].FindControl("txtSoLuong") as TextBox;
                DropDownList dr = Rpgiohang.Items[i].FindControl("Drquan") as DropDownList;
                HiddenField newsid = Rpgiohang.Items[i].FindControl("Hdnews_id") as HiddenField;
                int _sID = Utils.CIntDef(newsid.Value);
                if (_sID != 0)
                    carts.Update_cart(_guid, _sID, Utils.CIntDef(dr.SelectedValue));

            }

            Load_Cart(_guid);
            decimal totalmn = carts.Total_Amount(_guid);

            lbtotalmoney.Text = fm.FormatMoney(totalmn);

            if (Session["price"] != null)
            {

                _ship = Utils.CIntDef(Session["price"]);
                totalmn += _ship != -1 ? _ship : 0;
                Lbtotal.Text = fm.FormatMoney(totalmn);
                div_ship.Visible = true;
                Lbship.Text = _ship > 0 ? fm.FormatMoney(_ship) : (_ship == 0 ? "Miễn phí" : "Liên hệ");
            }
            else
            {
                Lbtotal.Text = fm.FormatMoney(totalmn);
                div_ship.Visible = false;
            }
        }

        protected void Rpgiohang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                Guid _guid = (Guid)Session["news_guid"];

                int _sID = int.Parse(e.CommandArgument.ToString());
                carts.Delete_cart(_guid, _sID);
                Load_Cart(_guid);
                decimal totalmn = carts.Total_Amount(_guid);

                lbtotalmoney.Text = fm.FormatMoney(totalmn);

                if (Session["price"] != null)
                {

                    _ship = Utils.CIntDef(Session["price"]);
                    totalmn += _ship != -1 ? _ship : 0;
                    Lbtotal.Text = fm.FormatMoney(totalmn);
                    div_ship.Visible = true;
                    Lbship.Text = _ship > 0 ? fm.FormatMoney(_ship) : (_ship == 0 ? "Miễn phí" : "Liên hệ");
                }
                else
                {
                    Lbtotal.Text = fm.FormatMoney(totalmn);
                    div_ship.Visible = false;
                }
            }
        }
    }
}