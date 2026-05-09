module Arbol where 
    data Arbol a = AV | Rama (Arbol a) a (Arbol a) deriving show

    arbolPar :: Arbol a -> Int -> Int-> Bool
    arbolPar AV i p = if i > p then False else True 
    arbolPar Rama (AV x AV) i, p = 