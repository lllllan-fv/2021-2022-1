using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test03 {
    class Program {
        static void Main(string[] args) {
            Random rd = new Random();
            int[,] grid = new int[4,4];
            //int[][] grid = new int[4][4];

            for (int i = 0; i < 4; ++i) {
                grid[i, 0] = rd.Next(1000, 1999);
                for (int j = 1; j < 4; ++j) {
                    grid[i, j] = rd.Next(0, 101);
                }
            }

            Console.WriteLine("学号\t高数\t离散\t现代");

            for (int i = 0; i < 4; ++i) {
                for (int j = 0; j < 4; ++j){
                    Console.Write(grid[i, j] + "\t");
                }
                Console.WriteLine();
            }

            Console.ReadLine();
        }
    }
}
