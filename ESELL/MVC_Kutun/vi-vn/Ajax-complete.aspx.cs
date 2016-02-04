using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using System.Web.Services;
using Model;

namespace MVC_Kutun.vi_vn
{
    public partial class Ajax_complete : System.Web.UI.Page
    {
        static Search_result search = new Search_result();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<CategoryEntityComplete> autocomplete(string searchitem)
        {
            return search.searchComplete(searchitem);
        }
    }
}