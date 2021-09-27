using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test02 {
    class Program {
        static void Main(string[] args) {
            Dictionary<String, String> map = new Dictionary<String, String>();
            map.Add("石家庄", "河北");
            map.Add("唐山", "河北");
            map.Add("太原", "陕西");
            map.Add("大同", "山西");
            map.Add("南京", "江苏");
            map.Add("苏州", "江苏");

            Console.WriteLine("请输入想要查询的省份: ");

            String province = Console.ReadLine();
            Dictionary<String, String>.Enumerator enor = map.GetEnumerator();
            foreach (KeyValuePair<String, String> pair in map) {
                if (province.Equals(pair.Value)) {
                    Console.WriteLine(pair.Key);
                }
            }

            Console.WriteLine("请输入想要查询的城市: ");

            String city = Console.ReadLine();
            map.TryGetValue(city, out province);
            Console.WriteLine(province);

            Console.ReadLine();

        }
    }
}
