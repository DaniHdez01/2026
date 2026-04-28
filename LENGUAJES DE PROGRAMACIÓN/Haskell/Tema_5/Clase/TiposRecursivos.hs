module Operaciones where 
-- Definición del tipo de datos Expr: Se ha definido un tipo de datos algebraico llamado Expr que representa expresiones aritméticas simples.

-- Valor Integer: Representa un valor numérico entero. Es el caso base de una expresión, no contiene operaciones.
-- Expr :+: Expr: Representa una operación de suma entre dos subexpresiones.
-- Expr :-: Expr: Representa una operación de resta entre dos subexpresiones.
-- Expr :*: Expr: Representa una operación de multiplicación entre dos subexpresiones. La cláusula deriving show permite que las expresiones de este tipo puedan ser mostradas como cadenas de texto
    data Expr = Valor Integer 
                | Expr :+: Expr
                | Expr :-: Expr 
                | Expr :*: Expr deriving show 

    contarOps :: Expr -> Int
    --Caso base: La función solo recibe un valor por lo que no se puede operar -> 0 OPERACIONES 
    contarOps (Valor _) = 0
    --Caso recursivo, recibe 2 operandos 
    contarOps (op1 :+: op2) = 1 + contarOps op1 + contarOps op2
    contarOps (op1 :-: op2) = 1 + contarOps op1 + contarOps op2
    contarOps (op1 :*: op2) = 1 + contarOps op1 + contarOps op2

            