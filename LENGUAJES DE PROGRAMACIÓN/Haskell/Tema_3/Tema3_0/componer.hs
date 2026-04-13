module Componer where 
    --Se pide una función que, dados dos números enteros, obtenga el valor mayor de su cociente y resto.
    componer :: Int -> Int -> Int
    componer a b = max (a `div` b) (a `mod` b)