module Duplicados where 
    --  Dada una lista de elementos de cualquier tipo, se pide implementar una función que elimine los elementos duplicados, 
    --  es decir, elementos que aparezcan repetidos juntos. Ejemplos de aplicación de la función serían: 

    eliminarDuplicados :: Eq a => [a] -> [a]
    eliminarDuplicados [] = []
    eliminarDuplicados [x] = [x]
    eliminarDublicados (x:y:xs) = if x == y then eliminarDuplicados (y:xs) else x : eliminarDuplicados xs