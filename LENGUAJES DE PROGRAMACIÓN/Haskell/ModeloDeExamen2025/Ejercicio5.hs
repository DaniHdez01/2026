module Inmuebles where 
    type MetrosCuadrados = Int
    type Ascensor = Bool 
    type Planta = Int
    type Precio = Float
    type Barrio = String
    type Localidad = String 
    type NumHabitaciones = Int
    type NumBanyos = Int 
    data Calefaccion = Gas_Natural | Gasoil | Aerotermica | SinCalefaccion
    data Ascensor = Con_Ascensor | Sin_Ascensor
    data DatosBasicos = DB MetrosCuadrados Calefaccion Localidad Barrio Precio deriving Show

    --APARTADO A: DEFINIR LOS TIPOS DE DATOS NECESARIOS PARA Inmueble e Inmobiliaria 
    data Inmueble = IN DatosBasicos deriving Show 
    data Inmobiliaria = IM [Inmueble] deriving Show
    data Piso = PS Inmueble NumBanyos NumHabitaciones Ascensor deriving Show
    data Local = LC Inmueble deriving Show

    --APARTADO B: UNA FUNCIÓN QUE DEVUELVA LA LISTA DE LOS INMUEBLES QUE CONTENGA UNA CALEFACCION DE GAS NATURAL 

        --1 Funcion para saber si un inmueble tiene calefaccion de gas
    calefaccionGas :: Inmueble -> Bool
    --listaInmuebles IM a = [i | i <- a, Calefaccion i = Gas_Natural]
    calefaccionGas (P_ _ _ _(DB_GasNatural___)) = True 
    calefaccionGas (LC(DB _ GasNatural_ _ _)) = True 
    calefaccionGas _ = False 
        --2: Función de plegado utilizando la funcion anterior
    listaInmuebles :: Inmobiliaria -> [Inmueble]
    listaInmuebles (l lista) = foldr(\p acc -> if (calefaccionGas p) then p : acc else acc) [] lista

    --APARTADO C: UNA FUNCIÓN QUE DADO UN PISO O UN LOCAL DEVUELVA SU INFORMACIÓN

    instance Show Inmueble where 
        show i = show (metrosCuadrados i) ++ "metros cuadrados, "
        ++ "calefaccion" ++ show (calefaccion i)
        ++ "en " ++ show (localidad i) ++ "(" ++ show (barrio i) ++ ")"
        ++ "- precio de venta: " ++ show (precio i) ++ "euros"

    instance Show Piso where 
        show p = "Piso de " ++ show(numHabitaciones p) ++ "habitaciones" 
        ++ show(numBanyos p) ++ "baños" 
        ++ show(ascensor p) ++ show(inmueble p)

    instance Show local where 
        show l = "Local comercial de " ++ show (inmueble l)
