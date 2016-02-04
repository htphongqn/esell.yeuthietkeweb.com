using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_Kutun.Components
{
    public class setCookieLike
    {
        HttpCookie mycookie = new HttpCookie("news_url_like");

        public setCookieLike()
        {
            // Check the Request Cookies collection for the cookie.
            if (System.Web.HttpContext.Current.Request.Cookies["news_url_like"] != null)
            {
                mycookie = System.Web.HttpContext.Current.Request.Cookies["news_url_like"];
            }
        }

        public void Addcookie(string Item)
        {
            mycookie.Values["Item_"+Item] = Item;
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

            // Remove cookie
            System.Web.HttpContext.Current.Response.Cookies.Remove(Item);

        }
    }
}