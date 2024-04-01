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
    public partial class frmDS_TacGia : Form
    {
        public frmDS_TacGia()
        {
            InitializeComponent();
        }

        SqlConnection conn = new SqlConnection();
        
        private void frmDS_TacGia_Load(object sender, EventArgs e)
        {
            HienThiDatagrid();
        }

        private void HienThiDatagrid()
        {
            DataSet ds = new DataSet("dsQLTG");
            SqlDataAdapter daTacGia;
            string sQueryCaSi = @"select * from TacGia";
            daTacGia = new SqlDataAdapter(sQueryCaSi, KetNoi.conn);
            daTacGia.Fill(ds, "tblTacGia");
            dgDSTG.DataSource = ds.Tables["tblTacGia"];

            dgDSTG.Columns["matacgia"].HeaderText = "Mã tác giả";
            dgDSTG.Columns["matacgia"].Width = 200;

            dgDSTG.Columns["tentacgia"].HeaderText = "Tên tác giả";
            dgDSTG.Columns["tentacgia"].Width = 250;

            dgDSTG.Columns["matacgia"].Visible = false;
        }

        private void txtTimTG_TextChanged(object sender, EventArgs e)
        {
            string rowfilter = string.Format("{0} like '{1}'", "tentacgia", "*" + txtTimTG.Text + "*");
            (dgDSTG.DataSource as DataTable).DefaultView.RowFilter = rowfilter;
        }

        private void dgDSTG_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            for (int i = 0; i < dgDSTG.Rows.Count; i++)
            {
                if (dgDSTG.Rows[i].Selected)
                {
                    DataSet ds = new DataSet("dsQLBH");
                    DataGridViewRow row = dgDSTG.Rows[i];
                    SqlDataAdapter daBaiHat;

                    string sQueryBaiHat = @"select  bh.mabh, bh.tenbh, bh.loibaihat, cs.tencasi, tl.tentheloai, tg.tentacgia, hd.tenhangdia, al.tenalbum
                    from (BaiHat bh join CaSi cs on bh.macasi=cs.macasi)
                    join TheLoai tl on bh.matheloai=tl.matheloai
                    join TacGia tg on bh.matacgia=tg.matacgia
                    join HangDia hd on bh.mahangdia=hd.mahangdia
                    join Album al on bh.maalbum=al.maalbum
                    where bh.matacgia='" + row.Cells[0].Value.ToString() + "'";
                    daBaiHat = new SqlDataAdapter(sQueryBaiHat, KetNoi.conn);

                    daBaiHat.Fill(ds, "tblBaiHat");
                    dgDSBH.DataSource = ds.Tables["tblBaiHat"];

                    txtmatg.Text = row.Cells[0].Value.ToString();
                    txttentg.Text = row.Cells[1].Value.ToString();

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

        public bool kiemtratacgia(string tg)
        {
            bool kq = false;
            try
            {
                KetNoi.conn.Open();
                string sql = @"select * from TacGia where matacgia ='" + tg + "'";
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
                if (kiemtratacgia(txtmatg.Text))
                {
                    DialogResult traloi;
                    traloi = MessageBox.Show("Tác giả đã tồn tại!!\nBạn có muốn cập nhật thông tin không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                    if (traloi == DialogResult.OK)
                    {
                        btnSua_Click(sender, e);
                    }
                }
                else
                {
                    string sThemTG = @"insert into TacGia values(@MaTacGia,@TenTacGia)";
                    SqlCommand cmThemHD = new SqlCommand(sThemTG, KetNoi.conn);

                    cmThemHD.Parameters.Add("@MaTacGia", SqlDbType.VarChar).Value = txtmatg.Text;
                    cmThemHD.Parameters.Add("@TenTacGia", SqlDbType.NVarChar).Value = txttentg.Text;

                    KetNoi.conn.Open();
                    cmThemHD.ExecuteNonQuery();
                    KetNoi.conn.Close();

                    HienThiDatagrid();
                    dgDSTG.RefreshEdit();
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
                string sSuaHD = @"update TacGia set matacgia=@MaTacGia,tentacgia=@TenTacGia where matacgia=@MaTacGia";
                SqlCommand cmSuaHD = new SqlCommand(sSuaHD, KetNoi.conn);
                cmSuaHD.Parameters.Add("@MaTacGia", SqlDbType.VarChar).Value = txtmatg.Text;
                cmSuaHD.Parameters.Add("@TenTacGia", SqlDbType.NVarChar).Value = txttentg.Text;

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
                string sXoaTG = @"delete from TacGia where matacgia=@MaTacGia";
                SqlCommand cmXoaTG = new SqlCommand(sXoaTG, KetNoi.conn);
                cmXoaTG.Parameters.Add("@MaTacGia", SqlDbType.VarChar).Value = txtmatg.Text;

                KetNoi.conn.Open();
                cmXoaTG.ExecuteNonQuery();
                KetNoi.conn.Close();

                HienThiDatagrid();
                dgDSTG.RefreshEdit();

                MessageBox.Show("Đã xoá tác giả!!!", "Thông báo");
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
