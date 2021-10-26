using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace test01 {
    public partial class Form1 : Form {
        public Form1() {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e) {

            string[] info = Machine.getTestDriveInfo();
            string infos = "";
            for (int i = 0; i < info.Length; ++i) {
                infos = infos + "\n" + info[i];
            }
            this.label1.Text = infos;

            this.label2.Text = "CPU ID: " + Machine.getCpuId();

            this.label3.Text = "IP:" + Machine.getIP();
        }

        private void label2_Click(object sender, EventArgs e) {

        }
    }
}
