using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using System.Web.Services;
using vpro.functions;
using Controller;
using MVC_Kutun.Components;

namespace MVC_Kutun.vi_vn
{
    public partial class Ajax_comment : System.Web.UI.Page
    {
        static setCookieSignin setck = new setCookieSignin();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
        [WebMethod]
        public static string comment(string desc, string id)
        {
            Comment cm=new Comment();
            try
            {
                if (cm.Addcomment(desc, Utils.CIntDef(id)))
                {
                    
                    return "success";
                }
               return "errors";
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return "errors";
            }
        }
    }
}