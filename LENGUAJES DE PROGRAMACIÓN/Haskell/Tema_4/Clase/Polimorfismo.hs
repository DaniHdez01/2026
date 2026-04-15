module Polimorfismo where 

    dosVeces :: (a->a) ->a ->a
    dosVeces f a = f (f a)


    --Una función dada 2 listas de tuplas que pueden ser de cualquier tipo tienes que devolver una lista de tuplas de tuplas 
    mezclar :: [(a, b)] -> [(c, d)] -> [((a, c), (b, d))]
    mezclar _ [] = []
    mezclar [] _ = []
    mezclar ((a,b):xs) ((c,d):ys) = ((a,c),(b,d)) : mezclar xs ys


    --Aplica una función a una lista entera de valores de manera polimórfica
    incognita :: (a -> b) -> [a] -> [b]
    incognita f _ = [] 
    incognita f (x:xs) = f x : incognita f xs