using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace QuanLyBaiHat
{
    public partial class FlashScreen : Form
    {
        public FlashScreen()
        {
            InitializeComponent();
        }

        private void time_FlashTick(object sender, EventArgs e)
        { 
            panel2.Width += 30;
            if (panel2.Width >= this.Width)
            {
                time_Flash.Stop();
                frmMain f = new frmMain();
                f.Show();
                f.WindowState = FormWindowState.Maximized;
                this.Hide();
            }      
        }
    }
}
