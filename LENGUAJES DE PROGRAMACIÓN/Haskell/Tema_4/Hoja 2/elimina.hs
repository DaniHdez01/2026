module Elimina where 
    -- Implementar una función en Haskell que dado un número entero y una lista, 
    -- devuelva la lista eliminando las apariciones de dicho número. Se debe utilizar 
    -- la función de orden superior fold (una solución utilizando foldl y otra utilizando foldr).
    eliminaValor :: Eq a => a -> [a] -> [a]
    eliminaValor target lst = foldr (\x acc -> if x == target then acc else x : acc) [] lst