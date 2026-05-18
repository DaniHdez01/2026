module Complejos where 
    data Complejo = Com Float Float deriving Show 

    --APARTADO A: Devolver la parte real de un número complejo 

    parteReal :: Complejo -> Float
    parteReal (Com real _) = real

    --APARTADO B: Sumar dos numeros complejos 

    sumaComplejos :: Complejo -> Complejo -> Complejo 
    sumaComplejos (Com r1 i1) (Com r2 i2) = (Com (r1 + r2) (i1 + i2))

    --IMPORTANTE: ACUERDATE DE LOS CONSTRUCTORES 