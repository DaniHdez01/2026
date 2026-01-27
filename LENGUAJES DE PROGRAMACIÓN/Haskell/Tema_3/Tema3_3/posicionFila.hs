module PosFila where 
    posFila :: [Int] -> [(Int, Int)]
    posFila xs = zip xs [0..]