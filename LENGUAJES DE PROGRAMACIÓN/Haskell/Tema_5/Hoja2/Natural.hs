module Natural where 
    -- Dada la siguiente definición para el tipo Natural 
    data Natural = Cero | Suc Natural deriving Show 

    -- Se pide: 
    --APARTADO A: Definir una función para sumar naturales

    sumaNatural :: Natural -> Natural -> Natural 
    sumaNatural Cero (Suc x)  = x 
    sumaNatural (Suc x) y = Suc (sumaNatural x  y)

    --APARTADO B: Definir una función de resta 
    restaNatural :: Natural -> Natural -> Natural 
    restaNatural (Suc x) Cero = x
    restaNatural Cero (Suc x) = Cero
    restaNatural (Suc x) y = restaNatural x y --Diferencia con el primero no llamamos al constructor Suc 

    
