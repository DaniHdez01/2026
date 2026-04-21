module TakeWhile where 

    --  Implementar una función polimórfica en Haskell que dada una función f y una lista de elementos de cierto tipo, 
    --  vaya recorriendo la lista y devuelva los elementos mientras la función f devuelva True. 
    takewhile :: (a -> Bool) -> [a] -> [a]
    takewhile f lst = foldr (\x acc -> if f x then x : acc else []) [] lst