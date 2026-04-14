-- Implementar una función que dada una lista de enteros devuelva otra lista que contenga los elementos de la primera que son impares y números primos. 
-- Se debe utilizar la definición de listas por comprensión
module ListaPrimosImpares where 
    listaPrimosImpares :: [Int]->[Int]
    listaPrimosImpares (x:xs) = [x|x<-xs, even x && length[n|n <- [1..x], n `mod` x == 0] ==2]
    --Si importamos el módulo de EsPrimo también se puede hacer 
