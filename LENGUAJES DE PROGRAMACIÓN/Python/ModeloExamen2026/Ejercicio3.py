def generar_pares(n : int): 
    for i in range (0,n): 
        if i % 2 == 0: 
            yield i
def main(): 
    n = int(input())
    lista = list(generar_pares(n))
    print(lista)

main()