module Repetido where

repetidos :: [Int]->([Int],[Int])
repetidos xs = (sinRepetir xs, conRepetir xs)

--ELEMENTOS UE NO SE REPITEM
sinRepetir :: [Int]->[Int]
sinRepetir [] = [] --CASO BASE
sinRepetir (x:xs)
    | x `elem` xs = sinRepetir xs --1ERA OPCION, SI EL RESTO DE LA LISTA CONTIENE X -> SE REPITE-> NO SE METE
    | otherwise = x : sinRepetir xs

--ELEMENTOS QUE SÍ SE REPITEN
conRepetir :: [Int]->[Int]
conRepetir [] = [] --CASO BASE
conRepetir (x:xs)
    | x `elem` xs && x `notElem` conRepetir xs = x : conRepetir xs --EL ELEMENTO ESTÁ EN EL RESTO DE LA LISTA Y, ADEMÁS, NO LO HE METIDO AÚN -> LO METO E LA LISTA NUEVA 
    | x `elem` xs = conRepetir xs
    | otherwise = conRepetir xs 