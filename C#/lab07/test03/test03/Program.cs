using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace test03 {
    class Program { 

        public void run() { 
            for (int i = 1; i <= 20; ++i) {
                Console.WriteLine("线程" + Thread.CurrentThread.Name + " " + i);
                Thread.Sleep(200);
            }
        }

        static void Main(string[] args) {
            for (int i = 1; i <= 3; ++i) {

                Program p = new Program();
                Thread t = new Thread(new ThreadStart(p.run));
                t.Name = i.ToString();

                if (i == 1) t.Priority = ThreadPriority.Lowest;
                else if (i == 2) t.Priority = ThreadPriority.Normal;
                else t.Priority = ThreadPriority.Highest;

                t.Start();
            }

            Console.ReadLine();
        }
    }
}
