module Ordenar where 
    ordenar :: [Int] -> Bool
    ordenar [] = True
    ordenar [_] = True
    ordenar (x:y:xs) = x == y - 1 && ordenar (y:xs)