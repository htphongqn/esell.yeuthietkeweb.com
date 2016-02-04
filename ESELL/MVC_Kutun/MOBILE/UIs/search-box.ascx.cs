using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using System.Data;

namespace MVC_Kutun.MOBILE.UIs
{
    public partial class search_box : System.Web.UI.UserControl
    {
        Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Load_catesearch();
        }
        private void Load_catesearch()
        {
            var list = per.Load_danhmuc_search(1);
            if (list.Count > 0)
            {
                DataRelation relCat;
                DataTable tbl = DataUtil.LINQToDataTable(list);
                DataSet ds = new DataSet();
                ds.Tables.Add(tbl);

                tbl.PrimaryKey = new DataColumn[] { tbl.Columns["CAT_ID"] };
                relCat = new DataRelation("Category_parent", ds.Tables[0].Columns["CAT_ID"], ds.Tables[0].Columns["CAT_PARENT_ID"], false);

                ds.Relations.Add(relCat);
                DataSet dsCat = ds.Clone();
                DataTable CatTable = ds.Tables[0];

                DataUtil.TransformTableWithSpace(ref CatTable, dsCat.Tables[0], relCat, null);

                Drcate_search.DataSource = dsCat.Tables[0];
                Drcate_search.DataTextField = "CAT_NAME";
                Drcate_search.DataValueField = "CAT_ID";
                Drcate_search.DataBind();
            }
            ListItem l = new ListItem("Tất cả", "0");
            l.Selected = true;
            Drcate_search.Items.Insert(0, l);
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int catid = Utils.CIntDef(Drcate_search.SelectedValue);
            Response.Redirect("/tim-kiem.html?page=0&catid=" + catid + "&keyword=" + txtsearch.Value);
        }
    }
}