import Histograma 
import operacionesConjuntos as conjuntos
import random

def main(): 
    listaInicial_1 = []
    listaInicial_2 = []
    for i in range(0,30): 
        listaInicial_1.append(random.randint(0,20))
        listaInicial_2.append(random.randint(0,20))
    print(listaInicial_1)
    print(listaInicial_2)
    union = conjuntos.union(listaInicial_1, listaInicial_2)
    print(union)
    interseccion = conjuntos.interseccion(listaInicial_1, listaInicial_2)
    print(interseccion)
    diferencia = conjuntos.diferencia(listaInicial_1, listaInicial_2)
    print(diferencia)
    simetrica = conjuntos.diferencia_simetrica(listaInicial_1, listaInicial_2)
    print(simetrica)

    print("Histograma de la union de las listas creadas: \n")
    hisUnion = Histograma.hist(union)
    Histograma.print_histogram(hisUnion)

    print("Histograma de la interseccion de las listas creadas: \n")
    hisInterseccion = Histograma.hist(interseccion)
    Histograma.print_histogram(hisInterseccion)

    print("Histograma de la diferencia de las listas creadas: \n")
    hisDif = Histograma.hist(diferencia)
    Histograma.print_histogram(hisDif)

    print("Histograma de la union de las listas creadas: \n")
    hisSim = Histograma.hist(simetrica)
    Histograma.print_histogram(hisSim)

main()