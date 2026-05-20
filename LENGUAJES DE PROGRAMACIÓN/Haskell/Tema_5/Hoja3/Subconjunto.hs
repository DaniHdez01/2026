module Subconjunto where 
    subconjunto :: Eq a => [a] -> [a] -> Bool 
    subconjunto [] _ = True 
    subconjunto (x:xs) (y:ys) = x == y && subconjunto xs ys 