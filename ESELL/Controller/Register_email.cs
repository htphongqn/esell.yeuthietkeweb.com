using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;

namespace Controller
{
    public class Register_email
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        private bool Checkemail(string email)
        {
            try
            {
                var list = db.ESHOP_MAIL_RECIVEs.Where(n => n.MAIL_NAME == email).ToList();
                if (list.Count > 0)
                {
                    return true;
                }
                return false;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public bool Add_email(string email,int _active)
        {
            if (Checkemail(email))
            {
                return false;
            }
            else
            {
                ESHOP_MAIL_RECIVE mail = new ESHOP_MAIL_RECIVE();
                mail.MAIL_NAME = email;
                mail.MAIL_ACTIVE = _active;
                db.ESHOP_MAIL_RECIVEs.InsertOnSubmit(mail);
                db.SubmitChanges();
                return true;
            }
        }
        public bool setChecked(string email)
        { 
             var list = db.ESHOP_MAIL_RECIVEs.Where(n => n.MAIL_NAME == email).ToList();
             if (list.Count > 0)
             {
                 if (list[0].MAIL_ACTIVE == 1)
                     return true;
             }
             return false;
        }
        public bool updateActive(string email,int _active)
        {
            var list = db.ESHOP_MAIL_RECIVEs.Where(n => n.MAIL_NAME == email).ToList();
            if (list.Count > 0)
            {
                list[0].MAIL_ACTIVE = _active;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
    }
}
