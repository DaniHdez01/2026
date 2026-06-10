module Iguales where 
    --Se quiere implementar una función polimórfica que dada una lista de elementos diga si son todos iguales. Ejemplos de aplicación de la función son: 
    iguales :: Eq a => [a] -> [a] -> Bool
    iguales [] [] = True 
    iguales (x:xs) (y:ys) = x == y && iguales xs ys 