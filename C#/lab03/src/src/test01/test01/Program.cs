using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test01 {
    class Program {
        static void Main(string[] args) {
            String[] name = new String[]{
                "张三", "李四", "王五", "赵六", "孙七", "周八"
            };

            for (int i = 0; i < name.Length; ++i) {
                Console.Write(name[i] + "\t");
            }
            Console.WriteLine();

            Console.WriteLine("将 周八 改名为 吴九");

            name[5] = "吴九";

            for (int i = 0; i < name.Length; ++i) {
                Console.Write(name[i] + "\t");
            }

            Console.ReadLine();
        }
    }
}
