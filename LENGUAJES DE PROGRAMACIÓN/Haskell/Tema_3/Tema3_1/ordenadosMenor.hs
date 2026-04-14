module OrdenadosMenor where
--  Implementar una función en Haskell que dados tres números enteros determine si están ordenados de menor a mayor. Ejemplos de aplicación de la función podrían ser:  
    ordenadosMenor :: Int->Int->Int -> Bool
    ordenadosMenor a b c 
        | a < b  && b < c = True 
        | otherwise = False 
