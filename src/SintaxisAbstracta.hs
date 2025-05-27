module SintaxisAbstracta 
    (
        NombreVar, IntExp (..), BoolExp(..), Comm(..)
    ) 
where

type NombreVar = String

data IntExp = Var NombreVar 
            | Const Int 
            | Menos IntExp 
            | Suma IntExp IntExp 
            | Dif IntExp IntExp 
            | Prod IntExp IntExp
            | Div IntExp IntExp 
            | Mod IntExp IntExp

data BoolExp = Verdadero
            | Falso
            | No BoolExp
            | Igual IntExp IntExp
            | Menor IntExp IntExp
            | Mayor IntExp IntExp
            | MenorIgual IntExp IntExp
            | MayorIgual IntExp IntExp
            | Y BoolExp BoolExp
            | O BoolExp BoolExp

data Comm = Skip
            | Asign NombreVar IntExp
            | Secuencia Comm Comm
            | Condicional BoolExp Comm Comm
            | Loop BoolExp Comm
            | VarLocal NombreVar IntExp Comm
