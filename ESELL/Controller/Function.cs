using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using vpro.functions;
using Model;
using System.Web;

namespace Controller
{
    public class Function
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        public string getCookiePartner()
        {
            HttpCookie mycookie = HttpContext.Current.Request.Cookies["partnercookie"];
            if (HttpContext.Current.Request.Cookies["partnercookie"] != null)
            {
                if (!String.IsNullOrEmpty(mycookie.Value))
                    return mycookie.Value;
            }
            return string.Empty;
        }
        public string Getlink_News(object News_url, object Seo_url)
        {
            string _code=Utils.CStrDef(HttpContext.Current.Session["User_Code"]);
            string _codecookie = getCookiePartner();
            if (String.IsNullOrEmpty(_code))
                _code = _codecookie;
            if (!String.IsNullOrEmpty(_code))
                return string.IsNullOrEmpty(Utils.CStrDef(News_url)) ? "/" + Utils.CStrDef(Seo_url) + ".html?code=" + _code + "" : Utils.CStrDef(News_url);
            return string.IsNullOrEmpty(Utils.CStrDef(News_url)) ? "/" + Utils.CStrDef(Seo_url) + ".html" : Utils.CStrDef(News_url);
        }
        public string Getlink_Cat(object Cat_Url, object Cat_Seo_Url)
        {
            return string.IsNullOrEmpty(Utils.CStrDef(Cat_Url)) ? "/" + Utils.CStrDef(Cat_Seo_Url) + ".html" : Utils.CStrDef(Cat_Url);
        }
        public string getLinkSosanh(int _newsid1, object id2)
        {
            return "/so-sanh/html?typesosanh=0&id1=" + _newsid1 + "&id2=" + id2;
        }
        public string Getprice(object Price1)
        {
            decimal _dPrice1 = Utils.CDecDef(Price1);
            if (_dPrice1 != 0)
            {
                return String.Format("{0:0,0 VNĐ}", _dPrice1).Replace(",", ".");
            }
            return "Liên hệ";
        }
        public decimal Getprice_addtocart(object Price1)
        {
            decimal _dPrice1 = Utils.CDecDef(Price1);
            if (_dPrice1 != 0)
            {
                return _dPrice1;
            }
            return 0;
        }
        
