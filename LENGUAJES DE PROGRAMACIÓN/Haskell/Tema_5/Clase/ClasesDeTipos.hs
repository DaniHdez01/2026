module ClasesDeTipos where 
    --Con clases de tipos, hacer una función que dada una lista devuelva el menor 
    menor :: (Ord a) => [a] -> Maybe a
    menor [] = Nothing 
    menor [x] = Just x 
    menor (x:y:xs) = menor ((min x y) : xs) --Llamada  recursiva con función min

    --Misma función con funciones de plegado
    menorPlegado :: (Ord a) => [a] -> Maybe a
    menorPlegado [] = Nothing
    menorPlegado (x: xs) = Just (foldr min x xs) --Con llamar foldr y hacer el mínimo entre x y el resto de la lista vale 

--Otra solución posible de la profesora
    elementoMenor :: Ord a => [a] -> Maybe a --Ord: Establecemos que la función va a ser de ordenar
    elementoMenor[] = Nothing 
    elementoMenor (x:xs) = foldl(\r y -> if (Just y) < r then (Just y) else r) (Just x) xs 
    --Descompongo la lista 
        --Elemento base con el primero de la lista 
        -- r toma el elemento base, es decir Just x (IMPORTANTISIMO PONER JUST X Y NO SOLO X ESTAS DICIENDO QUE LA SALIDA ES UN MAYBE)
        -- y es el siguiente valor: Comparas JUST Y con el acumulado que es JUST X. (IMPORTANTISIMO PONER JUST Y Y NO SOLO Y ESTAS DICIENDO QUE LA SALIDA ES UN MAYBE)
   
    --Dada una lista de tuplas y un número, desarrollar una función que encuentre la pareja del número que le pasamos a la función
    buscarPareja :: Eq (a) => a-> [(a,a)] -> Maybe a  
    buscarPareja x [] = Nothing 
    buscarPareja x ((x,y):xs) = foldl(\r (a,b) -> if a == r then (Just b) else r) (Just x) xs --LAS FUNCIONES ANÓNIMAS SOLO PUEDEN TENER 2 ARGUMENTOS

    