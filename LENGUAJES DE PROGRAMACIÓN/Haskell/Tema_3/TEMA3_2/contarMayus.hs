module ContarMayus where 

        esMayus :: Char -> Bool 
        esMayus c = c `elem` ['A'..'Z']

        contarMayus :: String -> Int
        contarMayus cs = length[c|c<-cs, c `elem` ['A'..'Z']] 