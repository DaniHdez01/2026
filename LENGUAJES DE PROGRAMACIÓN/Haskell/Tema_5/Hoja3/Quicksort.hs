module Quicksort where 
--Se quieren ordenar los elementos de una lista (cuyos elementos son comparables) mediante el algoritmo del quicksort.  
    quicksort :: Ord a => [a] -> [a]
    quicksort [] = []
    quicksort (p:xs) = [x | x <- xs, x <= p] ++ [p] ++ [x|x <- xs, x > p]
