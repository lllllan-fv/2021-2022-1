class ScoreException(Exception):
    def __init__(self, message):
        super().__init__()
        self.__message = message

    def __str__(self):
        return self.__message


class Score:
    def __init__(self, score):
        if score < 0:
            raise ScoreException("Negative exception")
        elif score > 100:
            raise ScoreException("Beyond exception")
        self.__score = score

    def __str__(self):
        return "该学生的分数是：" + str(self.__score)


def main():
    try:
        score = Score(int(input()))
        print(score)
    except ScoreException as ex:
        print(ex)


main()
