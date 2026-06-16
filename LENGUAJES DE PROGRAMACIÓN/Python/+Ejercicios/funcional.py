#4. Programación Funcional (map, filter y lambda)
#Objetivo: Sustituir bucles tradicionales por funciones integradas más eficientes.

#Map: Dada una lista de precios [10, 20, 30, 40], utiliza map y una función lambda para aplicarles un 21% de IVA (multiplicar por 1.21). Devuelve el resultado como una lista.

#Filter: Dada una lista de palabras ["sol", "programacion", "luz", "python", "dia"], utiliza filter y una lambda para quedarte solo con las palabras que tengan más de 3 letras. Devuelve el resultado como una lista.

def main(): 
    precios = [10,20,30,40]
    precios_iva = map(lambda x : x*1.21, precios)
    for n in precios_iva: 
        print(n)
    

    palabras = ["sol", "programacion", "luz", "python", "dia"]
    resultado = list(filter(lambda palabra: len(palabra) > 3, palabras))
    print(resultado)
    
main()