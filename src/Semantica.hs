module Semantica (semIntexp, semBoolexp, semComm)
where
import SintaxisAbstracta (IntExp(..), BoolExp (..), Comm(..))
import Estado as Es


semIntexp :: SintaxisAbstracta.IntExp -> Es.Estado -> Int
semIntexp (Var v) estado    = Es.evalEstado estado v
semIntexp (Const i) estado  = i
semIntexp (Menos e) estado  = - (semIntexp e estado)
semIntexp (Suma a b) estado = semIntexp a estado + semIntexp b estado
semIntexp (Dif a b) estado  = semIntexp a estado - semIntexp b estado
semIntexp (Prod a b) estado = semIntexp a estado * semIntexp b estado
semIntexp (Div a b) estado  = div (semIntexp a estado) (semIntexp b estado)
semIntexp (Mod a b) estado  = mod (semIntexp a estado) (semIntexp b estado)


semBoolexp :: SintaxisAbstracta.BoolExp -> Es.Estado -> Bool
semBoolexp Verdadero estado             = True
semBoolexp Falso estado                 = False
semBoolexp (No exp) estado              = not (semBoolexp exp estado)
semBoolexp (Igual a b) estado           = semIntexp a estado == semIntexp b estado
semBoolexp (Mayor a b) estado           = semIntexp a estado >  semIntexp b estado
semBoolexp (Menor a b) estado           = semIntexp a estado <  semIntexp b estado
semBoolexp (MenorIgual a b) estado      = semIntexp a estado <= semIntexp b estado
semBoolexp (MayorIgual a b) estado      = semIntexp a estado >= semIntexp b estado
semBoolexp (Y p q) estado               = semBoolexp p estado && semBoolexp q estado
semBoolexp (O p q) estado               = semBoolexp p estado || semBoolexp q estado


semComm :: SintaxisAbstracta.Comm -> Es.Estado -> Es.Estado
semComm Skip estado                     = estado
semComm (Asign var exp) estado          = escribirEstado var (semIntexp exp estado) estado
semComm (Secuencia c0 c1) estado        = semComm c1 ( semComm c0 estado)

semComm (Condicional b c0 c1) estado =
    if semBoolexp b estado then semComm c0 estado else semComm c1 estado 

semComm (Loop b c) estado = 
    if semBoolexp b estado 
    then semComm (Loop b c) (semComm c estado)
    else estado

semComm (VarLocal var exp c) estado = 
    escribirEstado var (evalEstado estado var) (semComm c (escribirEstado var (semIntexp exp estado) estado))

