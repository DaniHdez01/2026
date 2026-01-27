module Cribar where

-- cribar tiene que quitar los divisores de n 
cribar :: [Int] -> Int -> [Int]
cribar [] _ = []
cribar (x:xs) n
    | x == 0 = cribar xs n
    | x `mod` n /= 0 = x : cribar xs n
    | otherwise = cribar xs n