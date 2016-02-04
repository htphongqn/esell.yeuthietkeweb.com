using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_Kutun.Components
{
    public class setCookiePartner
    {
        HttpCookie mycookie = new HttpCookie("partnercookie");

        public setCookiePartner()
        {
            // Check the Request Cookies collection for the cookie.
            if (System.Web.HttpContext.Current.Request.Cookies["partnercookie"] != null)
            {
                mycookie = System.Web.HttpContext.Current.Request.Cookies["partnercookie"];
            }
        }

        public void Addcookie(string Item)
        {
            mycookie.Value = Item;
            mycookie.Expires = DateTime.Now.AddDays(7);

            // Add cookie
            System.Web.HttpContext.Current.Response.Cookies.Add(mycookie);
        }

        public HttpCookie GetCookie()
        {
            return mycookie;
        }

        public void Removecookie()
        {
           
            mycookie.Expires = DateTime.Now.AddDays(-1);
            // Remove cookie
            System.Web.HttpContext.Current.Response.Cookies.Add(mycookie);

        }
    }
}