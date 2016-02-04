using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebServicesManager.Model;

namespace WebServicesManager
{
    public partial class RunScript : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string kq = XLDLRepo.DataCommand(TextBox1.Text);
            lbMessage.Text = kq;
        }
    }
}