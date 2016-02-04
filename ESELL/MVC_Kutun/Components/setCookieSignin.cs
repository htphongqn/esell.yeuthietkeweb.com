using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_Kutun.Components
{
    public class setCookieSignin
    {
        HttpCookie mycookie = new HttpCookie("signincookie");

        public setCookieSignin()
        {
            // Check the Request Cookies collection for the cookie.
            if (System.Web.HttpContext.Current.Request.Cookies["signincookie"] != null)
            {
                mycookie = System.Web.HttpContext.Current.Request.Cookies["signincookie"];
            }
        }

        public void Addcookie(string Item)
        {
            mycookie.Values["item"] = Item;
            mycookie.Expires = DateTime.Now.AddMonths(1);

            // Add cookie
            System.Web.HttpContext.Current.Response.Cookies.Add(mycookie);
        }

        public HttpCookie GetCookie()
        {
            return mycookie;
        }

        public void Removecookie(string Item)
        {
            mycookie.Values["Item"] = Item;
            mycookie.Expires = DateTime.Now.AddDays(-1);
            // Remove cookie
            System.Web.HttpContext.Current.Response.Cookies.Add(mycookie);

        }
    }
}