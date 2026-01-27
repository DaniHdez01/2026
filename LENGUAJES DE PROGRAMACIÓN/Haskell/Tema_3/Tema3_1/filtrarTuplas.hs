module FiltrarTuplas where 

    filtrarTuplas :: [(Int, Int)] -> Int -> [(Int,Int)]
    filtrarTuplas xs n = [(c1, c2) | (c1, c2)<-xs, c1 `mod` 2 == 1 && c1 >= n]