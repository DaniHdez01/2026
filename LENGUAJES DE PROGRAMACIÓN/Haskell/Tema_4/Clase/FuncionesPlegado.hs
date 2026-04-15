module FuncionesPlegado where 

--FORMA 1: Forma recursiva
    fglobal :: [Int,Int] -> Int -> Int
    fglobal []_ = []
    fglobal (f:)fs x = f x :fglobal fs x

--FORMA 2: Funciones de plegado
    fglobalPlegado :: [Int,Int] -> Int -> Int
    fglobalPlegado fs x = foldr(\f lista -> (f x):lista) [] fs
    --foldr Añade por la izquierda a una lista lo que hay dentro 
    -- \f Función lambda -> definición de la función
    --La función itera sobre la lista de la derecha (fs, ya quqe [] es la lista que va a devolver) 
    -- de manera inversa y aplica la función lambda a cada elemento
    -- La manera de añadir con foldr -> fs : [] con foldl -> [] : fs ERRONEO EN ESTE CASO!!