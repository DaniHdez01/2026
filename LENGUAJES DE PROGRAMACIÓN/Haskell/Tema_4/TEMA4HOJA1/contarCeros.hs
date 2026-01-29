module ContarCeros where

-- | Cuenta el número de secuencias de ceros consecutivos en una lista.
-- Ejemplo: ceros [0,0,1,5,0,4,0,0,0,5] -> 3
ceros :: [Int] -> Int
ceros [] = 0
ceros (0:xs) = 1 + ceros (skipCeros xs)
ceros (_:xs) = ceros xs

-- | Salta todos los ceros consecutivos
skipCeros :: [Int] -> [Int]
skipCeros [] = []
skipCeros (0:xs) = skipCeros xs
skipCeros xs = xs