module Calificaciones where 

    calificaciones :: Float -> String 
    calificaciones a 
        | a == 0.0 = "Paquetazo historico"
        | a < 5.0 = "Suspenso"
        | a >= 5.0 && a < 7.0 = "Aprobado"
        | a >= 7.0 && a < 9.0 = "Notable"
        | otherwise = "Sobresaliente"