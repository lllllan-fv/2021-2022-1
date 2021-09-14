using System;

namespace ConsoleApplication1
{
    class test01
    {
        static void Main(string[] args)
        {
            String str = Console.ReadLine();

            foreach (char c in str)
            {
                Console.Write(c + ":");

                if (char.IsUpper(c))
                {
                    Console.WriteLine("大写字符");
                }
                else if (char.IsLower(c))
                {
                    Console.WriteLine("小写字符");
                }
                else if (char.IsDigit(c))
                {
                    Console.WriteLine("数字");
                }
                else
                {
                    Console.WriteLine("其他符号");
                }
            }

            Console.ReadLine();
        }
    }
}
