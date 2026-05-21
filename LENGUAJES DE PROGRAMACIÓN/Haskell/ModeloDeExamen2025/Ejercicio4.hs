module Ejercicio4 where 

    generadorTuplas :: [[a]] -> [(a,Int)]
    generadorTuplas lst = [(head l,length l) |l <- lst, not (null l)]