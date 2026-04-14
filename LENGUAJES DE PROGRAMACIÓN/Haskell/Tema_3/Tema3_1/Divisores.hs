module Divisores where 
    divisores :: Int -> [Int]
    divisores a = [x | x <- [1 .. a], a `mod` x == 0]