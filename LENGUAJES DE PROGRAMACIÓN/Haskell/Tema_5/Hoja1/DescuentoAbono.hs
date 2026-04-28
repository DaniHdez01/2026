module Descuento where 

    type Nombre = String 
    type Edad = Int 

    type Persona = (Nombre, Edad)

    descuentoAbono :: Persona -> Bool 
    descuentoAbono (nombre, edad) = edad >= 65