module Contiene where 

    contiene :: Int->[Int]->Bool
    contiene _ [] = False  
    contiene n xs = length [x|x<-xs, x == n ] >= 1