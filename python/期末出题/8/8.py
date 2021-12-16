class Parent:
    def __init__(self, name, job):
        self._name = name
        self._job = job

    def __str__(self):
        return "Parent(name:" + self._name + ", job:" + self._job + ")"


class Child(Parent):

    def __init__(self, name, job):
        super().__init__(name, job)

    def __str__(self):
        return "Child(name:" + self._name + ", job:" + self._job + ")"


def main():
    a = input().split()
    b = input().split()

    parent = Parent(a[0], a[1])
    child = Child(b[0], b[1])

    print(parent)
    print(child)

    print("Parent的父类是", Parent.__base__)
    print("Child的父类是 ", Child.__base__)


main()
