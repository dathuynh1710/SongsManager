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
    public partial class frmDS_HangDia : Form
    {
        public frmDS_HangDia()
        {
            InitializeComponent();
        }

        SqlConnection conn = new SqlConnection();

        private void frmDS_HangDia_Load(object sender, EventArgs e)
        {
            HienThiDatagrid();
        }

        private void HienThiDatagrid()
        {
            DataSet ds = new DataSet("dsQLHD");
            SqlDataAdapter daHangDia;
            string sQueryCaSi = @"select * from HangDia";
            daHangDia = new SqlDataAdapter(sQueryCaSi, KetNoi.conn);
            daHangDia.Fill(ds, "tblHangDia");
            dgDSHD.DataSource = ds.Tables["tblHangDia"];

            dgDSHD.Columns["mahangdia"].HeaderText = "Mã Hãng Đĩa";
            dgDSHD.Columns["mahangdia"].Width = 200;

            dgDSHD.Columns["tenhangdia"].HeaderText = "Tên Hãng Đĩa";
            dgDSHD.Columns["tenhangdia"].Width = 300;

            dgDSHD.Columns["mahangdia"].Visible = false;
        }

        private void txtTimHD_TextChanged(object sender, EventArgs e)
        {
            string rowfilter = string.Format("{0} like '{1}'", "tenhangdia", "*" + txtTimHD.Text + "*");
            (dgDSHD.DataSource as DataTable).DefaultView.RowFilter = rowfilter;
        }

        private void dgDSHD_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            for (int i = 0; i < dgDSHD.Rows.Count; i++)
            {
                if (dgDSHD.Rows[i].Selected)
                {
                    DataSet ds = new DataSet("dsQLBH");
                    DataGridViewRow row = dgDSHD.Rows[i];
                    SqlDataAdapter daBaiHat;

                    string sQueryBaiHat = @"select  bh.mabh, bh.tenbh, bh.loibaihat, cs.tencasi, tl.tentheloai, tg.tentacgia, hd.tenhangdia, al.tenalbum
                    from (BaiHat bh join CaSi cs on bh.macasi=cs.macasi)
                    join TheLoai tl on bh.matheloai=tl.matheloai
                    join TacGia tg on bh.matacgia=tg.matacgia
                    join HangDia hd on bh.mahangdia=hd.mahangdia
                    join Album al on bh.maalbum=al.maalbum
                    where bh.mahangdia='" + row.Cells[0].Value.ToString() + "'";
                    daBaiHat = new SqlDataAdapter(sQueryBaiHat, KetNoi.conn);

                    daBaiHat.Fill(ds, "tblBaiHat");
                    dgDSBH.DataSource = ds.Tables["tblBaiHat"];

                    txtmahd.Text = row.Cells[0].Value.ToString();
                    txttenhd.Text = row.Cells[1].Value.ToString();
                    
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

        public bool kiemtrahangdia(string hd)
        {
            bool kq = false;
            try
            {
                KetNoi.conn.Open();
                string sql = @"select * from HangDia where mahangdia ='" + hd + "'";
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
                if (kiemtrahangdia(txtmahd.Text))
                {
                    DialogResult traloi;
                    traloi = MessageBox.Show("Hãng đĩa đã tồn tại!!\nBạn có muốn cập nhật thông tin không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                    if (traloi == DialogResult.OK)
                    {
                        btnSua_Click(sender, e);
                    }
                }
                else
                {
                    string sThemHD = @"insert into HangDia values(@MaHangDia,@TenHangDia)";
                    SqlCommand cmThemHD = new SqlCommand(sThemHD, KetNoi.conn);

                    cmThemHD.Parameters.Add("@MaHangDia", SqlDbType.VarChar).Value = txtmahd.Text;
                    cmThemHD.Parameters.Add("@TenHangDia", SqlDbType.NVarChar).Value = txttenhd.Text;

                    KetNoi.conn.Open();
                    cmThemHD.ExecuteNonQuery();
                    KetNoi.conn.Close();

                    HienThiDatagrid();
                    dgDSHD.RefreshEdit();
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
                string sSuaHD = @"update HangDia set mahangdia=@MaHangDia,tenhangdia=@TenHangDia where mahangdia=@MaHangDia";
                SqlCommand cmSuaHD = new SqlCommand(sSuaHD, KetNoi.conn);
                cmSuaHD.Parameters.Add("@MaHangDia", SqlDbType.VarChar).Value = txtmahd.Text;
                cmSuaHD.Parameters.Add("@TenHangDia", SqlDbType.NVarChar).Value = txttenhd.Text;

                KetNoi.conn.Open();
                cmSuaHD.ExecuteNonQuery();
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
                string sXoaHD = @"delete from HangDia where mahangdia=@MaHangDia";
                SqlCommand cmXoaHD = new SqlCommand(sXoaHD, KetNoi.conn);
                cmXoaHD.Parameters.Add("@MaHangDia", SqlDbType.VarChar).Value = txtmahd.Text;

                KetNoi.conn.Open();
                cmXoaHD.ExecuteNonQuery();
                KetNoi.conn.Close();

                HienThiDatagrid();
                dgDSHD.RefreshEdit();

                MessageBox.Show("Đã xoá hãng đĩa!!!", "Thông báo");
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
