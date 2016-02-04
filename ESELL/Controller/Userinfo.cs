using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;

namespace Controller
{
    public class Userinfo
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        public List<ESHOP_PROPERTy> Loadcity()
        {
            try
            {
                var list = db.ESHOP_PROPERTies.Where(n => n.PROP_RANK == 2).ToList();
                return list;
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public List<ESHOP_PROPERTy> Loaddistric(int idpro)
        {
            try
            {
                var list = db.ESHOP_PROPERTies.Where(n => n.PROP_RANK == 3&&n.PROP_PARENT_ID==idpro).ToList();
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public decimal getShip(int id)
        {
            var list = db.ESHOP_PROPERTies.Where(n => n.PROP_ID == id).ToList();
            if (list.Count > 0)
                return Utils.CIntDef(list[0].PROP_SHIPPING_FEE);
            return 0;
        }
        public string getnamePro(int id)
        {
            var list = db.ESHOP_PROPERTies.Where(n => n.PROP_ID == id).ToList();
            if (list.Count > 0)
                return list[0].PROP_NAME;
            return "";
        }
        public List<ESHOP_CUSTOMER> Loaduserinfo(int userid)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid).ToList();
            return _vUser;
        }
        public bool Updateuser(int userid,string name,string phone,string sex,DateTime time)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid);
            foreach (var i in _vUser)
            {
               
                i.CUSTOMER_FULLNAME = name;
                i.CUSTOMER_PHONE1 = phone;
                i.CUSTOMER_FIELD3 = sex;
                i.CUSTOMER_UPDATE = time;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
        public bool updateAdd(int userid,string address, string city, string district)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid).ToList();
            if (_vUser.Count > 0)
            {
                _vUser[0].CUSTOMER_ADDRESS = address;
                _vUser[0].CUSTOMER_FIELD1 = city;
                _vUser[0].CUSTOMER_FIELD2 = district;
                db.SubmitChanges();
                return true;
            }
            return false;

        }
        public bool changePass(int userid,string passold, string passnew)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid&&a.CUSTOMER_PW==passold).ToList();
            if (_vUser.Count > 0)
            {
                _vUser[0].CUSTOMER_PW = passnew;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
    }
}
