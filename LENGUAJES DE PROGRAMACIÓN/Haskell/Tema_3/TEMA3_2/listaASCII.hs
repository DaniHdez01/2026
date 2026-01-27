module ListaASCII where 

    listaASCII :: String -> [Int]

    listaASCII cs = [fromEnum c | c<-cs]