# 2021-2022-1 python课程期末出题



- 数量：10
- 难度：适中

-----

#### 1. Hello Python

- 类型：简单输出
- 考点：转义字符
- 难度：简单

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
- 考点：输入浮点数、格式化输出
- 难度：简单

题目：

> 输入一个浮点数，分别保留1、2、3位小数输出

input:

> 10.678

output:

> 保留一位小数: 10.7
> 保留两位小数: 10.68
> 保留三位小数: 10.678

```python
a = float(input())
print("保留一位小数: %.1f" % a)
print("保留两位小数: %.2f" % a)
print("保留三位小数: %.3f" % a)
```

