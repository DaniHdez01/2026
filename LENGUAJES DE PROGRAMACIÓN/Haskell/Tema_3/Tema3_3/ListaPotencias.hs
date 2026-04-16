module ListaPotencias where 
    listaPotencias :: [Int] -> [Int]
    listaPotencias xs = [x^n, (x,n) <- zip xs [n-1..0]]
        where n = length xs