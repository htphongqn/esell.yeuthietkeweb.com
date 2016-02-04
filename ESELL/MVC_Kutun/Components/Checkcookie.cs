using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using vpro.functions;

namespace MVC_Kutun.Components
{
    public class Checkcookie
    {
        Getcookie ck = new Getcookie();
        setCookieLike cklike = new setCookieLike();
        setCookieRating ckrat = new setCookieRating();
        setCookieSignin cksignin = new setCookieSignin();
        setCookiePartner ckpartner = new setCookiePartner();
        public List<string> Listcookie_see()
        {
            try
            {
                HttpCookie mycookie = ck.GetCookie();
                List<string> l = new List<string>();
                if (System.Web.HttpContext.Current.Request.Cookies["news_url"] != null)
                {
                    if (mycookie.HasKeys)
                    {
                        for (int j = 0; j < mycookie.Values.Count; j++)
                        {
                            l.Add(mycookie.Values[j]);
                        }
                    }
                }
                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<string> Listcookie_like()
        {
            try
            {
                HttpCookie mycookie = cklike.GetCookie();
                List<string> l = new List<string>();
                if (System.Web.HttpContext.Current.Request.Cookies["news_url_like"] != null)
                {
                    if (mycookie.HasKeys)
                    {
                        for (int j = 0; j < mycookie.Values.Count; j++)
                        {
                            l.Add(mycookie.Values[j]);
                        }
                    }
                }
                return l;

            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<string> Listcookie_Rating()
        {
            try
            {
                HttpCookie mycookie = ckrat.GetCookie();
                List<string> l = new List<string>();
                if (System.Web.HttpContext.Current.Request.Cookies["news_url_rating"] != null)
                {
                    if (mycookie.HasKeys)
                    {
                        for (int j = 0; j < mycookie.Values.Count; j++)
                        {
                            l.Add(mycookie.Values[j]);
                        }
                    }
                }
                return l;

            }
            catch
            {

                throw;
            }
        }
        public int getCookieSignin()
        {
            HttpCookie mycookie = cksignin.GetCookie();
            if (System.Web.HttpContext.Current.Request.Cookies["signincookie"] != null)
            {
                if (mycookie.HasKeys)
                {

                    return Utils.CIntDef(mycookie.Values[0]);
                }
            }
            return 0;
        }
        public string getCookiePartner()
        {
            HttpCookie mycookie = ckpartner.GetCookie();
            if (System.Web.HttpContext.Current.Request.Cookies["partnercookie"] != null)
            {
                if (!String.IsNullOrEmpty(mycookie.Value))
                    return mycookie.Value;
            }
            return string.Empty;
        }
    }
}