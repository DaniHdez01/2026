def generar_pares(n : int): 
    a = 0
    for _ in range (0,n): 
        if a % 2 == 0: 
            yield a
        a += 1
def main(): 
    n = int(input())
    lista = list(generar_pares(n))
    print(lista)

main()