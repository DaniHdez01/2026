module Aeropuertos where 
    --APARTADO A: DEFINIR EL TIPO DE DATOS: 
    data Aeropuerto = Aeropuerto = {
        nombre :: String,
        pistas :: Int, 
        vuelos :: Int, 
        accidentes :: Int, 
        compañias :: [String]
    }
    --Otra forma de hacerlo es con types

    --APARTADO B: FUNCIÓN QUE COMPRUEBE SI DOS AEROPUERTOS SON IGUALES 
    instance Eq Aeropuerto where 
        a1 == a2 = pistas a1 == pistas
        && vuelos a1 == vuelos a2 
        && length (compañias a1) == length (compañias a2)
    
    instance Show Aeropuerto where 
        show a1 = "Aeropuerto" ++ nombre a1 ++ ";"
        ++ "Pistas" ++ show (pistas a1) ++";"
        ++ "Trafico" ++ show (trafico a1) ++";"
        ++ "Accidentes" ++ show (accidentes a1) ++ ";"
        ++ "Compañias: " ++ show (compañias a1)

    compararAeropuertos :: Aeropuerto -> [Aeropuerto] -> [Aeropuerto]
    compararAeropuertos a xs = foldr(\x acc -> if (accidentes x > accidentes a) then x:acc else acc)