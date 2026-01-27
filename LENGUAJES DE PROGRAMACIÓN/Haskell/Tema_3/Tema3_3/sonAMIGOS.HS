module SonAmigos where

sonAmigos :: (Int, Int) -> Bool
sonAmigos (x, y) = sumaDivisores (sacarDivisores x) == y && sumaDivisores (sacarDivisores y) == x

sumaDivisores :: [Int] -> Int
sumaDivisores (x:xs) = x + sumaDivisores xs
sumaDivisores [] = 0


sacarDivisores :: Int -> [Int]
sacarDivisores n = [ x | x <- [1..n-1], n `mod` x == 0 ]