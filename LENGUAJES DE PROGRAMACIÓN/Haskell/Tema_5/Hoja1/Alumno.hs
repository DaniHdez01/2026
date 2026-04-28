module Alumnos where 
    type DNI = String 
    type Expediente = Int 
    type Nota = Float

    type Alumno = (DNI, Expediente, Nota) 

    aprobado :: Alumno -> Bool 
    aprobado (_,_,nota) = nota >= 5

    calificacionLetra :: Nota -> String
    calificacionLetra nota
        | nota < 5 = "Suspenso"
        | nota >= 5 && nota <7 = "Aprobado"
        | nota >= 7 && nota <9 = "Notable"
        | otherwise = "Sobresaliente"


    calificacion :: Alumno -> String 
    calificacion (_,exp,nota) = "Expediente" ++ show (exp) ++ "Nota final: " ++ calificacionLetra nota 




