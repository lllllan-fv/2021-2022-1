using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace test2
{
    public partial class Form1 : Form
    {
        private int time_clock;
        private int ans;

        public Form1()
        {
            InitializeComponent();
            button2.Enabled = false;
            button3.Enabled = false;
        }        

        private void button1_Click(object sender, EventArgs e)
        {
            time_clock = 600;
            timer1.Start();
            ans = new Random().Next(1, 1000);
            label3.Text = "";
            textBox3.Text = "";
            button2.Enabled = true;
            button3.Enabled = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int guess = int.Parse(textBox2.Text);

            if (guess == ans)
            {
                radioButton1.Checked = false;
                radioButton2.Checked = false;
                radioButton3.Checked = true;

                timer1.Stop();
                textBox3.Text = "" + ans;
                label3.Text = "游戏用时：" + (600 - time_clock) / 10;
                button2.Enabled = false;
                button3.Enabled = true;
            }
            else if (guess < ans)
            {
                radioButton1.Checked = true;
                radioButton2.Checked = false;
                radioButton3.Checked = false;
            }
            else
            {
                radioButton1.Checked = false;
                radioButton2.Checked = true; ;
                radioButton3.Checked = false;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            textBox3.Text = "" + ans;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            textBox1.Text = "" + (time_clock-- / 10);
            if (time_clock == 0)
            {
                timer1.Stop();
                button2.Enabled = false;
                button3.Enabled = true;
            }
        }

        private void textBox2_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(Char.IsNumber(e.KeyChar)) && e.KeyChar != (char)13 && e.KeyChar != (char)8)
            {
                e.Handled = true;
            }
        }
    }
}
