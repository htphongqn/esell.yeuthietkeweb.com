using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;

namespace MVC_Kutun.UIs
{
    public partial class Seo_sologan : System.Web.UI.UserControl
    {
        Config cf = new Config();
        protected void Page_Load(object sender, EventArgs e)
        {
            Load_intro();
        }
        private void Load_intro()
        {

            Literal_intro.Text = cf.Show_File_HTML("contact-seo.htm", "/Data/contact/");
        }
    }
}