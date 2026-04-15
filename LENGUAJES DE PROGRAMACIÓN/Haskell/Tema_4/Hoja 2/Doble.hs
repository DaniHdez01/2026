module Doble where 
    -- ¿Cómo cambiaría la definición de la siguiente función utilizando expresiones lambda?  doble :: Int -> Int  doble x = x + x 
    doble :: Int -> Int
    doble = (\a -> a * 2)