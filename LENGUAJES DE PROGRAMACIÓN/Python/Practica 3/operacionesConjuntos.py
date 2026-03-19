def union(list1, list2):
    list3 = []
    for elem in list1:
        list3.append(elem)
    for elem in list2: 
        if elem not in list3: 
            list3.append(elem)
    return list3

def interseccion(list1, list2):
    list3 = []
    for elem in list1:
         if elem in list2:
             list3.append(elem)
    return list3

def diferencia(list1, list2):
    list3 = [] 
    for elem in list1: 
        if  elem not in list2: 
            list3.append(elem)
    return list3

def diferencia_simetrica(list1, list2): 
    list3 = []
    for elem in list1: 
        if elem not in list2: 
            list3.append(elem)
    for elem in list2: 
        if elem not in list1 and elem not in list3: 
            list3.append(elem) 
    return list3