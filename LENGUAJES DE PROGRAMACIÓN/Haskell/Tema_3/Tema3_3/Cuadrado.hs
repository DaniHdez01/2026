module Cuadrado where 

    cuadrado :: [Int]->[Int]
    cuadrado xs = [x*x|x<-xs, x `mod` 2 == 0]