module Mersenne where
    mersene :: Int -> [Int]
    mersene a = [(2^x) - 1 | x <- [1..a]]