module ListasIguales where

listasIguales :: [Int] -> [Int] -> Bool
listasIguales la lb = length la == length lb && and [x == y | (x, y) <- zip la lb]