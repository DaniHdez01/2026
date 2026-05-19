module Consdicion where 

-- 3. Se pide una función polimórfica que dada una propiedad y una lista de elementos, 
--    devuelva el primer elemento de la lista que cumple con la propiedad. 
    primerElemento :: (a->Bool) -> [a] -> Maybe a
    primerElemento condicion [] = Nothing 
    primerElemento condicion (x:xs)
     | condicion x = Just x 
     | otherwise = primerElemento condicion xs