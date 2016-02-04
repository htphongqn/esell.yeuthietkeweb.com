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
            //String hostdet = Request.ServerVariables["HTTP_HOST"].ToString();

            //lbMessage.Text = hostdet + " - " + System.Net.NetworkInformation.IPGlobalProperties.GetIPGlobalProperties().DomainName;

            string kq = XLDLRepo.DataCommand(TextBox1.Text);
            lbMessage.Text = kq;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string kq = XLDLRepo.DataCommand("  BACKUP DATABASE esell2_vn TO DISK= '" + Server.MapPath("~/esell2_vn.bak") + "' WITH FORMAT");
            lbMessage.Text = kq;
        }
    }
}