using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;
namespace QuanLyBaiHat.Forms
{
    public partial class frmQL_BaiHat : Form
    {
        public frmQL_BaiHat()
        {
            InitializeComponent();
        }

        SqlConnection conn = new SqlConnection();
        
        private void frmQL_BaiHat_Load(object sender, EventArgs e)
        { 
            HienThiDatagrid();
            comboboxCaSi();
            comboboxTheLoai();
            comboboxTacGia();
            comboboxAlbum();
            comboboxHangDia();
            visible_tt();
        }

        public void visible_tt()
        {
            txtMaBH.Text = "";
            txtLoiBH.Text = "";
            txtTenBH.Text = "";
            cbAlbum.Text = "";
            cbCaSi.Text = "";
            cbHangDia.Text = "";
            cbTacGia.Text = "";
            cbTheLoai.Text = "";
        }

        private void HienThiDatagrid()
        {
            DataSet ds = new DataSet("dsQLBH");
            SqlDataAdapter daBaiHat;

            string sQueryBaiHat = @"select  bh.mabh, bh.tenbh, bh.loibaihat, cs.tencasi, tl.tentheloai, tg.tentacgia, hd.tenhangdia, al.tenalbum
                from (BaiHat bh join CaSi cs on bh.macasi=cs.macasi)
                join TheLoai tl on bh.matheloai=tl.matheloai
                join TacGia tg on bh.matacgia=tg.matacgia
                join HangDia hd on bh.mahangdia=hd.mahangdia
                join Album al on bh.maalbum=al.maalbum";
            daBaiHat = new SqlDataAdapter(sQueryBaiHat, KetNoi.conn);
            daBaiHat.Fill(ds, "tblBaiHat");
            dgDSBH.Refresh();
            dgDSBH.DataSource = ds.Tables["tblBaiHat"];
          
            dgDSBH.Columns["mabh"].HeaderText = "Mã Bài Hát";
            dgDSBH.Columns["mabh"].Width = 100;

            dgDSBH.Columns["tenbh"].HeaderText = "Tên Bài Hát";
            dgDSBH.Columns["tenbh"].Width = 200;

            dgDSBH.Columns["loibaihat"].HeaderText = "Lời Bài Hát";
            dgDSBH.Columns["loibaihat"].Width = 200;

            dgDSBH.Columns["tencasi"].HeaderText = "Tên Ca Sĩ";
            dgDSBH.Columns["tencasi"].Width = 200;

            dgDSBH.Columns["tentheloai"].HeaderText = "Tên Thể Loại";
            dgDSBH.Columns["tentheloai"].Width = 100;

            dgDSBH.Columns["tentacgia"].HeaderText = "Tên Tác Giả";
            dgDSBH.Columns["tentacgia"].Width = 100;

            dgDSBH.Columns["tenhangdia"].HeaderText = "Tên Hãng Đĩa";
            dgDSBH.Columns["tenhangdia"].Width = 150;

            dgDSBH.Columns["tenalbum"].HeaderText = "Tên Album";
            dgDSBH.Columns["tenalbum"].Width = 200;

        }

        public void comboboxCaSi()
        {
            DataSet dscs = new DataSet("QuanLyBaiHat");
            string sQueryCaSi = @"select * from CaSi";
            SqlDataAdapter daCaSi = new SqlDataAdapter(sQueryCaSi, KetNoi.conn);
            daCaSi.Fill(dscs, "tblDSCaSi");
            cbCaSi.DataSource = dscs.Tables["tblDSCaSi"];
            cbCaSi.DisplayMember = "tencasi";
            cbCaSi.ValueMember = "macasi";
        }

        public void comboboxTheLoai() 
        {
            DataSet dstl = new DataSet("QuanLyBaiHat");
            string sQueryTheLoai = @"select * from TheLoai";
            SqlDataAdapter daTheLoai = new SqlDataAdapter(sQueryTheLoai, KetNoi.conn);
            daTheLoai.Fill(dstl, "tblDSTheLoai");
            cbTheLoai.DataSource = dstl.Tables["tblDSTheLoai"];
            cbTheLoai.DisplayMember = "tentheloai";
            cbTheLoai.ValueMember = "matheloai";
        }

        public void comboboxTacGia()
        {
            DataSet dstg = new DataSet("QuanLyBaiHat");
            string sQueryTacGia = @"select * from TacGia";
            SqlDataAdapter daTacGia = new SqlDataAdapter(sQueryTacGia, KetNoi.conn);
            daTacGia.Fill(dstg, "tblDSTacGia");
            cbTacGia.DataSource = dstg.Tables["tblDSTacGia"];
            cbTacGia.DisplayMember = "tentacgia";
            cbTacGia.ValueMember = "matacgia";
        }

        public void comboboxHangDia()
        {
            DataSet dshd = new DataSet("QuanLyBaiHat");
            string sQueryHangDia = @"select * from HangDia";
            SqlDataAdapter daHangDia = new SqlDataAdapter(sQueryHangDia, KetNoi.conn);
            daHangDia.Fill(dshd, "tblDSHangDia");
            cbHangDia.DataSource = dshd.Tables["tblDSHangDia"];
            cbHangDia.DisplayMember = "tenhangdia";
            cbHangDia.ValueMember = "mahangdia";
        }

        public void comboboxAlbum()
        {
            DataSet dsal = new DataSet("QuanLyBaiHat");
            string sQueryAlbum = @"select * from Album";
            SqlDataAdapter daAlbum  = new SqlDataAdapter(sQueryAlbum, KetNoi.conn);
            daAlbum.Fill(dsal, "tblDSAlbum");
            cbAlbum.DataSource = dsal.Tables["tblDSAlbum"];
            cbAlbum.DisplayMember = "tenalbum";
            cbAlbum.ValueMember = "maalbum";
        }

