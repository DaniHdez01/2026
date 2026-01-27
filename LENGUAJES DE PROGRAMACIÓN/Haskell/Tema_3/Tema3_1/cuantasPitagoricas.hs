module Pitagoricas where 
    pitagoricas :: [(Int, Int, Int)] -> Int
    pitagoricas xs = length [(c1,c2,c3) | (c1, c2, c3) <- xs, c1^2 + c2^2 == c3^2]