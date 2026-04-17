module Matriz where 

    type Rows = Int
    type Cols = Int 

    data Matriz = M {rows :: Rows, cols :: Cols}

    tamanyo :: Matriz -> String 
    tamanyo matriz = "Matriz de: " ++ show (rows matriz) ++ " filas y " ++ show (cols matriz) ++ " columnas"
    --HACERLO EN CASA HACIENDO UNA LISTA DE LISTAS

    