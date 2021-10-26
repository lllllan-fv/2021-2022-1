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

namespace test02 {
    public partial class Form1 : Form {
        public Form1() {
            InitializeComponent(); 
            init();
        }

        public void init() {
            string text = "";
            string[] dirs = Directory.GetFiles("C:");

            foreach(string dir in dirs) {
                text += dir + "\r\n";
            }

            textBox2.Text = text;
        }

        private void button1_Click(object sender, EventArgs e) {
            textBox2.Text = "";

            if (textBox1.Text.Equals("")) init();
            else {
                string text = "";
                string[] dirs = Directory.GetFiles(textBox1.Text);

                foreach (string dir in dirs) {
                    text += dir + "\r\n";
                }

                textBox2.Text = text;
            }
        }
    }
}
