module Divisiones where 

    --Se pide implementar una función que dada un número (de cualquier tipo que soporte la operación de división) y una lista de números del mismo tipo, 
    -- divida a ese número por cada uno de los elementos contenidos en la lista y devuelva una lista con el resultado.  

    divisiones :: Int-> [Int] -> [Maybe Int] 
    divisiones _ [] = [] 
    divisiones n (x:xs) = if x == 0 then Nothing : divisiones n xs else Just (n `div` x) : divisiones n xs