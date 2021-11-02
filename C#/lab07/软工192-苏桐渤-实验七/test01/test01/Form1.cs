using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;

namespace test01 {
    public partial class Form1 : Form {
        private int cnt = 0;
        private Boolean stopFlag = false;
        SynchronizationContext m_SyncContext = null;

        public Form1() {
            InitializeComponent();
            m_SyncContext = SynchronizationContext.Current;
        }

        public void run() {
            int id = ++cnt;
            for (int i = 1; i <= 20; ++i) {
                while (stopFlag) ;
                m_SyncContext.Post(SetTextSafePost, "线程 " + id + ": " + i);
                Thread.Sleep(300);
            }
        }

        private void SetTextSafePost(object text) {
            this.richTextBox1.Text = this.richTextBox1.Text + "\r\n" + text.ToString();
        }

        private void button1_Click(object sender, EventArgs e) {
            Thread t1 = new Thread(new ThreadStart(run));
            t1.Start();

        }

        private void button2_Click(object sender, EventArgs e) {
            stopFlag = true;
        }

        private void button3_Click(object sender, EventArgs e) {
            stopFlag = false;
        }
    }
}
