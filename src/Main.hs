module Main where
import Estado
import SintaxisAbstracta 
import Semantica 

e0 = estadoVacio
e1 = semComm Skip e0
e2 = semComm (Asign "nombrevar1" (Menos (Suma (Const 1) (Const 2)))) e1
e3 = semComm (Asign "nombrevar2" (Prod (Suma (Const 20) (Const 10)) (Const 3))) e2

e4 = semComm (VarLocal "nombrevar3" (Const 30) (Asign "nombrevar2" (Dif (Var "nombrevar2") (Var "nombrevar3")))) e3
e5 = semComm (Loop (MenorIgual (Var "nombrevar3") (Var "nombrevar2")) (Secuencia (Asign "nombrevar4" (Suma (Const 1) (Var "nombrevar4"))) (Asign "nombrevar3" (Suma (Const 10) (Var "nombrevar3"))))) e4



main = do 
    print "inicio sim"
    print $ show e0
    print $ show e1
    print $ show e2
    print $ show e3
    print $ show e4
    print $ show e5
    