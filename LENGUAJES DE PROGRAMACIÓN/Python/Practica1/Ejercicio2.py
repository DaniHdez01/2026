list1 = [1,2,3,4,5]
list2 = [3,4,5,6,7]


def union():
    list3 = []
    for elem in list1:
        list3.append(elem)
    for elem in list2: 
        if elem not in list3: 
            list3.append(elem)
    return list3

def interseccion():
    list3 = []
    for elem in list1:
         if elem in list2:
             list3.append(elem)
    return list3

def diferencia():
    list3 = [] 
    for elem in list1: 
        if  elem not in list2: 
            list3.append(elem)
    return list3

def diferencia_simetrica(): 
    list3 = []
    for elem in list1: 
        if elem not in list2: 
            list3.append(elem)
    for elem in list2: 
        if elem not in list1 and elem not in list3: 
            list3.append(elem) 
    return list3

def main(): 
    print(union())
    print(interseccion())
    print(diferencia())
    print(diferencia_simetrica())

if __name__ == "__main__":
    main()