using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    public class Order_entity
    {
        public string ORDER_NAME { get; set; }
        public string ORDER_PHONE { get; set; }
        public string ORDER_ADDRESS { get; set; }
        public int NEWS_ID { get; set; }
        public string NEWS_TITLE { get; set; }
        public string NEWS_IMAGE3 { get; set; }
        public string NEWS_DESC { get; set; }
        public string NEWS_SEO_URL { get; set; }
        public string NEWS_URL { get; set; }
        public string CAT_SEO_URL { get; set; }
        public decimal NEWS_PRICE1 { get; set; }
        public decimal NEWS_PRICE2 { get; set; }
        public decimal ITEM_PRICE { get; set; }
        public decimal ITEM_SUBTOTAL { get; set; }
        public string ORDER_CODE { get; set; }
        public int ITEM_QUANTITY { get; set; }
        public decimal ORDER_SHIPPING_FEE { get; set; }
        public decimal ORDER_TOTAL_AMOUNT { get; set; }
        public decimal ORDER_TOTAL_ALL { get; set; }
    }
}
