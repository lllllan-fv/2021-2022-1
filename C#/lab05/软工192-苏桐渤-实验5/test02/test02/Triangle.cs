using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test02 {
    class Triangle {

        Point a;
        Point b;
        Point c;

        public Triangle(Point a, Point b, Point c) {
            this.a = a;
            this.b = b;
            this.c = c;
        }

        public double calLength(Point a, Point b) {
            return Math.Sqrt(Math.Pow(a.x - b.x, 2) + Math.Pow(a.y - b.y, 2));
        }

        public double getLength() {
            return calLength(a, b) + calLength(b, c) + calLength(a, c);
        }

        public double getArea() {
            return Math.Abs(a.x * b.y - a.x * c.y + b.x * c.y - b.x * a.y + c.x * a.y - c.x * b.y);
        }

        public Point getCore() {
            return new Point((a.x + b.x + c.x) / 3, (a.y + b.y + c.y) / 3);
        }
        
    }
   
}
