{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Eta reduce" #-}
module AlFinal where 
    --CON AJUSTE DE PATRONES
    alFinal :: a -> [a] -> [a]
    alFinal x [] = [x]
    alFinal x (y:ys) = y : alFinal x ys

    --CON FOLDR 
    alFinal' :: a -> [a] -> [a]
    alFinal' x ys = foldr (:) [x] ys