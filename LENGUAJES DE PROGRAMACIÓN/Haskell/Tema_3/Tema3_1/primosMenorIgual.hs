-- Implementar una función que dado un entero devuelva una lista con los números primos menores o iguales que dicho número. 
--Se debe utilizar la definición de listas por comprensión
module PrimosMenorIgual where 
    import EsPrimo 
    primosMenorIgual :: Int->[Int]
    primosMenorIgual x = [x|x<-[1..x], esPrimo x]