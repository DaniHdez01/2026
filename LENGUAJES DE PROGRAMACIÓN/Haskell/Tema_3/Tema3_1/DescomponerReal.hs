module Descomponer where 

    descomponerReal :: Float -> (Int, Int)
    descomponerReal a = (b, c) where 
        b = truncate a
        c = truncate ((a - fromIntegral b)*100)
