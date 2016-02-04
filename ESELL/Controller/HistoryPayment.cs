using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;

namespace Controller
{
    public class Historypayment
    {
        #region Decclare
        dbVuonRauVietDataContext db = new dbVuonRauVietDataContext();
        #endregion
        public List<ESHOP_ORDER> loadHispayment(int userid)
        {
            var list = db.ESHOP_ORDERs.Where(n => n.CUSTOMER_ID == userid).OrderByDescending(n=>n.ORDER_ID).ToList();
            return list;
        }
        public List<ESHOP_ORDER> loadHispayment(int userid,DateTime datefrom,DateTime dateto,bool checkdate)
        {
            var list = db.ESHOP_ORDERs.Where(n => n.CUSTOMER_ID == userid&&(checkdate==true ? n.ORDER_PUBLISHDATE>=datefrom&&n.ORDER_PUBLISHDATE<=dateto.AddDays(1).AddTicks(-1):checkdate==false)).OrderByDescending(n => n.ORDER_ID).ToList();
            return list;
        }
        public List<ESHOP_ORDER> checkorderPayment(string code,string email)
        {
            var list = db.ESHOP_ORDERs.Where(n => n.ORDER_CODE==code&&n.ORDER_EMAIL==email).OrderByDescending(n => n.ORDER_ID).ToList();
            return list;
        }
        public List<Order_entity> load_ordePaymentFinal(int _id)
        {
            List<Order_entity> l = new List<Order_entity>();
            var list = (from a in db.ESHOP_ORDERs
                        join b in db.ESHOP_ORDER_ITEMs on a.ORDER_ID equals b.ORDER_ID
                        join c in db.ESHOP_NEWs on b.NEWS_ID equals c.NEWS_ID
                        where a.ORDER_ID == _id
                        select new
                        {
                            c.NEWS_TITLE,
                            a.ORDER_NAME,
                            a.ORDER_PHONE,
                            a.ORDER_ID,
                            c.NEWS_SEO_URL,
                            c.NEWS_URL,
                            c.NEWS_IMAGE3,
                            a.ORDER_ADDRESS,
                            c.NEWS_ID,
                            c.NEWS_PRICE1,
                            c.NEWS_PRICE2,
                            a.ORDER_CODE,
                            a.ORDER_SHIPPING_FEE,
                            a.ORDER_TOTAL_AMOUNT,
                            a.ORDER_TOTAL_ALL,
                            b.ITEM_QUANTITY,
                            b.ITEM_SUBTOTAL,
                            b.ITEM_PRICE

                        }).OrderByDescending(n => n.ORDER_ID);
            foreach (var i in list)
            {
                Order_entity order = new Order_entity();
                order.NEWS_SEO_URL = i.NEWS_SEO_URL;
                order.NEWS_URL = i.NEWS_URL;
                order.ORDER_NAME = i.ORDER_NAME;
                order.ORDER_PHONE = i.ORDER_PHONE;
                order.NEWS_TITLE = i.NEWS_TITLE;
                order.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                order.NEWS_ID = Utils.CIntDef(i.NEWS_ID);
                order.ORDER_ADDRESS = i.ORDER_ADDRESS;
                order.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                order.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                order.ORDER_CODE = i.ORDER_CODE;
                order.ORDER_SHIPPING_FEE = Utils.CDecDef(i.ORDER_SHIPPING_FEE);
                order.ITEM_PRICE = Utils.CDecDef(i.ITEM_PRICE);
                order.ITEM_QUANTITY = Utils.CIntDef(i.ITEM_QUANTITY);
                order.ORDER_TOTAL_AMOUNT = Utils.CDecDef(i.ORDER_TOTAL_AMOUNT);
                order.ORDER_TOTAL_ALL = Utils.CDecDef(i.ORDER_TOTAL_ALL);
                l.Add(order);
            }
            return l;
        }
        public IQueryable<Order_entity> load_ordePaymentFinalobj(object id)
        {
            int _id = Utils.CIntDef(id);
            List<Order_entity> l = new List<Order_entity>();
            var list = (from a in db.ESHOP_ORDERs
                        join b in db.ESHOP_ORDER_ITEMs on a.ORDER_ID equals b.ORDER_ID
                        join c in db.ESHOP_NEWs on b.NEWS_ID equals c.NEWS_ID
                        where a.ORDER_ID == _id
                        select new
                        {
                            c.NEWS_TITLE,
                            a.ORDER_NAME,
                            a.ORDER_PHONE,
                            a.ORDER_ID,
                            c.NEWS_SEO_URL,
                            c.NEWS_URL,
                            c.NEWS_IMAGE3,
                            a.ORDER_ADDRESS,
                            c.NEWS_ID,
                            c.NEWS_PRICE1,
                            c.NEWS_PRICE2,
                            a.ORDER_CODE,
                            a.ORDER_SHIPPING_FEE,
                            a.ORDER_TOTAL_AMOUNT,
                            a.ORDER_TOTAL_ALL,
                            b.ITEM_QUANTITY,
                            b.ITEM_SUBTOTAL,
                            b.ITEM_PRICE

                        }).OrderByDescending(n => n.ORDER_ID);
            foreach (var i in list)
            {
                Order_entity order = new Order_entity();
                order.NEWS_SEO_URL = i.NEWS_SEO_URL;
                order.NEWS_URL = i.NEWS_URL;
                order.ORDER_NAME = i.ORDER_NAME;
                order.ORDER_PHONE = i.ORDER_PHONE;
                order.NEWS_TITLE = i.NEWS_TITLE;
                order.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                order.NEWS_ID = Utils.CIntDef(i.NEWS_ID);
                order.ORDER_ADDRESS = i.ORDER_ADDRESS;
                order.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                order.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                order.ORDER_CODE = i.ORDER_CODE;
                order.ORDER_SHIPPING_FEE = Utils.CDecDef(i.ORDER_SHIPPING_FEE);
                order.ITEM_PRICE = Utils.CDecDef(i.ITEM_PRICE);
                order.ITEM_SUBTOTAL = Utils.CDecDef(i.ITEM_SUBTOTAL);
                order.ITEM_QUANTITY = Utils.CIntDef(i.ITEM_QUANTITY);
                order.ORDER_TOTAL_AMOUNT = Utils.CDecDef(i.ORDER_TOTAL_AMOUNT);
                order.ORDER_TOTAL_ALL = Utils.CDecDef(i.ORDER_TOTAL_ALL);
                l.Add(order);
            }
            return l.AsQueryable();
        }
        #region Function
        public string getOrderStatus(object obj_status)
        {
            switch (Utils.CIntDef(obj_status))
            {
               
                case 1:
                    return "<font color='red'>Đang xử lý</font>";
                case 2:
                    return "<font color='red'>Đã xác nhận</font>";
                case 3:
                    return "<font color='red'>Đang giao hàng</font>";
                case 4:
                    return "<font color='red'>Giao hàng thành công</font>";
                case 5:
                    return "<font color='red'>Hủy đơn hàng</font>";
                default:
                    return "<font color='red'>Chưa xử lý</font>";
            }

        }
        public string getOrderPayment(object obj_payment)
        {
            switch (Utils.CIntDef(obj_payment))
            {
                case 1:
                    return "Thanh toán bằng tiền mặt";
                case 2:
                    return "Thanh toán bẳng chuyển khoản";
                default:
                    return "Khác";
            }
        }

        public string GetMoney(object obj_value)
        {
            return string.Format("{0:#,#} VNĐ", obj_value).Replace(',', '.');
        }
        public string getPublishDate(object obj_date)
        {
            return string.Format("{0:dd-MM-yyyy hh:mm tt}", obj_date);
        }
        #endregion
    }
}
