using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test02 {
    class Program {
        static void Main(string[] args) {
            Triangle tri = new Triangle(new Point(1.0, 1.0), new Point(2.0, 3.0), new Point(4.0, 5.0));

            Console.WriteLine("周长  " + tri.getLength());
            Console.WriteLine("面积  " + tri.getArea());
            Console.WriteLine("重心  " + (tri.getCore().x + "," + tri.getCore().y));

            Console.ReadLine();
        }
    }
}
