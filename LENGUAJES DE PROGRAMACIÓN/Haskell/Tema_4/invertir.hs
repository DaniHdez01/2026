module Invertir where 
    invertir :: Int->Int
    invertir n = aux n 0
      where
        aux 0 acc = acc
        aux x acc = aux (x `div` 10) (acc * 10 + (x `mod` 10))