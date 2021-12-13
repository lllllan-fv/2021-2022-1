cnt = 0

while True:
    line = input()
    if line == "-1":
        break
    cnt += line.count("banana")

print(cnt)