module Suma where 
    sumaMenor10 :: [Int] -> Bool 
    sumaMenor10 (a:b:c:d:_) = (a + b + c + d) < 10
    sumaMenor10 _ = False 