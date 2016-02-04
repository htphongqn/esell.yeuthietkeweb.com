using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using vpro.functions;

namespace vpro.eshop.cpanel.Components
{
    public class formatData
    {
        public string FormatMoney(object Expression)
        {
            try
            {
                string Money = String.Format("{0:0,0 VNĐ}", Expression);
                return Money.Replace(",", ".");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
    }
}