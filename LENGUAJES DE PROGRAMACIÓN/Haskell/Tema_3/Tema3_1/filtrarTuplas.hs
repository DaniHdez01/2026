module FiltrarTuplas where 
    -- Implementar una función que dado un número entero n y una lista de 2-tuplas de enteros, devuelva una lista con las tuplas cuyo primer elemento es impar y mayor que n. 
    -- Se debe utilizar la definición de listas por comprensión.
    filtrarTuplas :: [(Int, Int)] -> Int -> [(Int,Int)]
    filtrarTuplas xs n = [(c1, c2) | (c1, c2)<-xs, c1 `mod` 2 == 1 && c1 >= n]