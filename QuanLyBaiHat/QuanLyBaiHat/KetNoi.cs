using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
namespace QuanLyBaiHat
{
    public class KetNoi
    {
        public static SqlConnection conn = new SqlConnection(@"Data Source=THANHDAT\SQLEXPRESS;Initial Catalog=QuanLyBaiHat;Integrated Security=True");

    }
}
