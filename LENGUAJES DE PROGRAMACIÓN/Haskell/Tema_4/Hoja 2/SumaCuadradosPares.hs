module CuadradosPares where 
    -- Implementar una función que sume los cuadrados de los números pares contenidos en una lista de números enteros.

    sumaCuadrados :: [Int] -> Int
    sumaCuadrados lista = foldr(\x xs -> if even x then (x*x) + xs else xs) 0 lista

    sumaComprimida :: [Int] -> Int
    sumaComprimida xs = sum [x*x | x <- xs, even x]
