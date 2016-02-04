using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebServicesManager.Model
{
    public class XLDLRepo
    {
        public static string StrCnn = "data source=(local);initial catalog=esell.vn;persist security info=True;user id=sa;password=123";
        //public static string StrCnn = ConfigurationManager.ConnectionStrings["esell_vnConnectionString"].ConnectionString;
        static SqlConnection Cnn;
        public static DataTable ReadData(string comm)
        {
            DataTable dt = new DataTable();
            try
            {
                if (Cnn == null) Cnn = new SqlConnection(StrCnn);
                SqlDataAdapter da = new SqlDataAdapter(comm, Cnn);
                da.FillSchema(dt, SchemaType.Mapped);
                da.Fill(dt);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return dt;
        }
        public static string DataCommand(string comm)
        {
            try
            {
                if (Cnn == null) Cnn = new SqlConnection(StrCnn);
                if (Cnn.State == ConnectionState.Closed) Cnn.Open();
                SqlCommand cmd = new SqlCommand(comm, Cnn);
                int kq = cmd.ExecuteNonQuery();
                Cnn.Close();
                return "ok";
            }
            catch (SqlException ex)
            {
                return ex.Message;
            }
        }
    }
}