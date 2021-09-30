using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace test02 {
    public partial class Form1 : Form {
        public Form1() {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e) {

        }

        private void button9_Click(object sender, EventArgs e) {
            button_Click("6");
        }

        private void button10_Click(object sender, EventArgs e) {
            button_Click("-");
        }

        private void button8_Click(object sender, EventArgs e) {
            button_Click("5");
        }

        private void button_Click(String s) {
            if (textBox1.Text == "") {
                textBox1.Text = s;
                return;
            }

            String text = "";

            char last = textBox1.Text[textBox1.Text.Length - 1];
            if (s == "+" || s == "-" || s == "*" || s == "/") {
                if (last == '+' || last == '-' || last == '*' || last == '/') {
                    text = textBox1.Text.Substring(0, textBox1.Text.Length - 1) + s;
                } else {
                    text = textBox1.Text + s;
                }
            } else if (s == ".") {
                if (textBox1.Text[textBox1.Text.Length - 1] < '0' || textBox1.Text[textBox1.Text.Length - 1] > '9') {
                    text = textBox1.Text;
                } else {
                    text = textBox1.Text + s;
                }
            } else {
                text = textBox1.Text + s;
            }     
       
            textBox1.Text = text;
        }

        private void button3_Click(object sender, EventArgs e) {
            button_Click("1");
        }

        private void button4_Click(object sender, EventArgs e) {
            button_Click("2");
        }

        private void button5_Click(object sender, EventArgs e) {
            button_Click("3");
        }

        private void button7_Click(object sender, EventArgs e) {
            button_Click("4");
        }

        private void button11_Click(object sender, EventArgs e) {
            button_Click("7");
        }

        private void button12_Click(object sender, EventArgs e) {
            button_Click("8");
        }

        private void button13_Click(object sender, EventArgs e) {
            button_Click("9");
        }

        private void button6_Click(object sender, EventArgs e) {
            button_Click("+");
        }

        private void button14_Click(object sender, EventArgs e) {
            button_Click("*");
        }

        private void button15_Click(object sender, EventArgs e) {
            button_Click("0");
        }

        private void button17_Click(object sender, EventArgs e) {
            button_Click(".");
        }

        private void button18_Click(object sender, EventArgs e) {
            button_Click("/");
        }

        private void button16_Click(object sender, EventArgs e) {
            DataTable dt = new DataTable();
            textBox1.Text = dt.Compute(textBox1.Text, "").ToString();
        }

        private void button2_Click(object sender, EventArgs e) {
            textBox1.Text = "";
        }

        private void button1_Click(object sender, EventArgs e) {
            if (textBox1.Text.Length > 0) {
                textBox1.Text = textBox1.Text.Substring(0, textBox1.Text.Length - 1);
            }                
        }

        private void button10_Click_1(object sender, EventArgs e) {
            button_Click("-");
        }
    }
}
