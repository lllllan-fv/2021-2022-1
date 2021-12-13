a, b = map(int, input().split())

pri = -1

for i in range(a, b + 1):
    flag = True
    for k in range(2, i):
        if (i % k) == 0:
            flag = False
            break
    if flag:
        pri = i
        break

if pri == -1:
    print("{} 到 {} 区间中没有素数".format(a, b))
else:
    print("{} 到 {} 区间中最小的素数是 {}".format(a, b, i))