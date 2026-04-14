module Pitagoricas where 
        -- Implementar una función en Haskell que reciba una lista de ternas de números enteros (tres-tuplas) y nos devuelva el número de estas que son pitagóricas. 
        -- Se entiende por terna pitagórica (x,y,z) aquella que cumple que x2 + y2 = z2.
    pitagoricas :: [(Int, Int, Int)] -> Int
    pitagoricas xs = length [(c1,c2,c3) | (c1, c2, c3) <- xs, c1^2 + c2^2 == c3^2]