module Duplicados where 
    eliminaDuplicados :: [Int] -> [Int]
    --NOTA IMPORTANTE: 
    -- LA LISTA QUE ITERA DENTRO DE LA FUNCIÓN FOLDR O FOLDL ES UN ACUMULADOR,
    -- ES UNA LISTA QUE SE VA LLENANDO CADA ITERACIÓN
    eliminaDuplicados lst = foldr (\x acc -> if x `elem` acc then acc else x : acc) [] lst