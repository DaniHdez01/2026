module Arboles where 

    data Arbol a = AV | Rama (Arbol a) a (Arbol a)

    esHoja :: Arbol a -> Bool 
    esHoja (AV) = False --Caso base que el arbol sea vacio 
    esHoja (Rama AV _ AV) = True --Comprobación de condición. El nodo NO TIENE RAMAS 
    esHoja _ = False --Cualquier otro caso = FALSE 

    nHojas :: Arbol a -> Int 
    nHojas AV = 0
    nHojas (Rama AV _ AV) = 1
    nHojas (Rama a _ c) = 1 + nHojas a + nHojas c
