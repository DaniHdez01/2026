module Quizas where 
    data Maybe a = Nothing | Just a deriving Show

    posicion :: [Int] -> Int -> Maybe Int
    posicion [] _ = Nothing 
    posicion xs x = Just elemIndex x xs 