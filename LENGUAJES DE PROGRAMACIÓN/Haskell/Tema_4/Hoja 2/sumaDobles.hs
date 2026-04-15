module SumaDobles where 
    -- Implementar una función en Haskell que dada una lista de enteros obtenga un número entero con el resultado de calcular el doble de cada uno de los elementos de la lista 
    -- original y sumarlos todos.

    --CON RECURSIVIDAD 
    sumaDobles :: [Int] -> Int
    sumaDobles [] = 0
    sumaDobles x : xs = x*2 +sumaDobles xs

    --CON FOLDR
    sumaPlegada :: [Int] -> Int
    sumaPlegada lista = foldr (\x xs -> (x * 2) + xs) 0 lista