        public string Getprice1(object Price1, object Price2)
        {
            decimal _dPrice1 = Utils.CDecDef(Price1);
            decimal _dPrice2 = Utils.CDecDef(Price2);
            if (_dPrice2 != 0)
            {
                return String.Format("{0:0,0 VNĐ}", _dPrice2).Replace(",", ".");
            }
            return _dPrice1 != 0 ? String.Format("{0:0,0 VNĐ}", _dPrice1).Replace(",", ".") : "Liên hệ";
        }
        public string Getprice2(object Price1, object Price2)
        {
            decimal _dPrice1 = Utils.CDecDef(Price1);
            decimal _dPrice2 = Utils.CDecDef(Price2);
            if (_dPrice2 != 0)
            {
                return String.Format("{0:0,0 VNĐ}", _dPrice1).Replace(",", "."); 
            }
            return "";
        }
        public string Getgiamgia(object Price1, object Price2)
        {
            decimal _dPrice1 = Utils.CDecDef(Price1);
            decimal _dPrice2 = Utils.CDecDef(Price2);
            if (_dPrice2 != 0 && _dPrice1!=0)
            {
                return "<div class='reduce'> -"+Utils.CIntDef(100 - (_dPrice2 * 100 / _dPrice1))+ "%</div>";
            }
            return "";
        }
        public string GetgiamgiaCart(object Price1, object Price2)
        {
            decimal _dPrice1 = Utils.CDecDef(Price1);
            decimal _dPrice2 = Utils.CDecDef(Price2);
            if (_dPrice2 != 0)
            {
                return "<div class='percent_saving'> -" + Utils.CIntDef(100 - (_dPrice2 * 100 / _dPrice1)) + "%</div>";
            }
            return "";
        }
        public string getBuy(object NEWS_ID, object NEWS_FIELD3)
        {
          
            int sta = Utils.CIntDef(NEWS_FIELD3);
            if (sta == 1)
                return "<div class='addtocart'><a href='../vi-vn/addtocart.aspx?id="+NEWS_ID+"'>Mua ngay</a></div>";
            return "";
        }
        public string getTietkiem(object Price1, object Price2)
        {
            decimal _dPrice1 = Utils.CDecDef(Price1);
            decimal _dPrice2 = Utils.CDecDef(Price2);
            if(_dPrice1!=0&&_dPrice2!=0)
                return String.Format("{0:0,0 VNĐ}", _dPrice1 - _dPrice2).Replace(",", ".");
            return "";
        }
        public string getPointietkiem(object Price1, object Price2)
        {
            decimal _dPrice1 = Utils.CDecDef(Price1);
            decimal _dPrice2 = Utils.CDecDef(Price2);
            if (_dPrice2 != 0)
            {
                return "" + Utils.CIntDef(100 - (_dPrice2 * 100 / _dPrice1)) + "%";
            }
            return "";
        }
        public string setBr(string desc)
        {
            if (!String.IsNullOrEmpty(desc))
            {
                if (desc.Contains("\r\n"))
                    desc = desc.Replace("\r\n", "<br/>");
            }
            return desc;
        }
        public string getDate(object News_PublishDate)
        {
            return string.Format("{0:dd/MM/yyyy}", News_PublishDate);
        }
        public DateTime formatDate(string _date)
        {
            string[] a = _date.Split('-');
            if (a.Length == 3)
            {
                string _datenew = a[1] + "/" + a[0] + "/" + a[2];
                return Utils.CDateDef(_datenew, DateTime.Today);
            }
            return DateTime.Today;
        }
        public string GetImageT_News(object News_Id, object News_Image1)
        {

            try
            {
                if (Utils.CIntDef(News_Id) > 0 && !string.IsNullOrEmpty(Utils.CStrDef(News_Image1)))
                {
                    return PathFiles.GetPathNews(Utils.CIntDef(News_Id)) + Utils.CStrDef(News_Image1);
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetImageT_News_Hasclass(object News_Id, object News_Image1, string nameclass)
        {

            try
            {
                
                if (Utils.CIntDef(News_Id) > 0 && !string.IsNullOrEmpty(Utils.CStrDef(News_Image1)))
                {
                    return "<img class='" + nameclass + "' alt='' src='" + PathFiles.GetPathNews(Utils.CIntDef(News_Id)) + Utils.CStrDef(News_Image1) + "'/>";
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetImageT_News_HasLink(object News_Id, object News_Image1, string nameclass, object url, object seo_url, object news_title)
        {

            try
            {
                //string _news_seo = String.IsNullOrEmpty(Utils.CStrDef(url)) ? Utils.CStrDef(seo_url) : Utils.CStrDef(url);
                string _news_seo = Getlink_News(url, seo_url);
                if (Utils.CIntDef(News_Id) > 0 && !string.IsNullOrEmpty(Utils.CStrDef(News_Image1)))
                {
                    return "<a href='" + _news_seo + "' title='" + Utils.CStrDef(news_title) + "'><img class='" + nameclass + "' alt='" + Utils.CStrDef(news_title) + "' src='" + PathFiles.GetPathNews(Utils.CIntDef(News_Id)) + Utils.CStrDef(News_Image1) + "'/></a>";
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string Getimages_Cat(object cat_id, object cat_img)
        {
            if (Utils.CIntDef(cat_id) > 0 && !string.IsNullOrEmpty(Utils.CStrDef(cat_img)))
            {
                return PathFiles.GetPathCategory(Utils.CIntDef(cat_id)) + Utils.CStrDef(cat_img);
            }
            else
            {
                return "";
            }
        }
        public string GetImageAd(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url, object AD_ITEM_DESC = null)
        {
            try
            {
                if (Utils.CIntDef(Ad_Id) > 0 && !string.IsNullOrEmpty(Utils.CStrDef(Ad_Image1)))
                    return "<a href='" + Utils.CStrDef(Ad_Url) + "' target='" + Utils.CStrDef(Ad_Target) + "' title='" + Utils.CStrDef(AD_ITEM_DESC) + "'><img src='" + PathFiles.GetPathAdItems(Utils.CIntDef(Ad_Id)) + Utils.CStrDef(Ad_Image1) + "' alt='" + Utils.CStrDef(AD_ITEM_DESC) + "' /></a>";
                return "";
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        public string GetImageAdTrade(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url)
        {
            try
            {
                if (Utils.CIntDef(Ad_Id) > 0 && !string.IsNullOrEmpty(Utils.CStrDef(Ad_Image1)))
                    return "<li><a href='" + Utils.CStrDef(Ad_Url) + "' target='" + Utils.CStrDef(Ad_Target) + "'><img src='" + PathFiles.GetPathAdItems(Utils.CIntDef(Ad_Id)) + Utils.CStrDef(Ad_Image1) + "' alt='' /></a></li>";
                return "";
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        //Get images logo - sologan
        public string Getbannerm(object Banner_type, object banner_field, object Banner_ID, object Banner_Image)
        {
            string banner = banner_field.ToString();
            return banner == "1" ? "<a href='/' id='mobile_logo' class='fleft'>" + GetImage(Banner_type, Banner_ID, Banner_Image, "") + "</a>" : "<a href='/'>" + GetImage(Banner_type, Banner_ID, Banner_Image, "") + "</a>";
        }
        public string Getbanner(object Banner_type, object banner_field, object Banner_ID, object Banner_Image, string title)
        {
            string banner = banner_field.ToString();
            return banner == "1" ? "<a href='/' id='logo' class='fl' title ='" + title + "'>" + GetImage(Banner_type, Banner_ID, Banner_Image, title) + "</a>" : "<a href='/' title ='" + title + "'>" + GetImage(Banner_type, Banner_ID, Banner_Image, title) + "</a>";
        }
        public string GetImage(object Banner_type, object Banner_ID, object Banner_Image, string title)
        {
            try
            {
                string _sResult = string.Empty;
                if (Utils.CIntDef(Banner_type) == 0)
                {
                    if (Utils.CIntDef(Banner_ID) > 0 && !string.IsNullOrEmpty(Utils.CStrDef(Banner_Image)))
                        return "<img src='" + PathFiles.GetPathBanner(Utils.CIntDef(Banner_ID)) + Utils.CStrDef(Banner_Image) + "'  alt='" + title + "' />";
                    else
                        return "<img src='../vi-vn/Images/Logo.png' width='172' height='80' />"; ;
                }
                else
                {
                    if (Utils.CIntDef(Banner_ID) > 0 && !string.IsNullOrEmpty(Utils.CStrDef(Banner_Image)))
                    {
                        _sResult += "<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0'  height='117' id='ShockwaveFlash1' >";
                        _sResult += "<param name='movie' value='" + PathFiles.GetPathAdItems(Utils.CIntDef(Banner_ID)) + Utils.CStrDef(Banner_Image) + "'>";
                        _sResult += "<param name='Menu' value='0'>";
                        _sResult += "<param name='quality' value='high'>";
                        _sResult += "<param name='wmode' value='transparent'>";
                        _sResult += "<embed height='117' width='885' src='" + PathFiles.GetPathBanner(Utils.CIntDef(Banner_ID)) + Utils.CStrDef(Banner_Image) + "' wmode='transparent' ></object>";
                    }

                }
                return _sResult;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        //Support
        public string Bind_Online(object Type, object Description, object Nickname)
        {

            try
            {
                int _iType = Utils.CIntDef(Type);
                string _sResult = string.Empty;
                switch (_iType)
                {
                    case 0:
                        _sResult += "<a href='ymsgr:sendim?" + Utils.CStrDef(Nickname) + "' title='" + Utils.CStrDef(Description) + "'>";
                        _sResult += "<img src='http://opi.yahoo.com/online?u=" + Utils.CStrDef(Nickname) + "&amp;m=g&amp;t=1' width='64' height='16' border='0' alt='" + Utils.CStrDef(Description) + "'";
                        _sResult += "</a>";

                        break;
                    case 1:
                        _sResult += "<a href='skype:" + Utils.CStrDef(Nickname) + "?chat' title='" + Utils.CStrDef(Description) + "' class='iframe topopup skype'>";
                        _sResult += "<img src='http://mystatus.skype.com/smallclassic/" + Utils.CStrDef(Nickname) + "' alt='" + Utils.CStrDef(Description) + "' width='64' height='16'";
                        _sResult += "</a>";
                        break;
                    //case 2:
                    //    _sResult += "<li><span class='number_phone'>" + Utils.CStrDef(Description) + "</span></li>";
                    //    break;
                    default:
                        break;
                }
                return _sResult;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string Bind_Online2(object Type, object Description, object Nickname)
        {

            try
            {
                int _iType = Utils.CIntDef(Type);
                string _sResult = string.Empty;
                switch (_iType)
                {
                    case 0:
                        _sResult += "<a href='ymsgr:sendim?" + Utils.CStrDef(Nickname) + "' title='" + Utils.CStrDef(Description) + "'>";
                        _sResult += Utils.CStrDef(Description) + "<img src='../vi-vn/Images/icon_yahoo.png' alt='yahoo'  class='fl' />";
                        _sResult += "</a>";

                        break;
                    case 1:
                        _sResult += "<a href='skype:" + Utils.CStrDef(Nickname) + "?call' title='" + Utils.CStrDef(Description) + "'>";
                        _sResult += "<img src='http://mystatus.skype.com/smallclassic/" + Utils.CStrDef(Nickname) + "' title=" + Utils.CStrDef(Description) + "  alt=" + Utils.CStrDef(Description) + " class='fl' >";
                        _sResult += "</a>";
                        break;
                    default:
                        break;
                }
                return _sResult;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
    }
}
