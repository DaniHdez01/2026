module Primeros where

    primeros :: [(Char, Int)]-> String
    primeros [] = []
    primeros xs = [x | (x,_) <- xs]

    primerosPares :: [(Char, Int)]-> String
    primerosPares [] = []
    primerosPares xs = [c | (c,n) <-xs, even n]