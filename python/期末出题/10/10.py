with open("input.txt", "r") as file:
    cnt = 0;
    lines = file.readlines()
    for line in lines:
        if "banana" in line:
            cnt += 1
    if cnt == 0:
        print("without banana!")
    else:
        print(cnt)
