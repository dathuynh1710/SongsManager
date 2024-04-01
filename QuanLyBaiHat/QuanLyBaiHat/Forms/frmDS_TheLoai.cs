using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
namespace QuanLyBaiHat.Forms
{
    public partial class frmDS_TheLoai : Form
    {
        public frmDS_TheLoai()
        {
            InitializeComponent();
        }

        SqlConnection conn = new SqlConnection();
        
        private void frmDS_TheLoai_Load(object sender, EventArgs e)
        {
            HienThiDatagrid();
        }

        private void HienThiDatagrid()
        {
            DataSet ds = new DataSet("dsQLTL");
            SqlDataAdapter daTheLoai;
            string sQueryTheLoai = @"select * from TheLoai";
            daTheLoai = new SqlDataAdapter(sQueryTheLoai, KetNoi.conn);
            daTheLoai.Fill(ds, "tblTheLoai");
            dgDSTL.DataSource = ds.Tables["tblTheLoai"];
            
            dgDSTL.Columns["matheloai"].HeaderText = "Mã Thể Loại";
            dgDSTL.Columns["matheloai"].Width = 200;

            dgDSTL.Columns["tentheloai"].HeaderText = "Tên Thể Loại";
            dgDSTL.Columns["tentheloai"].Width = 200;

            dgDSTL.Columns["matheloai"].Visible = false;
        }
      
        private void dgDSTL_CellClick(object sender, DataGridViewCellEventArgs e)
        {

            for (int i = 0; i < dgDSTL.Rows.Count; i++)
            {
                if (dgDSTL.Rows[i].Selected)
                {
                    DataSet ds = new DataSet("dsQLBH");
                    DataGridViewRow row = dgDSTL.Rows[i];
                    SqlDataAdapter daBaiHat;

                    string sQueryBaiHat = @"select  bh.mabh, bh.tenbh, bh.loibaihat, cs.tencasi, tl.tentheloai, tg.tentacgia, hd.tenhangdia, al.tenalbum
                    from (BaiHat bh join CaSi cs on bh.macasi=cs.macasi)
                    join TheLoai tl on bh.matheloai=tl.matheloai
                    join TacGia tg on bh.matacgia=tg.matacgia
                    join HangDia hd on bh.mahangdia=hd.mahangdia
                    join Album al on bh.maalbum=al.maalbum
                    where bh.matheloai='" + row.Cells[0].Value.ToString() + "'";
                    daBaiHat = new SqlDataAdapter(sQueryBaiHat, KetNoi.conn);

                    daBaiHat.Fill(ds, "tblBaiHat");
                    dgDSBH.DataSource = ds.Tables["tblBaiHat"];

                    txtmatl.Text = row.Cells[0].Value.ToString();
                    txttentl.Text = row.Cells[1].Value.ToString();

                    dgDSBH.Columns["mabh"].HeaderText = "Mã Bài Hát";
                    dgDSBH.Columns["mabh"].Width = 90;

                    dgDSBH.Columns["tenbh"].HeaderText = "Tên Bài Hát";
                    dgDSBH.Columns["tenbh"].Width = 150;

                    dgDSBH.Columns["loibaihat"].HeaderText = "Lời Bài Hát";
                    dgDSBH.Columns["loibaihat"].Width = 100;

                    dgDSBH.Columns["tencasi"].HeaderText = "Tên Ca Sĩ";
                    dgDSBH.Columns["tencasi"].Width = 150;

                    dgDSBH.Columns["tentheloai"].HeaderText = "Tên Thể Loại";
                    dgDSBH.Columns["tentheloai"].Width = 100;

                    dgDSBH.Columns["tentacgia"].HeaderText = "Tên Tác Giả";
                    dgDSBH.Columns["tentacgia"].Width = 100;

                    dgDSBH.Columns["tenhangdia"].HeaderText = "Tên Hãng Đĩa";
                    dgDSBH.Columns["tenhangdia"].Width = 100;

                    dgDSBH.Columns["tenalbum"].HeaderText = "Tên Album";
                    dgDSBH.Columns["tenalbum"].Width = 100;
                }
            }
        }

