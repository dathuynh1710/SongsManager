
namespace QuanLyBaiHat
{
    partial class frmMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(frmMain));
            this.panel_Left = new System.Windows.Forms.Panel();
            this.btnHangDia = new System.Windows.Forms.Button();
            this.btnTacGia = new System.Windows.Forms.Button();
            this.btnLogout = new System.Windows.Forms.Button();
            this.btnAlbum = new System.Windows.Forms.Button();
            this.btnDSTL = new System.Windows.Forms.Button();
            this.btnDSCS = new System.Windows.Forms.Button();
            this.btnQLBH = new System.Windows.Forms.Button();
            this.picHome = new System.Windows.Forms.PictureBox();
            this.labelTitle = new System.Windows.Forms.Label();
            this.panel_Top = new System.Windows.Forms.Panel();
            this.panelDesktop = new System.Windows.Forms.Panel();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.panel_Left.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picHome)).BeginInit();
            this.panel_Top.SuspendLayout();
            this.panelDesktop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // panel_Left
            // 
            this.panel_Left.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(51)))), ((int)(((byte)(76)))));
            this.panel_Left.Controls.Add(this.btnHangDia);
            this.panel_Left.Controls.Add(this.btnTacGia);
            this.panel_Left.Controls.Add(this.btnLogout);
            this.panel_Left.Controls.Add(this.btnAlbum);
            this.panel_Left.Controls.Add(this.btnDSTL);
            this.panel_Left.Controls.Add(this.btnDSCS);
            this.panel_Left.Controls.Add(this.btnQLBH);
            this.panel_Left.Controls.Add(this.picHome);
            this.panel_Left.Dock = System.Windows.Forms.DockStyle.Left;
            this.panel_Left.Location = new System.Drawing.Point(0, 0);
            this.panel_Left.Name = "panel_Left";
            this.panel_Left.Size = new System.Drawing.Size(500, 1600);
            this.panel_Left.TabIndex = 7;
            // 
            // btnHangDia
            // 
            this.btnHangDia.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnHangDia.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnHangDia.Font = new System.Drawing.Font("Mongolian Baiti", 11.1F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point);
            this.btnHangDia.ForeColor = System.Drawing.Color.Gainsboro;
            this.btnHangDia.Image = global::QuanLyBaiHat.Properties.Resources.icon_recorlabel;
            this.btnHangDia.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnHangDia.Location = new System.Drawing.Point(0, 1157);
            this.btnHangDia.Name = "btnHangDia";
            this.btnHangDia.Size = new System.Drawing.Size(500, 200);
            this.btnHangDia.TabIndex = 18;
            this.btnHangDia.Text = "Danh sách hãng đĩa";
            this.btnHangDia.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnHangDia.UseVisualStyleBackColor = true;
            this.btnHangDia.Click += new System.EventHandler(this.btnHangDia_Click);
            // 
            // btnTacGia
            // 
            this.btnTacGia.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnTacGia.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTacGia.Font = new System.Drawing.Font("Mongolian Baiti", 11.1F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point);
            this.btnTacGia.ForeColor = System.Drawing.Color.Gainsboro;
            this.btnTacGia.Image = global::QuanLyBaiHat.Properties.Resources.icon_songwrite;
            this.btnTacGia.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnTacGia.Location = new System.Drawing.Point(0, 957);
            this.btnTacGia.Name = "btnTacGia";
            this.btnTacGia.Size = new System.Drawing.Size(500, 200);
            this.btnTacGia.TabIndex = 17;
            this.btnTacGia.Text = "Danh sách tác giả";
            this.btnTacGia.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnTacGia.UseVisualStyleBackColor = true;
            this.btnTacGia.Click += new System.EventHandler(this.btnTacGia_Click);
            // 
            // btnLogout
            // 
            this.btnLogout.BackColor = System.Drawing.Color.LightSeaGreen;
            this.btnLogout.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.btnLogout.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.btnLogout.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(128)))));
            this.btnLogout.Location = new System.Drawing.Point(0, 1493);
            this.btnLogout.Name = "btnLogout";
            this.btnLogout.Size = new System.Drawing.Size(500, 107);
            this.btnLogout.TabIndex = 16;
            this.btnLogout.Text = "Thoát";
            this.btnLogout.UseVisualStyleBackColor = false;
            this.btnLogout.Click += new System.EventHandler(this.btnLogout_Click);
            // 
            // btnAlbum
            // 
            this.btnAlbum.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnAlbum.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAlbum.Font = new System.Drawing.Font("Mongolian Baiti", 11.1F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point);
            this.btnAlbum.ForeColor = System.Drawing.Color.Gainsboro;
            this.btnAlbum.Image = global::QuanLyBaiHat.Properties.Resources.icon_album;
            this.btnAlbum.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnAlbum.Location = new System.Drawing.Point(0, 757);
            this.btnAlbum.Name = "btnAlbum";
            this.btnAlbum.Size = new System.Drawing.Size(500, 200);
            this.btnAlbum.TabIndex = 15;
            this.btnAlbum.Text = "Danh sách album";
            this.btnAlbum.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnAlbum.UseVisualStyleBackColor = true;
            this.btnAlbum.Click += new System.EventHandler(this.btnAlbum_Click);
            // 
            // btnDSTL
            // 
            this.btnDSTL.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnDSTL.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDSTL.Font = new System.Drawing.Font("Mongolian Baiti", 11.1F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point);
            this.btnDSTL.ForeColor = System.Drawing.Color.Gainsboro;
            this.btnDSTL.Image = global::QuanLyBaiHat.Properties.Resources.icon_genre;
            this.btnDSTL.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnDSTL.Location = new System.Drawing.Point(0, 557);
            this.btnDSTL.Name = "btnDSTL";
            this.btnDSTL.Size = new System.Drawing.Size(500, 200);
            this.btnDSTL.TabIndex = 15;
            this.btnDSTL.Text = "Danh sách thể loại";
            this.btnDSTL.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnDSTL.UseVisualStyleBackColor = true;
            this.btnDSTL.Click += new System.EventHandler(this.btnDSTL_Click);
            // 
            // btnDSCS
            // 
            this.btnDSCS.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnDSCS.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnDSCS.Font = new System.Drawing.Font("Mongolian Baiti", 11.1F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point);
            this.btnDSCS.ForeColor = System.Drawing.Color.Gainsboro;
            this.btnDSCS.Image = global::QuanLyBaiHat.Properties.Resources.icon_singer;
            this.btnDSCS.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnDSCS.Location = new System.Drawing.Point(0, 357);
            this.btnDSCS.Name = "btnDSCS";
            this.btnDSCS.Size = new System.Drawing.Size(500, 200);
            this.btnDSCS.TabIndex = 15;
            this.btnDSCS.Text = "Danh sách ca sĩ";
            this.btnDSCS.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnDSCS.UseVisualStyleBackColor = true;
            this.btnDSCS.Click += new System.EventHandler(this.btnDSCS_Click);
            // 
            // btnQLBH
            // 
            this.btnQLBH.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnQLBH.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnQLBH.Font = new System.Drawing.Font("Mongolian Baiti", 11.1F, System.Drawing.FontStyle.Italic, System.Drawing.GraphicsUnit.Point);
            this.btnQLBH.ForeColor = System.Drawing.Color.Gainsboro;
            this.btnQLBH.Image = global::QuanLyBaiHat.Properties.Resources.icon_song;
            this.btnQLBH.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnQLBH.Location = new System.Drawing.Point(0, 157);
            this.btnQLBH.Name = "btnQLBH";
            this.btnQLBH.Size = new System.Drawing.Size(500, 200);
            this.btnQLBH.TabIndex = 15;
            this.btnQLBH.Text = "Quản lý bài hát";
            this.btnQLBH.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            this.btnQLBH.UseVisualStyleBackColor = true;
            this.btnQLBH.Click += new System.EventHandler(this.btnQLBH_Click);
            // 
            // picHome
            // 
            this.picHome.BackColor = System.Drawing.Color.Teal;
            this.picHome.Cursor = System.Windows.Forms.Cursors.Hand;
            this.picHome.Dock = System.Windows.Forms.DockStyle.Top;
            this.picHome.Image = ((System.Drawing.Image)(resources.GetObject("picHome.Image")));
            this.picHome.Location = new System.Drawing.Point(0, 0);
            this.picHome.Name = "picHome";
            this.picHome.Size = new System.Drawing.Size(500, 157);
            this.picHome.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.picHome.TabIndex = 0;
            this.picHome.TabStop = false;
            this.picHome.Click += new System.EventHandler(this.picHome_Click);
            // 
            // labelTitle
            // 
            this.labelTitle.Anchor = System.Windows.Forms.AnchorStyles.None;
            this.labelTitle.AutoSize = true;
            this.labelTitle.Font = new System.Drawing.Font("Tahoma", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.labelTitle.ForeColor = System.Drawing.Color.PaleTurquoise;
            this.labelTitle.Location = new System.Drawing.Point(646, 39);
            this.labelTitle.Name = "labelTitle";
            this.labelTitle.Size = new System.Drawing.Size(285, 97);
            this.labelTitle.TabIndex = 6;
            this.labelTitle.Text = "HOME";
            this.labelTitle.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // panel_Top
            // 
            this.panel_Top.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(51)))), ((int)(((byte)(51)))), ((int)(((byte)(76)))));
            this.panel_Top.Controls.Add(this.labelTitle);
            this.panel_Top.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel_Top.Location = new System.Drawing.Point(500, 0);
            this.panel_Top.Name = "panel_Top";
            this.panel_Top.Size = new System.Drawing.Size(1786, 157);
            this.panel_Top.TabIndex = 14;
            // 
            // panelDesktop
            // 
            this.panelDesktop.Controls.Add(this.pictureBox1);
            this.panelDesktop.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelDesktop.Location = new System.Drawing.Point(500, 157);
            this.panelDesktop.Name = "panelDesktop";
            this.panelDesktop.Size = new System.Drawing.Size(1786, 1443);
            this.panelDesktop.TabIndex = 16;
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.Color.DarkSlateBlue;
            this.pictureBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pictureBox1.Image = global::QuanLyBaiHat.Properties.Resources.DKD_Music__3_;
            this.pictureBox1.Location = new System.Drawing.Point(0, 0);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(1786, 1443);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // frmMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(17F, 41F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ButtonHighlight;
            this.ClientSize = new System.Drawing.Size(2286, 1600);
            this.Controls.Add(this.panelDesktop);
            this.Controls.Add(this.panel_Top);
            this.Controls.Add(this.panel_Left);
            this.Name = "frmMain";
            this.Text = "frmMain";
            this.panel_Left.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.picHome)).EndInit();
            this.panel_Top.ResumeLayout(false);
            this.panel_Top.PerformLayout();
            this.panelDesktop.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Panel panel_Left;
        private System.Windows.Forms.Button btnLogout;
        private System.Windows.Forms.Button btnAlbum;
        private System.Windows.Forms.Button btnDSTL;
        private System.Windows.Forms.Button btnDSCS;
        private System.Windows.Forms.Button btnQLBH;
        private System.Windows.Forms.Label labelTitle;
        private System.Windows.Forms.Panel panel_Top;
        private System.Windows.Forms.Button btnTacGia;
        private System.Windows.Forms.Panel panelDesktop;
        private System.Windows.Forms.PictureBox picHome;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Button btnHangDia;
    }
}