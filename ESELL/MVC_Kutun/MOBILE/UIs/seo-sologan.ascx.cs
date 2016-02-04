using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;

namespace MVC_Kutun.MOBILE.UIs
{
    public partial class seo_sologan : System.Web.UI.UserControl
    {
        Home index = new Home();
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_intro();
        }
        private void Load_intro()
        {
            Lbtitle_intro.Text = index.Gettitle_Showfilehtml_index(7);
            Literal_intro.Text = index.Showfilehtml_index(7);
        }
    }
}