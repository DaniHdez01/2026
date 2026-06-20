## Dada la siguiente función, modifíquela para utilizar la función map para obtener 
# la lista resultado en lugar de iterar por la lista con el for.

def convert(lista_original): 
    resultado = [] 
    for item in lista_original: 
        resultado.append(len(item)) 
    return resultado

def convert_map(lista_original): 
    resultado = []
    resultado = map(len, lista_original)
    return resultado

def lambda_map(lista_original): 
    resultado = []
    resultado = map(lambda x : len(x), lista_original)
    return resultado