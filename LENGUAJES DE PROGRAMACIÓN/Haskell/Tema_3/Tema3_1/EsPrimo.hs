--  Implementar una función que diga si un número es primo. Para ello se debe utilizar la función que calcula los divisores de un número (ejercicio 5)
module EsPrimo where 
    import Divisores 
    esPrimo :: Int -> Bool 
    esPrimo x = length (divisores x) == 2