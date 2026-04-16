module PosLista where 
    posLista :: [Int] -> [(Int,Int)]
    posLista [] = []
    posLista lst = [(a,b) | (a,b) <- zip lst [0..]]