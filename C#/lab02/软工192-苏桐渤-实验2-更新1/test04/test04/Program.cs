using System;

namespace ConsoleApplication1
{
    class test04
    {

        static void Main(string[] args)
        {

            DateTime now = DateTime.Now;

            Console.WriteLine("当前日期为: " + now.ToShortDateString());
            Console.WriteLine("当前日期为: " + now.ToLongDateString());
            Console.WriteLine("当前时间为: " + now.ToShortTimeString());
            Console.WriteLine("当前时间为: " + now.ToLongTimeString());
            Console.WriteLine("当前日期时间为: " + String.Format("{0:f}", now));
            Console.WriteLine("当前日期时间为: " + String.Format("{0:F}", now));
            Console.WriteLine("当前日期时间为: " + String.Format("{0:g}", now));
            Console.WriteLine("当前日期时间为: " + String.Format("{0:G}", now));
            Console.WriteLine("当前月日为: " + String.Format("{0:M}", now));
            Console.WriteLine("当前年月为: " + String.Format("{0:Y}", now));
            Console.WriteLine("当前日期为: " + string.Format("{0:yy年MM月dd日}", now));
            Console.WriteLine("当前日期为: " + now.GetDateTimeFormats('D')[2].ToString());
            Console.WriteLine("当前时间为: " + (now.Hour >= 12 ? "下午" : "上午") + now.ToLongTimeString());

            Console.ReadLine();
        }
    }
}
