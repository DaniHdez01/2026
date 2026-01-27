module MayusculaMinuscula where 

import Data.Char (isUpper, toLower, toUpper)

mayusculaMinuscula :: String -> String 
mayusculaMinuscula xs = [if isUpper c then toLower c else toUpper c | c <- xs]