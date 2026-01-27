module MensajeLista where 
    mensajeLista :: [Int] -> String
    mensajeLista xs = "El primer elemento es " ++ show (head xs) ++ "Y el último"++ show (last xs)  ++ ", y la longitud es: " ++ show (length xs)