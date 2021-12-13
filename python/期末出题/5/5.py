def bubbleSort(arr):
    cnt = 0
    n = len(arr)
    for i in range(n):
        for j in range(0, n - i - 1):
            if arr[j] > arr[j + 1]:
                cnt += 1
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
    return cnt


def main():
    line = input()
    arr = [int(n) for n in line.split()]
    print("冒泡排序交换了 {} 次".format(bubbleSort(arr)))
    print("排序后结果是：", arr)


main()
