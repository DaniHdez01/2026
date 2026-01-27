module MayusMinus where

    esMayus :: Char->Bool
    esMayus c = length [x | x<-['A'..'Z'], x==c] == 1

    esMinusculas :: Char->Bool
    esMinusculas c = length [x | x<-['a'..'z'], x==c] == 1

    toUpper :: Char -> Char
    toUpper c
        | esMinusculas c = toEnum (fromEnum c - 32)
        | otherwise = c

    toLower :: Char -> Char
    toLower c
        | esMayus c = toEnum (fromEnum c + 32)
        | otherwise = c

    cadenaMayusculas :: String -> String
    cadenaMayusculas [] = []
    cadenaMayusculas (x:xs) = if esMayus x then x : cadenaMayusculas xs else toUpper x : cadenaMayusculas xs

    mayusculasMinusculas :: String -> String
    mayusculasMinusculas s = [if esMayus c then toLower c else if esMinusculas c then toUpper c else c | c <- s]