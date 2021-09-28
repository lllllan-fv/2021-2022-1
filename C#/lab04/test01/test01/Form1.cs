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
            listBox1.Items.Add("排骨炖白菜");
            listBox1.Items.Add("红烧狮子头");
            listBox1.Items.Add("上海醉蟹");
            listBox1.Items.Add("海带汤");
            listBox1.Items.Add("山峦猪脚");
            listBox1.Items.Add("鸡蛋汤");
            listBox1.Items.Add("炸猪排");

            enbutton();
            
        }

        private void enbutton() {

            if (listBox1.Items.Count == 0) {
                button1.Enabled = false;
            } else {
                button1.Enabled = true;
            }

            if (listBox2.Items.Count == 0) {
                button2.Enabled = false;
            } else {
                button2.Enabled = true;
            }
            
        }

        private void label1_Click(object sender, EventArgs e) {

        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e) {

        }

        private void button1_Click(object sender, EventArgs e) {
            if (listBox1.SelectedIndex >= 0) {
                listBox2.Items.Add(listBox1.SelectedItem);
                listBox1.Items.RemoveAt(listBox1.SelectedIndex);
            }
            enbutton();
        }

        private void button2_Click(object sender, EventArgs e) {
            if (listBox2.SelectedIndex >= 0) {
                listBox1.Items.Add(listBox2.SelectedItem);
                listBox2.Items.RemoveAt(listBox2.SelectedIndex);
            }
            enbutton();
        }
    }
}
