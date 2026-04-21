module TakeWhile where 
    takewhile :: (Int -> Bool) -> [Int] -> [Int]
    takewhile f (x) lst = foldr(f\ )