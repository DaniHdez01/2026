--Definir el tipo de datos de Alumno y ALumnoDos pero con tipos de datos por producto con sintaxis de registro 

module AlumnoTres where 
    data Alumno = Al {dni :: String, 
                    expediente :: Int,
                    nota :: Float }

--APARTADO A: Funcion para saber si un alumno está aprobado 
    aprobado :: Alumno -> Bool
    aprobado a = nota a >= 5.0

-- APARTADO B: Calificación de alumno 
    califiacionAUX Float -> String 
    calificacionAUX n 
     | n < 5.0 = "Suspenso"
     | n >= 5.0 && n < 7.0 = "Aprobado"
     | n >= 7.0 && n < 9 = "Notable"
     | otherwise = "Sobresaliente"

    