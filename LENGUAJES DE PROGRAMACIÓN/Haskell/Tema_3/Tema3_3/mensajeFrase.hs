module MensajeFrase where 


    mensajeFrase :: String -> String 
    mensajeFrase cs = "La primera letra es " ++ [head cs] ++ " y la última es " ++ [last cs] 