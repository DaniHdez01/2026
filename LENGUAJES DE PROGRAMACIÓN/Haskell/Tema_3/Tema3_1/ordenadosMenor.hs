module OrdenadosMenor where

    ordenadosMenor :: Int->Int->Int -> Bool
    ordenadosMenor a b c 
        | a < b  && b < c = True 
        | otherwise = False 
