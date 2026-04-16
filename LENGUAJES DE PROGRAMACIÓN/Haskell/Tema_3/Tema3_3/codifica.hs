module Codifica where 
    codifica :: [Int] -> String
    codifica [] = []
    codifica ls = [ if x `mod` 2 == 0 then 'p' else 'i' | x <- ls]