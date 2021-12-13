sum = 0
cnt = 0

for a in input().split():
    cnt += 1
    sum += float(a)

sum /= cnt

print("%.2f" % sum)
