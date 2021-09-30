using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace test03
{
    public partial class Form1 : Form
    {

        DateTime before;

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button1_MouseDown(object sender, MouseEventArgs e)
        {
            before = System.DateTime.Now;
        }

        private void button1_MouseEnter(object sender, EventArgs e)
        {
        }

        private void button1_MouseUp(object sender, MouseEventArgs e)
        {
            TimeSpan d = System.DateTime.Now - before;
            if (d.Seconds > 5)
            {
                Form2 form2 = new Form2();
                form2.ShowDialog();
            }
        }
    }
}
