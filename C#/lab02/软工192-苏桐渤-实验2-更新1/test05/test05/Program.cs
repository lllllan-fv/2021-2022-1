using System;
using System.Net;

namespace test05
{
    class Program
    {

        static void Main(string[] args)
        {

            String s;

            while (true)
            {
                Console.WriteLine("请输入IP地址:");
                s = Console.ReadLine();

                IPAddress ip;
                if (IPAddress.TryParse(s, out ip))
                {
                    Console.WriteLine("IP地址格式正确!");
                    break;
                }
                else
                {
                    Console.WriteLine("IP地址格式错误!");
                }
            }

            Console.ReadLine();
        }
    }
}
