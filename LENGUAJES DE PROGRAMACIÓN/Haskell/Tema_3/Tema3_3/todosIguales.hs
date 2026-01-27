module TodosIguales where

    todosIguales :: Int -> [Int] -> Bool 
    todosIguales n xs = (length [x | x <- xs, x == n]) == length xs
