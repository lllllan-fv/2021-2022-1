using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace test3
{
    public partial class Form1 : Form
    {
        private Point p1, p2;  
        private static bool drawing = false; 

        public Form1()
        {
            InitializeComponent();
        }

        private void pictureBox1_MouseDown(object sender, MouseEventArgs e)
        {
            p1 = new Point(e.X, e.Y);
            p2 = new Point(e.X, e.Y);
            drawing = true;  
        }

        private void pictureBox1_MouseMove(object sender, MouseEventArgs e)
        {
             Graphics g = pictureBox1.CreateGraphics();  
            if(e.Button ==MouseButtons.Left)  
            {  
                if (drawing)  
                {  
                    //drawing = true;  
                    Point currentPoint = new Point(e.X, e.Y);  
                    g.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias; 
                    g.DrawLine(new Pen(Color.Blue, 2),  p2,currentPoint);  
                      
                    p2.X = currentPoint.X;  
                    p2.Y = currentPoint.Y;  
                }  
  
            }   
        }

        private void pictureBox1_MouseUp(object sender, MouseEventArgs e)
        {
            drawing = false;  
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Bitmap bmp = new Bitmap(pictureBox1.Width, pictureBox1.Height);
            pictureBox1.DrawToBitmap(bmp, new Rectangle(0, 0, pictureBox1.Width, pictureBox1.Height));
            bmp.Save("C:\\Users\\student\\Desktop\\123.png", System.Drawing.Imaging.ImageFormat.Png);
        }
         
    }
}
