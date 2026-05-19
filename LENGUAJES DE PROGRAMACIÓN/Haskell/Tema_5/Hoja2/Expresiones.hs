module Expresiones where 
    data Expr  = Valor Integer  |Expr :+: Expr  |Expr :-: Expr  |Expr :*: Expr deriving Show  

    valorExpr :: Expr -> Int
    valorExpr (a :+:  b) = valorExpr a + valorExpr b
    valorExpr (a :-: b) = valorExpr a -valorExpr b
    valorExpr (a:*: b) = valorExpr a * valorExpr b

    constantesExpr :: Expr -> Int
    constantesExpr (Valor a) = 1
    constantesExpr (a :+: b) = constantesExpr a + constantesExpr b
    constantesExpr (a :-: b) = constantesExpr a + constantesExpr b
    constantesExpr (a :*: b) = constantesExpr a + constantesExpr b

    operadoresExpr :: Expr -> Int 
    operadoresExpr (Valor a) = 0
    operadoresExpr (a :+: b) = 1 +operadoresExpr a + operadoresExpr b 
    operadoresExpr (a :-: b) = 1 +operadoresExpr a + operadoresExpr b 
    operadoresExpr (a :*: b) = 1 +operadoresExpr a + operadoresExpr b 

