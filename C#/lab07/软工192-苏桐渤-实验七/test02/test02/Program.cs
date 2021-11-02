using System;
using System.Threading;

namespace test02
{
    class Program
    {

        public void run()
        {
            Console.WriteLine("线程标识符：" + Thread.CurrentThread.ManagedThreadId);
            Console.WriteLine("线程名：" + Thread.CurrentThread.Name);
            Console.WriteLine("线程状态：" + Thread.CurrentThread.ThreadState);
            Console.WriteLine("线程优先级：" + Thread.CurrentThread.Priority); 
        }
        static void Main(string[] args)
        {
            Program p = new Program();
            Thread t = new Thread(new ThreadStart(p.run));
            t.Name = "wahaha";

            t.Start();
        }
    }
}
