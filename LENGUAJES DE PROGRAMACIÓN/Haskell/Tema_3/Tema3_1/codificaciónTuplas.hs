module Codificacion where 
    -- Se quiere implementar una función que sea capaz de descifrar mensajes de texto que se han cifrado utilizando listas de 2-tuplas de caracteres. 
    -- A la hora de desencriptar el mensaje, el algoritmo funciona de la siguiente forma: dada la 2-tupla (c1, c2), si c2 es una vocal, c1 formará parte del mensaje original. 
    -- En cualquier otro caso c1 será descartado. Se pide, implementar una función en Haskell que, dada una lista de 2tuplas de caracteres (mensaje cifrado), 
    -- devuelva el mensaje de texto desencriptado. Debes utilizar la definición de listas por comprensión
    codificacionTuplas :: [(Char, Char)] -> String
    codificacionTuplas xs = [ c1 | (c1,c2) <- xs, c2 `elem` "aeiouAEIOU" ]