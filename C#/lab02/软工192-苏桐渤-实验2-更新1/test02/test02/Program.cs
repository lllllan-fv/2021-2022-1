using System;

namespace ConsoleApplication1
{
    class test02
    {

        static void Main(string[] args)
        {
            DateTime beforeDT = System.DateTime.Now;

            const int maxn = (int)1e5;

            int tot = 0;
            int[] vis = new int[maxn + 10];

            for (int i = 2; i <= maxn; ++i)
            {
                if (vis[i] == 1) continue;

                tot += 1;
                for (int j = 2 * i; j <= maxn; j += i)
                {
                    vis[j] = 1;
                }
            }

            Console.WriteLine(tot);

            DateTime afterDT = System.DateTime.Now;
            TimeSpan ts = afterDT.Subtract(beforeDT);
            Console.WriteLine("{0}ms", ts.TotalMilliseconds);

            Console.ReadLine();
        }
    }
}