        private void dgDSBH_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            for (int i = 0; i < dgDSBH.Rows.Count; i++)
            {
                if (dgDSBH.Rows[i].Selected)
                {
                    DataGridViewRow row = dgDSBH.Rows[i];
                    txtMaBH.Text = row.Cells[0].Value.ToString();
                    txtTenBH.Text = row.Cells[1].Value.ToString();
                    txtLoiBH.Text = row.Cells[2].Value.ToString();
                    cbCaSi.Text = row.Cells[3].Value.ToString();
                    cbTheLoai.Text = row.Cells[4].Value.ToString();
                    cbTacGia.Text = row.Cells[5].Value.ToString();
                    cbHangDia.Text = row.Cells[6].Value.ToString();
                    cbAlbum.Text = row.Cells[7].Value.ToString();
                }
            }
        }

        public bool kiemtrabh(string bh)
        {
            bool kq = false;
            try
            {
                KetNoi.conn.Open();
                string sql = @"select * from BaiHat where mabh='" + bh + "'";
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
                if (kiemtrabh(txtMaBH.Text))
                {
                    DialogResult traloi;
                    traloi = MessageBox.Show("Bài hát đã tồn tại!!\n Bạn có muốn cập nhật thông tin không", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                    if (traloi == DialogResult.OK)
                    {
                        btnSua_Click(sender, e);
                    }
                }
                else
                {                   
                    string sThemBH = @"insert into BaiHat values(@MaBH,@TenBaiHat,@LoiBaiHat,@MaCaSi,@MaTheLoai,@MaTacGia,@MaHangDia,@MaAlbum)";
                    SqlCommand cmThemBH = new SqlCommand(sThemBH, KetNoi.conn);
                    
                    cmThemBH.Parameters.Add("@MaBH", SqlDbType.VarChar).Value = txtMaBH.Text;
                    cmThemBH.Parameters.Add("@TenBaiHat", SqlDbType.NVarChar).Value = txtTenBH.Text;
                    cmThemBH.Parameters.Add("@LoiBaiHat", SqlDbType.NText).Value = txtLoiBH.Text;
                    cmThemBH.Parameters.Add("@MaCaSi", SqlDbType.VarChar).Value = cbCaSi.SelectedValue.ToString();
                    cmThemBH.Parameters.Add("@MaTheLoai", SqlDbType.VarChar).Value = cbTheLoai.SelectedValue.ToString();
                    cmThemBH.Parameters.Add("@MaTacGia", SqlDbType.VarChar).Value = cbTacGia.SelectedValue.ToString();
                    cmThemBH.Parameters.Add("@MaHangDia", SqlDbType.VarChar).Value = cbHangDia.SelectedValue.ToString();
                    cmThemBH.Parameters.Add("@MaAlbum", SqlDbType.VarChar).Value = cbAlbum.SelectedValue.ToString();

                    KetNoi.conn.Open();
                    cmThemBH.ExecuteNonQuery();
                    KetNoi.conn.Close();

                    HienThiDatagrid();
                    dgDSBH.RefreshEdit();
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
                string sSuaBH = @"update BaiHat set tenbh=@TenBaiHat,loibaihat=@LoiBaiHat,macasi=@MaCaSi,matheloai=@MaTheLoai,matacgia=@MaTacGia,mahangdia=@MaHangDia,maalbum=@MaAlbum Where mabh=@MaBH";
                SqlCommand cmSuaBH = new SqlCommand(sSuaBH, KetNoi.conn);
                cmSuaBH.Parameters.Add("@MaBH", SqlDbType.VarChar).Value = txtMaBH.Text;
                cmSuaBH.Parameters.Add("@TenBaiHat", SqlDbType.NVarChar).Value = txtTenBH.Text;
                cmSuaBH.Parameters.Add("@LoiBaiHat", SqlDbType.NVarChar).Value = txtLoiBH.Text;
                cmSuaBH.Parameters.Add("@MaCaSi", SqlDbType.VarChar).Value = cbCaSi.SelectedValue.ToString();
                cmSuaBH.Parameters.Add("@MaTheLoai", SqlDbType.VarChar).Value = cbTheLoai.SelectedValue.ToString();
                cmSuaBH.Parameters.Add("@MaTacGia", SqlDbType.VarChar).Value = cbTacGia.SelectedValue.ToString();
                cmSuaBH.Parameters.Add("@MaHangDia", SqlDbType.VarChar).Value = cbHangDia.SelectedValue.ToString();
                cmSuaBH.Parameters.Add("@MaAlbum", SqlDbType.VarChar).Value = cbAlbum.SelectedValue.ToString();

                KetNoi.conn.Open();
                cmSuaBH.ExecuteNonQuery();
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
                string sXoaBaiHat = @"delete from BaiHat where mabh=@MaBH";
                SqlCommand cmXoaBaiHat = new SqlCommand(sXoaBaiHat, KetNoi.conn);
                cmXoaBaiHat.Parameters.Add("@MaBH", SqlDbType.VarChar).Value = txtMaBH.Text;

                KetNoi.conn.Open();
                cmXoaBaiHat.ExecuteNonQuery();
                KetNoi.conn.Close();

                HienThiDatagrid();
                dgDSBH.RefreshEdit();

                MessageBox.Show("Đã xoá bài hát!!!", "Thông báo");
            }
        }

        private void btnLamMoi_Click(object sender, EventArgs e)
        {
            DialogResult traloi;
            traloi = MessageBox.Show("Bạn có muốn làm mới thông tin?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (traloi == DialogResult.OK)
            {
                visible_tt();
            }
        }
    }
}
