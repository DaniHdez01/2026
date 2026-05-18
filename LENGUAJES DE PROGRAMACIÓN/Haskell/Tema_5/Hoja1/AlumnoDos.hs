module AlumnoDos where 

    --Definir la clase de Alumno pero por Tipos Producto 

    type DNI = String 
    type Expediente = Int
    type Nota = Float 
    --Definimos el tipo de datos con su constructor y los datos que tenemos dentro 
    data Alumno = Al DNI Expediente Nota 

    --APARTADO A: Función que diga si un alumno está aprobado o suspenso

    aprobado :: Alumno -> Bool
    aprobado (Al _ _ notaAlumno) = notaAlumno >= 5.0

    --APARTADO B: Función que devuelva la nota y expediente de un alumno en un string 
    calificacionAUX :: Nota -> String 
    calificacionAUX n 
     | n < 5.0 = "Suspenso"
     | n >= 5.0 && n < 7.0 = "Aprobado"
     | n >= 7.0 && n < 9 = "Notable"
     | otherwise = "Sobresaliente"
    
    calificacionAlumno :: Alumno -> String 
    calificacionAlumno (Al _ exp nota) = "Expediente: " ++ show exp ++ " Nota: " ++ show nota ++ "  " ++ calificacionAUX nota 

    --APARTADO C: Implementar una función que solo te devuelva la nota

    dameNota :: Alumno -> Nota
    dameNota (Al _ _ nota) = nota

    --APARTADO D: Media de las notas de una lista de alumnos
    mediaNotas :: [Alumno] -> Nota
    mediaNotas [] = 0.0 -- La media de una lista vacía es 0.0 para evitar división por cero.
    mediaNotas lst = sum [nota | Al _ _ nota <- lst] / fromIntegral (length lst)

    