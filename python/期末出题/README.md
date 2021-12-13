# 2021-2022-1 python课程期末出题



- 数量：10
- 难度：适中

-----

#### 1. Hello Python

- 类型：简单输出
- 考点：转义字符 

题目：
> 请输出：\hello "python"/

input: 
> 无

output:
> \hello "python"/

```python
print("\\hello \"python\"/")
```



#### 2. 格式化输出

- 类型：输入输出
- 考点：循环、格式化输出 

题目：

> 一行中输入不定多个数字，求平均值并保留两位小数

input:

> 1.2 3 4.56

output:

> 2.92

```python
a = float(input())
print("保留一位小数: %.1f" % a)
print("保留两位小数: %.2f" % a)
print("保留三位小数: %.3f" % a)sum = 0
cnt = 0

for a in input().split():
    cnt += 1
    sum += float(a)

sum /= cnt

print("%.2f" % sum)
```



#### 3. str.count()

- 类型：字符串方法
- 考点：str.count()、循环

题目：

> 输入不定多行字符串，以单行 `-1` 结束。输出其中一共有多少个 `banana`

input:

> banana banana banana
> banana banana
> banana
> -1

output:

> 6

```python
cnt = 0

while True:
    line = input()
    if line == "-1":
        break
    cnt += line.count("banana")

print(cnt)
```



#### 4. break

- 类型：循环
- 考点：循环、break

题目：

> 输入两个整数a、b（保证a <= b），按格式输出两个整数之间的最小素数。

input1:

> 14 15

output1:

> 14 到 15 区间中没有素数

input2:

> 2 5

output2:

> 2 到 5 区间中最小的素数是 2

```python
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
```

