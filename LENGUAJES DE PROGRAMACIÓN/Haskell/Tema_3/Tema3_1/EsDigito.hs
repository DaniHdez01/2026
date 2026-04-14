module EsDigito where 

    --  Implementar una función que dado un carácter devuelva True si dicho carácter es un dígito  

    --  a. Debes utilizar Guardas  
    esDigito :: Char -> Bool 
    esDigito c 
        | c >= '0' && c <= '9' = True
        | otherwise            = False


    --  b. Debes utilizar ajuste de patrones 
    patronEsDigito :: Char -> Bool 
    patronEsDigito c = length [x | x <-['0'..'9'], x == c] == 1
