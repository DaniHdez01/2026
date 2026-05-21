module ContarApariciones where 
    --Apartado a,  generar para cada elemento de la lista una tupla con el elemento y un contador de apariciones

    contarApariciones :: (Eq a) => [a] -> [(a,Int)]
    contarApariciones lst = [(x, contar x lst)| x <-lst ]

    contar :: Eq a => a->[a]-> Int
    contar _ [] = 0
    contar a (x:xs) 
        | a == x = 1 + contar a xs
        | otherwise = contar a xs