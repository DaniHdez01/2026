module Primos where 
    esPrimo :: Int -> Bool 
    esPrimo x = length [y | y <- [1..x], x `mod` y == 0] == 2

    listaPrimos :: [Int] -> [Int]
    listaPrimos ls = foldr(\x acc -> if esPrimo x then x : acc else acc) [] ls

    listaPrimosRecursiva :: [Int] -> [Int]
    listaPrimosRecursiva [] = []
    listaPrimosRecursiva (x:xs) = if esPrimo x then x : listaPrimosRecursiva xs else listaPrimosRecursiva xs 