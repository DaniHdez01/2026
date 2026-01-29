module Contiene where 
    contiene :: [Int]->[Int]->Bool
    contiene [] _= True 
    contiene _ [] = True
    contiene (x:xs) (y:ys) = if x == y then contiene xs ys else contiene (x:xs) ys
    