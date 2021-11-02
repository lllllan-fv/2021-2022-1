using System;
using System.Collections.Generic;
using System.Threading;

namespace test04
{
    class Program
    {

        List<ManualResetEvent> manualEvents = new List<ManualResetEvent>();
        public void threadA()
        {
            for (int i = 1; i <= 10; ++i)
            {

                int sz = new Random().Next(1, 5);
                for (int j = 1; j <= sz; ++j)
                {
                    ManualResetEvent mre = new ManualResetEvent(false);
                    manualEvents.Add(mre);
                    ThreadPool.QueueUserWorkItem(threadB, mre);
                }

                WaitHandle.WaitAll(manualEvents.ToArray());
                Console.WriteLine("ThreadA Finished!" + i);
            }
        }

        private void threadB(object state)
        {
            Thread.Sleep(new Random().Next(100, 300));

            ManualResetEvent mre = (ManualResetEvent) state;
            mre.Set();
            Console.WriteLine("子线程" + new Random().Next(100));
        }

        static void Main(string[] args)
        {
            Program p = new Program();
            Thread t = new Thread(new ThreadStart(p.threadA));
            t.Start();
        }
    }
}
