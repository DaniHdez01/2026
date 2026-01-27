module EsMayus where 

    esMayus :: Char -> Bool 
    esMayus c = c `elem` ['A'..'Z'] 