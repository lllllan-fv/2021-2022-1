using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace test03 {
    public partial class Form1 : Form {
        public Form1() {
            InitializeComponent();

            string path = "D:\\file";
            string path1 = "D:\\file1";
            Directory.CreateDirectory(path);
            Directory.CreateDirectory(path1);

            comboBox1.Items.Add(".txt");
            comboBox1.Items.Add(".exe");
            comboBox1.SelectedIndex = 0;

            showDirect();
        }

        public void showDirect() {
            textBox2.Text = "";

            string text = "";
            string[] dirs = Directory.GetFiles("D:\\file");
            foreach (string dir in dirs) {
                text += dir + "\r\n";
            }
            textBox2.Text = text;
        }

        private void button1_Click(object sender, EventArgs e) {
            string pre = textBox1.Text;
            string suf = comboBox1.SelectedItem.ToString();
            string path = "D:\\file\\" + pre + suf;

            if (!pre.Equals("") && !File.Exists(path)) {
                File.Create(path);
            }

            showDirect();
        }

        private void Form1_Load(object sender, EventArgs e) {
        }

        private void button2_Click(object sender, EventArgs e) {
            string pre = textBox1.Text;
            string suf = comboBox1.SelectedItem.ToString();
            string path = "D:\\file\\" + pre + suf;

            if (!pre.Equals("")) {
                File.Delete(path);
            }

            showDirect();
        }

        private void button3_Click(object sender, EventArgs e) {
            string pre = textBox1.Text;
            string suf = comboBox1.SelectedItem.ToString();
            string path = "D:\\file\\" + pre + suf;

            if (!pre.Equals("") && File.Exists(path)) {
                Directory.Move(path, "D:\\file1\\" + pre + suf);
            }

            showDirect();
        }

        private void button4_Click(object sender, EventArgs e) {

        }

    }
}
