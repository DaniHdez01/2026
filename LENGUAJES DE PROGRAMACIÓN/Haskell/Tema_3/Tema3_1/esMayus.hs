module EsMayus where 
    --  Implementar una función que determine si una letra es mayúscula. No puedes utilizar la función predefinida isUpper.
    esMayus :: Char -> Bool 
    esMayus c = c `elem` ['A'..'Z'] 