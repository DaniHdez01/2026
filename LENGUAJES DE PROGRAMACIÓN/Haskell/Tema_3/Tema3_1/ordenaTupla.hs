module OrdenarTupla where 

    ordenarTupla :: (Int, Int, Int) -> (Int, Int, Int)
    ordenarTupla (a, b, c) 
        | a < b && b < c = (a, b, c)
        | b < a && a < c = (b, a, c)
        | c < b && b < a = (c, b, a)
        | a < c && c < b = (a, c, b)
        | b < c && c < a = (b, c, a)
        | c < a && a < b = (c, a, b)
        | otherwise      = (a, b, c)
