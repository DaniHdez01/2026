module TiposEnumerados where 
    data Dia = Lunes | Martes | Miercoles | Jueves | Viernes | Sabado | Domingo deriving show

    laborable :: [Dia]
    laborables = [Lunes, Martes, Miercoles, Jueves, Viernes]
    