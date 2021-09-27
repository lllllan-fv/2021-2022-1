using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test04 {
    class Program {
        static void Main(string[] args) {
            Stack<char> st = new Stack<char>();

            String s = Console.ReadLine();
            char[] left = new char[] { '(', '[', '{' };
            char[] right = new char[] { ')', ']', '}' };

            foreach(char c in s) {
                Boolean isLeft = false;

                for (int i = 0; i < 3; ++i) {
                    if (c == left[i]) {
                        isLeft = true;
                        st.Push(c);
                        break;
                    }
                }

                if (isLeft) continue;

                for (int i = 0; i < 3; ++i) {
                    if (c == right[i]) {
                        if (st.Peek() == left[i]) st.Pop();
                        else st.Push(c);
                        break;
                    }
                }
            }

            Console.WriteLine(st.Count == 0 ? "正确" : "错误");
            Console.ReadLine();
        }
    }
}
