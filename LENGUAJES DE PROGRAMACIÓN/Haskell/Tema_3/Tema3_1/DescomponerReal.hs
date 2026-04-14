module Descomponer where 
-- Implementar una función en Haskell que dada una tupla compuesta por tres números enteros la devuelva ordenada de menor a mayor. 
    descomponerReal :: Float -> (Int, Int)
    descomponerReal a = (b, c) where 
        b = truncate a
        c = truncate ((a - fromIntegral b)*100)
