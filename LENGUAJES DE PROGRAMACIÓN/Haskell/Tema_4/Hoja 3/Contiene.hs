module Contiene where 

    contiene :: Eq a => a -> [a] -> Bool
    contiene target lst = foldr (\x acc -> x == target || acc) False lst