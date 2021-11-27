using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace test02
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Paint(object sender, PaintEventArgs e)
        {
            Graphics g = e.Graphics; 
            Pen p = new Pen(Color.Blue, 2);
            
            g.DrawLine(p, 10, 300, 550, 300);
            g.DrawLine(p, 10, 10, 10, 300);

            int[] arr = new int[] { 20, 30, 40, 60, 90, 100, 70, 50, 30, 20};

            for (int i = 0; i < arr.Length; ++i)
            {
                g.DrawRectangle(p, (i + 1) * 50, 300 - arr[i], 25, arr[i]);
            }

            // g.DrawRectangle(p, 10, 10, 100, 100);

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
