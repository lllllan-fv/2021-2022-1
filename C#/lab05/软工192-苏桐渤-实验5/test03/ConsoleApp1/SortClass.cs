using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1 { 
    class SortClass {

        private int length;
        private int[] array;
        private int[] copy;

        public SortClass(int length) {
            this.length = Math.Min(length, 1000000);
            array = new int[length + 7];
            copy = new int[length + 7];
        }

        public void setArray() {
            Random rnd = new Random();
            for (int i = 0; i < length; ++i) {
                array[i] = rnd.Next(0, length);
            }
        }

        public void setCopy() {
            for (int i = 0; i < length; ++i) {
                copy[i] = array[i];
            }
        }

        public void swap(int i, int j) {
            int tem = copy[i];
            copy[i] = copy[j];
            copy[j] = tem;
        }

        public void bubbleSort() {
            for (int i = 0; i < length; ++i) {
                for (int j = length - 1; j > i; --j) {
                    if (copy[j] < copy[j - 1]) swap(j - 1, j);
                }
            }
        }

        public void selectionSort() {
            for (int i = 0; i < length; ++i) {
                int minIndex = i;
                for (int j = i + 1; j < length; ++j) {
                    if (copy[j] < copy[minIndex]) minIndex = j;
                }
                if (minIndex != i) swap(i, minIndex);
            }
        }

        public void quickSort(int l, int r) {
            if (l >= r) return;
            int i = l, j = r, x = copy[l];
            while (i < j) {
                while (i < j && copy[j] >= x) --j;
                if (i < j) copy[i++] = copy[j];

                while (i < j && copy[i] < x) ++i;
                if (i < j) copy[j--] = copy[i];
            }
            copy[i] = x;
            quickSort(l, i - 1);
            quickSort(i + 1, r);
        }

        public void compareSorts() {
            setArray();

            for (int i = 0; i < 3; ++i) {
                setCopy();
                DateTime before = System.DateTime.Now;

                if (i == 0) {
                    Console.Write("Bubble Sort");
                    bubbleSort();
                }
                else if (i == 1) {
                    Console.Write("Selection Sort");
                    selectionSort();
                }
                else {
                    Console.Write("Quick Sort");
                    quickSort(0, length - 1);
                }

                DateTime after = System.DateTime.Now;
                TimeSpan ts = after.Subtract(before);

                Console.WriteLine("costed: {0}ms", ts.TotalMilliseconds);
            }
        }
    }
}
