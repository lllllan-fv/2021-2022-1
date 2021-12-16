class Student:
    def __init__(self, name, age, sex):
        self.__name = name
        self.__age = age
        self.__sex = sex

    def __str__(self):
        return self.__name + "同学的年龄是" + self.__age + "，性别是" + self.__sex


def main():
    info = []
    info = input().split()
    A = Student(info[0], info[1], info[2])
    print(A)


main()
