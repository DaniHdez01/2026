
def es_positivo(n): 
    return n >= 0
def obtener_positivos(lista_numeros): 
    resultado = list(filter(lista_numeros, es_positivo))
    resultado = list(filter(es_positivo, lista_numeros))
    return resultado

def main():
    numeros = [-2, -1, 0, 1, 2, 3, -5, 10]
    positivos = obtener_positivos(numeros)
    print(f"Números originales: {numeros}")
    print(f"Números positivos: {positivos}")

if __name__ == "__main__":
    main()