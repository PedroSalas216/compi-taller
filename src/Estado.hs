module Estado
    (
        Estado, 
        NombreVar,
        escribirEstado,
        estadoVacio,
        evalEstado  
    )
where
import SintaxisAbstracta (NombreVar)


type Estado = [(NombreVar, Int)]

escribirEstado :: NombreVar -> Int -> Estado -> Estado
escribirEstado var val [] = [(var, val)]
escribirEstado var val ((k,v):estado) | k == var = (var, val) : estado
                              | otherwise = (k,v): escribirEstado var val estado

estadoVacio :: Estado
estadoVacio = []

evalEstado :: Estado -> NombreVar -> Int
evalEstado [] var = 0
evalEstado ((k,v):estado) var | var == k = v
                            | otherwise = evalEstado estado var 


showEstado :: Estado -> String
showEstado = show