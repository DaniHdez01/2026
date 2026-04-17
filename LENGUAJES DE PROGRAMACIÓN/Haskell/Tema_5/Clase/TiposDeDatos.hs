module Aprobado where 
    --Ahora cogiendo los sinónimos de tipos del anterior ejercicio vamos a definir un tipo nuevo de datos 
    type Nombre = String
    type DNI = String 
    type Nota = Float
    --El tipo de datos se declara llamando al constructor y estableciendo los datos dentro con su tipo
    data Alumno = A {nombre ::Nombre, dni::DNI, nota :: Nota}

    aprobado :: Alumno -> Bool 
    --Ahora no hay que descomponer los datos, si no llamar al atributo que queremos con su constructor
    aprobado alumno = nota alumno >= 5.0