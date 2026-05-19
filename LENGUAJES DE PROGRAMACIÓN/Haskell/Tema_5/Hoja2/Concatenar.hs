module Concatenar where 
    concatenar :: [a] -> [a]-> [a]
    concatenar [] xs = xs 
    concatenar (x:xs) ys = x : concatenar xs ys

    