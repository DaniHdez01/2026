module Alumnos where 
    --Un tipo de datos solo es una redefinición de un tipo
    type Nombre = String
    type DNI = String 
    type Nota = Float

    type Alumno = (Nombre, DNI, Nota)

    --Función para probar los tipos de datos 
    aprobado :: Alumno -> Bool 
    aprobado (_,_,nota) = nota >= 5.0 
    
    --Otra función que haga listas de tipos de alumnos
    listaAprobados :: [Alumno] -> [Alumno]
    lsitaAprobados ls = [alumno | alumno <- ls, aprobado alumno]