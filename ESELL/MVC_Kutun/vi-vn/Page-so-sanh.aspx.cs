using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using vpro.functions;
using Controller;
using MVC_Kutun.Components;

namespace MVC_Kutun.vi_vn
{
    public partial class Page_so_sanh : System.Web.UI.Page
    {
        #region Declare
        Config cf = new Config();
        Function fun = new Function();
        Propertity per = new Propertity();
        clsFormat fm = new clsFormat();
        int _id1 = 0, _id2 = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _id1 = Utils.CIntDef(Request["id1"]);
            _id2 = Utils.CIntDef(Request["id2"]);
            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
            }

            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            header.Title = "So sánh";
            if (!IsPostBack)
            {
                getInfo(_id1, Hyname1, Hyperimg1, Lbdesc1, Lbprice1, Lbbaohanh1, Lbxuatxu1, lbthuonghieu1);
                getInfo(_id2, Hyname2, Hyperimg2, Lbdesc2, Lbprice2, Lbbaohanh2, Lbxuatxu2, lbthuonghieu2);
            }

        }
        private void getInfo(int id, HyperLink linkname, HyperLink linkimg, Label lbdesc, Label price, Label baohanh, Label xuatxu, Label thuonghieu)
        {
            var list = per.getProinfo(id);
            if (list.Count > 0)
            {

                linkname.NavigateUrl = fun.Getlink_News(list[0].NEWS_URL, list[0].NEWS_SEO_URL, list[0].CAT_SEO_URL);
                linkimg.NavigateUrl = fun.Getlink_News(list[0].NEWS_URL, list[0].NEWS_SEO_URL, list[0].CAT_SEO_URL);
                linkname.Text = list[0].NEWS_TITLE;
                linkimg.ImageUrl = fun.GetImageT_News(list[0].NEWS_ID, list[0].NEWS_IMAGE3);
                lbdesc.Text = fun.setBr(list[0].NEWS_DESC);
                price.Text =fun.Getprice1(list[0].NEWS_PRICE1, 0);
                baohanh.Text = list[0].NEWS_FIELD2;
                xuatxu.Text = per.getNameCate(list[0].UNIT_ID1);
                thuonghieu.Text = per.getNameCate(list[0].UNIT_ID2);
            }
        }
    }
}