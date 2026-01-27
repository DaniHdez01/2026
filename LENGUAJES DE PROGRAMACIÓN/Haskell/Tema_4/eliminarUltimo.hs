module Eliminar where 
    eliminar :: Int->[Int]->[Int]
    eliminar 0 xs = xs
    eliminar _ [] = []
    eliminar n (x:xs) = eliminar (n-1) xs 