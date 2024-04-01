using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace QuanLyBaiHat.Forms
{
    public partial class frmDS_Album : Form
    {
        public frmDS_Album()
        {
            InitializeComponent();
        }

        SqlConnection conn = new SqlConnection();
        
        private void HienThiDatagrid()
        {
            DataSet ds = new DataSet("dsQLAL");
            SqlDataAdapter daAlbum;

            string sQueryCaSi = @"select * from Album";
            daAlbum = new SqlDataAdapter(sQueryCaSi, KetNoi.conn);
            daAlbum.Fill(ds, "tblAlbum");
            dgDSAL.DataSource = ds.Tables["tblAlbum"];

            dgDSAL.Columns["maalbum"].HeaderText = "Mã Album";
            dgDSAL.Columns["maalbum"].Width = 100;

            dgDSAL.Columns["tenalbum"].HeaderText = "Tên Album";
            dgDSAL.Columns["tenalbum"].Width = 120;

            dgDSAL.Columns["namphathanh"].HeaderText = "Năm phát hành";
            dgDSAL.Columns["namphathanh"].Width = 100;

            dgDSAL.Columns["maalbum"].Visible = false;
        }

        private void txtTimAlbum_TextChanged(object sender, EventArgs e)
        {
            string rowfilter = string.Format("{0} like '{1}'", "tenalbum", "*" + txtTimAlbum.Text + "*");
            (dgDSAL.DataSource as DataTable).DefaultView.RowFilter = rowfilter;
        }

        private void frmDS_Album_Load(object sender, EventArgs e)
        {
            HienThiDatagrid();
        }

        private void dgDSAL_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            for (int i = 0; i < dgDSAL.Rows.Count; i++)
            {
                if (dgDSAL.Rows[i].Selected)
                {
                    DataSet ds = new DataSet("dsQLBH");
                    DataGridViewRow row = dgDSAL.Rows[i];
                    SqlDataAdapter daBaiHat;

                    string sQueryBaiHat = @"select  bh.mabh, bh.tenbh, bh.loibaihat, cs.tencasi, tl.tentheloai, tg.tentacgia, hd.tenhangdia, al.tenalbum
                    from (BaiHat bh join CaSi cs on bh.macasi=cs.macasi)
                    join TheLoai tl on bh.matheloai=tl.matheloai
                    join TacGia tg on bh.matacgia=tg.matacgia
                    join HangDia hd on bh.mahangdia=hd.mahangdia
                    join Album al on bh.maalbum=al.maalbum
                    where bh.maalbum='" + row.Cells[0].Value.ToString() + "'";
                    daBaiHat = new SqlDataAdapter(sQueryBaiHat, KetNoi.conn);

                    daBaiHat.Fill(ds, "tblBaiHat");
                    dgDSBH.DataSource = ds.Tables["tblBaiHat"];

                    txtmaal.Text = row.Cells[0].Value.ToString();
                    txttenal.Text = row.Cells[1].Value.ToString();
                    txtnamph.Text = row.Cells[2].Value.ToString();

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

        public bool kiemtraalbum(string al)
        {
            bool kq = false;
            try
            {
                KetNoi.conn.Open();
                string sql = @"select * from Album where maalbum ='" + al + "'";
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
                if (kiemtraalbum(txtmaal.Text))
                {
                    DialogResult traloi;
                    traloi = MessageBox.Show("Album đã tồn tại!!\nBạn có muốn cập nhật thông tin không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                    if (traloi == DialogResult.OK)
                    {
                        btnSua_Click(sender, e);
                    }
                }
                else
                {
                    string sThemAL = @"insert into Album values(@MaAlbum,@TenAlbum,@NamPhatHanh)";
                    SqlCommand cmThemAL = new SqlCommand(sThemAL, KetNoi.conn);

                    cmThemAL.Parameters.Add("@MaAlbum", SqlDbType.VarChar).Value = txtmaal.Text;
                    cmThemAL.Parameters.Add("@TenAlbum", SqlDbType.NVarChar).Value = txttenal.Text;
                    cmThemAL.Parameters.Add("@NamPhatHanh", SqlDbType.Int).Value = txtnamph.Text;

                    KetNoi.conn.Open();
                    cmThemAL.ExecuteNonQuery();
                    KetNoi.conn.Close();

                    HienThiDatagrid();
                    dgDSAL.RefreshEdit();
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
                string sSuaAL = @"update Album set maalbum=@MaAlbum,tenalbum=@TenAlbum,namphathanh=@NamPhatHanh Where maalbum=@MaAlbum";
                SqlCommand cmSuaAL = new SqlCommand(sSuaAL, KetNoi.conn);
                cmSuaAL.Parameters.Add("@MaAlbum", SqlDbType.VarChar).Value = txtmaal.Text;
                cmSuaAL.Parameters.Add("@TenAlbum", SqlDbType.NVarChar).Value = txttenal.Text;
                cmSuaAL.Parameters.Add("@NamPhatHanh", SqlDbType.Int).Value = txtnamph.Text;

                KetNoi.conn.Open();
                cmSuaAL.ExecuteNonQuery();
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
                string sXoaAL = @"delete from Album where maalbum=@MaAlbum";
                SqlCommand cmXoaAL = new SqlCommand(sXoaAL, KetNoi.conn);
                cmXoaAL.Parameters.Add("@MaAlbum", SqlDbType.VarChar).Value = txtmaal.Text;

                KetNoi.conn.Open();
                cmXoaAL.ExecuteNonQuery();
                KetNoi.conn.Close();

                HienThiDatagrid();
                dgDSAL.RefreshEdit();

                MessageBox.Show("Đã xoá album!!!", "Thông báo");
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
