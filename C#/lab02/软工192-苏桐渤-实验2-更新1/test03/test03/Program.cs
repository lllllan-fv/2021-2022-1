using System;

namespace ConsoleApplication1
{
    class test03
    {

        static void Main(string[] args)
        {

            // 日照香炉生紫烟，遥看瀑布挂前川。飞流直下三千尺，疑是银河落九天。
            String s = Console.ReadLine();

            foreach (char c in s)
            {
                Console.Write(c + "\t");
                if (c == '，' || c == '。') Console.WriteLine();
            }

            Console.ReadLine();
        }
    }
}
