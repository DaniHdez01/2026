module ContarConsonantes where 
    contarConsonantes :: String -> Int
    contarConsonantes cs = length [c | c<-cs, not (esVocal c)]

    esVocal :: Char -> Bool 
    esVocal c = c `elem` "AEIOUaeiou"