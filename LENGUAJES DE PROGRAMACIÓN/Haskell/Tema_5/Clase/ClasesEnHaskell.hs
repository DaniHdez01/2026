module Clases where 
    --Dada la siguiente declaración: 
    data Arbol a = AV | Rama (Arbol a) a (Arbol a) deriving show 
    --Crear una función que diga si dos árboles son iguales 
    arbolesIguales :: Eq a => Arbol a -> Arbol a -> Bool 
    arbolesIguales AV AV = True 
    arbolesIguales (Rama l1 v1 r1) (Rama l2 v2 r2) =
        v1 == v2 && arbolesIguales l1 l2 && arbolesIguales r1 r2
    -- Si los árboles no son ambos vacíos o ambos ramas, entonces no son iguales.
    -- Esto cubre casos como AV vs Rama, o Rama vs AV.
    arbolesIguales _ _ = False

    