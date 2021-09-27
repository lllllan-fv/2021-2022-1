using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test05 {
    class Program {
        static void Main(string[] args) {
            Random rd = new Random();

            int ans = rd.Next(0, 1001);

            int l = 0, r = 1000;
            while (l < r) {
                int mid = (l + r) >> 1;
                Console.WriteLine("the ans is " + mid + " ?");
                if (ans == mid) {
                    Console.WriteLine("true");
                    break;
                } else if (ans < mid) {
                    Console.WriteLine("too large");
                    r = mid - 1;
                } else if (ans > mid) {
                    Console.WriteLine("too small");
                    l = mid + 1;
                }
            }

            Console.ReadLine();
        }
    }
}
