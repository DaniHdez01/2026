module Codificacion where 

    codificacionTuplas :: [(Char, Char)] -> String
    codificacionTuplas xs = [ c1 | (c1,c2) <- xs, c2 `elem` "aeiouAEIOU" ]