-- La función signum predefinida del lenguaje recibe un número y si es positivo devuelve 1, si es negativo devuelve -1 y devuelve 0 si el número es cero. 
--Se pide redefinir esta función. 
--Hay que hacer dos versiones diferentes (una con if anidados y otra con guardas). Ejemplos de la salida serían los siguientes: 

module Signum where 
    -- Versión con guardas
    signum' :: Int -> Int
    signum' a 
        | a > 0     = 1
        | a < 0     = -1
        | otherwise = 0
