#Utilizando la sintaxis de list comprehensions, 
# escribe una sola línea de código que genere una lista llamada mis_multiplos 
# que contenga el triple de cada número en el rango del 1 al 15 (ambos inclusive).

def main(): 
    print([i*3 for i in range(1,16)])

main()