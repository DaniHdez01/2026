module Bisiesto where 
--  Definir una función para saber si un año es bisiesto.  
    bisiesto :: Int -> Bool 
    bisiesto a = a `mod` 4 == 0 