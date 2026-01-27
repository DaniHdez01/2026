module Head where 

    head :: [Int]->Int
    head (x:xs) = x

    tail :: [Int]->[Int]
    tail (x:xs) = xs