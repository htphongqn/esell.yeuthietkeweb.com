using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Web;
using System.Web.UI;
using vpro.functions;

namespace Controller
{
    public class Account
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        public  bool Login(string Email, string MatKhau)
        {
            var dangnhap = from a in db.ESHOP_CUSTOMERs
                           where a.CUSTOMER_EMAIL == Email && a.CUSTOMER_PW == MatKhau
                           select a;
            if (dangnhap.ToList().Count > 0)
            {
                Load_All_Cuss(Email);
                return true;
            }
            else
                return false;
        }
        private void Load_All_Cuss(string email)
        {
            try
            {
                var _cus = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_EMAIL == email);
                if (_cus.ToList().Count > 0)
                {
                    HttpContext.Current.Session["User_Name"] = _cus.ToList()[0].CUSTOMER_FULLNAME;
                    HttpContext.Current.Session["User_ID"] = _cus.ToList()[0].CUSTOMER_ID;
                    HttpContext.Current.Session["User_Phone"] = _cus.ToList()[0].CUSTOMER_PHONE1;
                    HttpContext.Current.Session["User_Email"] = _cus.ToList()[0].CUSTOMER_EMAIL;
                    HttpContext.Current.Session["User_Type"] = _cus.ToList()[0].CUSTOMER_TYPE;
                    HttpContext.Current.Session["User_Code"] = _cus.ToList()[0].CUSTOMER_CODEID;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #region Register
       
        public bool Check_email(string _email)
        {
            try
            {
                var _user = db.GetTable<ESHOP_CUSTOMER>().Where(u => u.CUSTOMER_EMAIL == _email.Trim());

                if (_user.ToList().Count > 0)
                    return true;

                return false;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return true;
            }
        }
        public bool Register(string _sFullName, string _Email, string _Pass,string _code,string _phone,string _add,int sex,string _idcity,string _iddistrict,DateTime _birth)
        {
            if (!Check_email(_Email))
            {
                ESHOP_CUSTOMER user = new ESHOP_CUSTOMER();
                user.CUSTOMER_EMAIL = _Email;
                user.CUSTOMER_PW = _Pass;
                user.CUSTOMER_FULLNAME = _sFullName;
                user.CUSTOMER_PUBLISHDATE = DateTime.Now;
                user.CUSTOMER_PHONE1 = _phone;
                user.CUSTOMER_ADDRESS = _add;
                user.CUSTOMER_FIELD1 = _idcity;
                user.CUSTOMER_FIELD2 = _iddistrict;
                user.CUSTOMER_FIELD3 = sex.ToString();
                user.CUSTOMER_UPDATE = _birth;
                user.CUSTOMER_SHOWTYPE = 0;
                user.CUSTOMER_FIELD5 = _code;
                user.CUSTOMER_TYPE = 0;
                db.ESHOP_CUSTOMERs.InsertOnSubmit(user);
                db.SubmitChanges();
                Load_All_Cuss(_Email);
                return true;
            }
            return false;
        }
        public bool Register(string _sFullName, string _Email, string _Pass, string _code, string _phone, string _add, int sex, string _idcity, string _iddistrict, DateTime _birth,string _codebank)
        {
            if (!Check_email(_Email))
            {
                ESHOP_CUSTOMER user = new ESHOP_CUSTOMER();
                user.CUSTOMER_EMAIL = _Email;
                user.CUSTOMER_PW = _Pass;
                user.CUSTOMER_FULLNAME = _sFullName;
                user.CUSTOMER_PUBLISHDATE = DateTime.Now;
                user.CUSTOMER_PHONE1 = _phone;
                user.CUSTOMER_ADDRESS = _add;
                user.CUSTOMER_FIELD1 = _idcity;
                user.CUSTOMER_FIELD2 = _iddistrict;
                user.CUSTOMER_FIELD3 = sex.ToString();
                user.CUSTOMER_UPDATE = _birth;
                user.CUSTOMER_SHOWTYPE = 0;
                user.CUSTOMER_FIELD5 = _code;
                user.CUSTOMER_TYPE = 1;
                user.CUSTOMER_CODEBANK = _codebank;
                db.ESHOP_CUSTOMERs.InsertOnSubmit(user);
                db.SubmitChanges();
                Load_All_Cuss(_Email);
                int _idcode = 1;
                var list = db.ESHOP_CUSTOMERs.OrderByDescending(n => n.CUSTOMER_ID).Take(1).ToList();
                if (list.Count > 0)
                {
                    _idcode = Utils.CIntDef(list[0].CUSTOMER_ID);
                    string _codesale = "dl" + DateTime.Now.Day + _idcode;
                    list[0].CUSTOMER_CODEID = _codesale;
                    db.SubmitChanges();
                }
                return true;
            }
            return false;
        }
        #endregion
        #region Forgetpass
        public string Name;
        public void Sendpass(string _email,string _pass)
        {
            try
            {
                var list = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_EMAIL == _email);
                foreach (var i in list)
                {
                    Name = i.CUSTOMER_FULLNAME;
                    i.CUSTOMER_PW = _pass;
                    db.SubmitChanges();
                }
               
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        #endregion
        #region active
        public bool activeAcc(string code)
        {
            var list = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_FIELD5 == code&&n.CUSTOMER_SHOWTYPE==0).ToList();
            if (list.Count > 0)
            {
                list[0].CUSTOMER_SHOWTYPE = 1;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
        #endregion

        public void setSessionCokie(int _id)
        {
            try
            {
                var _cus = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == _id);
                if (_cus.ToList().Count > 0)
                {
                    HttpContext.Current.Session["User_Name"] = _cus.ToList()[0].CUSTOMER_FULLNAME;
                    HttpContext.Current.Session["User_ID"] = _cus.ToList()[0].CUSTOMER_ID;
                    HttpContext.Current.Session["User_Phone"] = _cus.ToList()[0].CUSTOMER_PHONE1;
                    HttpContext.Current.Session["User_Email"] = _cus.ToList()[0].CUSTOMER_EMAIL;
                    HttpContext.Current.Session["User_Type"] = _cus.ToList()[0].CUSTOMER_TYPE;
                    HttpContext.Current.Session["User_Code"] = _cus.ToList()[0].CUSTOMER_CODEID;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public int getUserid(string _code)
        {
            var list = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_CODEID == _code).Select(n => new { n.CUSTOMER_ID}).ToList();
            if (list.Count > 0)
                return Utils.CIntDef(list[0].CUSTOMER_ID);
            return 0;
        }
    }
}
