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
    public partial class frmDS_CaSi : Form
    {

        public frmDS_CaSi()
        {
            InitializeComponent();
        }

        SqlConnection conn = new SqlConnection();
        
        private void frmDS_CaSi_Load(object sender, EventArgs e)
        {
            HienThiDatagrid();        
        }

        private void HienThiDatagrid()
        {
            DataSet ds = new DataSet("dsQLCS");
            SqlDataAdapter daCaSi;
            string sQueryCaSi = @"select * from CaSi";
            daCaSi = new SqlDataAdapter(sQueryCaSi, KetNoi.conn);
            daCaSi.Fill(ds, "tblCaSi");
            dgDSCS.DataSource = ds.Tables["tblCaSi"];

            dgDSCS.Columns["macasi"].HeaderText = "Mã Ca Sĩ";
            dgDSCS.Columns["macasi"].Width = 200;

            dgDSCS.Columns["tencasi"].HeaderText = "Tên Ca Sĩ";
            dgDSCS.Columns["tencasi"].Width = 220;

            dgDSCS.Columns["macasi"].Visible = false;
        }

        private void txtTimCS_TextChanged(object sender, EventArgs e)
        {
                string rowfilter = string.Format("{0} like '{1}'", "tencasi", "*" + txtTimCS.Text + "*");
                (dgDSCS.DataSource as DataTable).DefaultView.RowFilter = rowfilter;
        }

        private void dgDSCS_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
            for (int i = 0; i < dgDSCS.Rows.Count; i++)
            {
                if (dgDSCS.Rows[i].Selected)
                {
                    DataSet ds = new DataSet("dsQLBH");
                    DataGridViewRow row = dgDSCS.Rows[i];
                    SqlDataAdapter daBaiHat;

                    string sQueryBaiHat = @"select  bh.mabh, bh.tenbh, bh.loibaihat, cs.tencasi, tl.tentheloai, tg.tentacgia, hd.tenhangdia, al.tenalbum
                    from (BaiHat bh join CaSi cs on bh.macasi=cs.macasi)
                    join TheLoai tl on bh.matheloai=tl.matheloai
                    join TacGia tg on bh.matacgia=tg.matacgia
                    join HangDia hd on bh.mahangdia=hd.mahangdia
                    join Album al on bh.maalbum=al.maalbum
                    where bh.macasi='" + row.Cells[0].Value.ToString() + "'";
                   daBaiHat = new SqlDataAdapter(sQueryBaiHat, KetNoi.conn);
        
                    daBaiHat.Fill(ds, "tblBaiHat");
                    dgDSBH.DataSource = ds.Tables["tblBaiHat"];

                    txtMaCaSi.Text = row.Cells[0].Value.ToString();
                    txtTenCaSi.Text = row.Cells[1].Value.ToString();

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

        public bool kiemtracasi(string cs)
        {
            bool kq = false;
            try
            {
                KetNoi.conn.Open();
                string sql = @"select * from CaSi where macasi ='" + cs + "'";
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
                if (kiemtracasi(txtMaCaSi.Text))
                {
                    DialogResult traloi;
                    traloi = MessageBox.Show("Ca sĩ đã tồn tại!!\nBạn có muốn cập nhật thông tin không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                    if (traloi == DialogResult.OK)
                    {
                        btnSua_Click(sender, e);
                    }
                }
                else
                {
                    string sThemCS = @"insert into CaSi values(@MaCaSi,@TenCaSi)";
                    SqlCommand cmThemCS = new SqlCommand(sThemCS, KetNoi.conn);

                    cmThemCS.Parameters.Add("@MaCaSi", SqlDbType.VarChar).Value = txtMaCaSi.Text;
                    cmThemCS.Parameters.Add("@TenCaSi", SqlDbType.NVarChar).Value = txtTenCaSi.Text;
                   
                    KetNoi.conn.Open();
                    cmThemCS.ExecuteNonQuery();
                    KetNoi.conn.Close();

                    HienThiDatagrid();
                    dgDSCS.RefreshEdit();
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
                string sSuaCS = @"update CaSi set macasi=@MaCaSi,tencasi=@TenCaSi where macasi=@MaCaSi";
                SqlCommand cmSuaCS = new SqlCommand(sSuaCS, KetNoi.conn);
                cmSuaCS.Parameters.Add("@MaAlbum", SqlDbType.VarChar).Value = txtMaCaSi.Text;
                cmSuaCS.Parameters.Add("@TenAlbum", SqlDbType.NVarChar).Value = txtTenCaSi.Text;

                KetNoi.conn.Open();
                cmSuaCS.ExecuteNonQuery();
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
                string sXoaCS = @"delete from CaSi where macasi=@MaCaSi";
                SqlCommand cmXoaCS = new SqlCommand(sXoaCS, KetNoi.conn);
                cmXoaCS.Parameters.Add("@MaCaSi", SqlDbType.VarChar).Value = txtMaCaSi.Text;

                KetNoi.conn.Open();
                cmXoaCS.ExecuteNonQuery();
                KetNoi.conn.Close();

                HienThiDatagrid();
                dgDSCS.RefreshEdit();

                MessageBox.Show("Đã xoá ca sĩ!!!", "Thông báo");
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
