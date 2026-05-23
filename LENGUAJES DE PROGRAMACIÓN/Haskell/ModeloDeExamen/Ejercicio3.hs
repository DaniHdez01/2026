module Ejercicio3 where 

    sumaDivisores :: Int -> Int 
    sumaDivisores n = sum [x|x<-[1..n-1], n `mod` x == 0]

    esAbundante :: Int -> Bool 
    esAbundante n 
        | n < sumaDivisores n = True 
        | otherwise = False 

    numerosAbundantes :: Int -> [Int]
    numerosAbundantes n = take n [x| x<-[1..], esAbundante x]