        private void txtTimTL_TextChanged(object sender, EventArgs e)
        {
            string rowfilter = string.Format("{0} like '{1}'", "tentheloai", "*" + txtTimTL.Text + "*");
            (dgDSTL.DataSource as DataTable).DefaultView.RowFilter = rowfilter;
        }
        
        public bool kiemtratheloai(string tl)
        {
            bool kq = false;
            try
            {
                KetNoi.conn.Open();
                string sql = @"select * from TheLoai where matheloai ='" + tl + "'";
                SqlCommand cmd = new SqlCommand(sql, KetNoi.conn);
                SqlDataReader dta = cmd.ExecuteReader();
                if (dta.Read() == true)
                    kq = true;
                else
                    kq = false;
                KetNoi.conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return kq;
        }
        
        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (kiemtratheloai(txtmatl.Text))
                {
                    DialogResult traloi;
                    traloi = MessageBox.Show("Thể loại đã tồn tại!!\nBạn có muốn cập nhật thông tin không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                    if (traloi == DialogResult.OK)
                    {
                        btnSua_Click(sender, e);
                    }
                }
                else
                {
                    string sThemTL = @"insert into TheLoai values(@MaTheLoai,@TenTheLoai)";
                    SqlCommand cmThemTL = new SqlCommand(sThemTL, KetNoi.conn);

                    cmThemTL.Parameters.Add("@MaTheLoai", SqlDbType.VarChar).Value = txtmatl.Text;
                    cmThemTL.Parameters.Add("@TenTheLoai", SqlDbType.NVarChar).Value = txttentl.Text;

                    KetNoi.conn.Open();
                    cmThemTL.ExecuteNonQuery();
                    KetNoi.conn.Close();

                    HienThiDatagrid();
                    dgDSTL.RefreshEdit();

                    MessageBox.Show("Đã cập nhật thông tin!!!", "Thông báo");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            DialogResult traloi;
            traloi = MessageBox.Show("Bạn thực sự muốn sửa thông tin?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (traloi == DialogResult.OK)
            {
                string sSuaTL = @"update TheLoai set matheloai=@MaTheLoai,tentheloai=@TenTheloai where matheloai=@MaTheLoai";
                SqlCommand cmSuaTL = new SqlCommand(sSuaTL, KetNoi.conn);
                cmSuaTL.Parameters.Add("@MaTheLoai", SqlDbType.VarChar).Value = txtmatl.Text;
                cmSuaTL.Parameters.Add("@TenTheLoai", SqlDbType.NVarChar).Value = txttentl.Text;

                KetNoi.conn.Open();
                cmSuaTL.ExecuteNonQuery();
                KetNoi.conn.Close();

                HienThiDatagrid();
                MessageBox.Show("Đã cập nhật thông tin!!!", "Thông báo");
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            DialogResult traloi;
            traloi = MessageBox.Show("Bạn thực sự muốn xóa thông tin????", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (traloi == DialogResult.OK)
            {
                string sXoaTL = @"delete from TheLoai where matheloai=@MaTheLoai";
                SqlCommand cmXoaTL = new SqlCommand(sXoaTL, KetNoi.conn);
                cmXoaTL.Parameters.Add("@MaTheLoai", SqlDbType.VarChar).Value = txtmatl.Text;

                KetNoi.conn.Open();
                cmXoaTL.ExecuteNonQuery();
                KetNoi.conn.Close();

                HienThiDatagrid();
                dgDSTL.RefreshEdit();
                
                MessageBox.Show("Đã xoá thể loại!!!", "Thông báo");
            }
        }

        private void btnTroLai_Click(object sender, EventArgs e)
        {
            frmMain fm = new frmMain();
            fm.Show();
            fm.WindowState = FormWindowState.Maximized;
            this.Hide();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
    }
               
}
