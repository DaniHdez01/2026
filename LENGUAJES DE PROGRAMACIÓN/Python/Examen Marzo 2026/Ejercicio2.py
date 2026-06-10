## Dada la siguiente función, modifíquela para utilizar la función map para obtener 
# la lista resultado en lugar de iterar por la lista con el for.

def convert(lista_original): 
    resultado = [] 
    for item in lista_original: 
        resultado.append(len(item)) 
    return resultado

def convert_map(lista_original): 
    resultado = []
    map(len, lista_original)