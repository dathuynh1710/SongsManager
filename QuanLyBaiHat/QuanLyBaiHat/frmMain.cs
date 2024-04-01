using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace QuanLyBaiHat
{
    public partial class frmMain : Form
    {      
        private Form activeform;

        public frmMain()
        {
            InitializeComponent();
        }
        
        private void Openchildform(Form childform, object btndenser)
        {
            if (activeform != null)
            {
                activeform.Close();
            }
            activeform = childform;
            childform.TopLevel = false;
            childform.FormBorderStyle = FormBorderStyle.None;
            childform.Dock = DockStyle.Fill;
            this.panelDesktop.Controls.Add(childform);
            this.panelDesktop.Tag = childform;
            childform.BringToFront();
            childform.Show();
            labelTitle.Text = childform.Text;
        }

        private void btnQLBH_Click(object sender, EventArgs e)
        {
            Openchildform(new Forms.frmQL_BaiHat(), sender);
        }
        
        private void btnDSCS_Click(object sender, EventArgs e)
        {
            Openchildform(new Forms.frmDS_CaSi(), sender);
        }

        private void btnDSTL_Click(object sender, EventArgs e)
        {
            Openchildform(new Forms.frmDS_TheLoai(), sender);
        }

        private void btnAlbum_Click(object sender, EventArgs e)
        {
            Openchildform(new Forms.frmDS_Album(), sender);
        }

        private void btnHangDia_Click(object sender, EventArgs e)
        {
            Openchildform(new Forms.frmDS_HangDia(), sender);
        }

        private void btnTacGia_Click(object sender, EventArgs e)
        {
            Openchildform(new Forms.frmDS_TacGia(), sender);
        }

        private void btnLogout_Click(object sender, EventArgs e)
        {
            DialogResult traloi;
            traloi = MessageBox.Show("Bạn có muốn đóng chương trình không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (traloi == DialogResult.OK)
                Application.Exit();
        }

        private void picHome_Click(object sender, EventArgs e)
        {
            frmMain fm = new frmMain();
            fm.Show();
            fm.WindowState = FormWindowState.Maximized;
            this.Hide();
        }
    }
}
