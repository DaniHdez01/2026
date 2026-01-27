module Apariciones where 

    contarApariciones :: String->Char->Int
    contarApariciones cs c = length [x | x<-cs, x == c]
