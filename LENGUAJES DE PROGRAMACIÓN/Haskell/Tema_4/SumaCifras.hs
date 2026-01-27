module SumaCifras where 
    sumaCifras :: Int -> Int
    sumaCifras 0 = 0
    sumaCifras n = sumaCifras (n `div` 10) + n `mod` 10