module Arbol where 

    -- Dada la siguiente definición de árbol binario 
    data Arbol a = AV | Rama (Arbol a) a (Arbol a) deriving Show

    -- Se pide implementar una función que, dado un árbol de este tipo y un elemento diga si dicho elemento pertenece al árbol. 
    -- Se asume que el árbol no está ordenado.  
    estaEnArbol :: Eq a => a -> Arbol a -> Bool 
    estaEnArbol _ AV = False 
    estaEnArbol e (Rama a r b) = e == r || estaEnArbol e a || estaEnArbol e b 