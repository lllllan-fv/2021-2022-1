name = set()

for item in input().split():
    if item[0].isupper() and item[1:len(item)].islower():
        if item in name:
            continue
        name.add(item)
        print(item)
