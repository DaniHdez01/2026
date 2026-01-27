module ContarMayus where 

    contarMayus :: String -> Int 
    contarMayus xs = length [c | c<-xs, c `elem` ['A'..'Z']]