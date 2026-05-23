module ContarApariciones where 
    --Apartado a,  generar para cada elemento de la lista una tupla con el elemento y un contador de apariciones

    contarApariciones :: (Eq a) => [a] -> [(a,Int)]
    contarApariciones [] = []
    contarApariciones (x:xs) = (x, 1 + contar x xs) : contarApariciones [y | y <- xs, y /= x]

    contar :: Eq a => a->[a]-> Int
    contar _ [] = 0
    contar a (x:xs) 
        | a == x = 1 + contar a xs
        | otherwise = contar a xs

    --Apartado b: Calcular la moda
    -- Función principal para obtener la moda
    moda :: Eq a => [a] -> [a]
    moda [] = []
    moda lst = [obtenerModa (contarApariciones lst)]

    -- Función auxiliar que recorre la lista de tuplas para quedarse con el elemento de mayor frecuencia
    obtenerModa :: [(a, Int)] -> a
    obtenerModa [(elem, _)] = elem  -- Caso base: si solo queda un elemento, es la moda
    obtenerModa ((elem1, freq1):(elem2, freq2):resto)
        | freq1 >= freq2 = obtenerModa ((elem1, freq1) : resto) -- Descartamos el segundo
        | otherwise      = obtenerModa ((elem2, freq2) : resto) -- Descartamos el primero