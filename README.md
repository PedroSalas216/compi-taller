# Informe
Para este taller, primero me largue a escribir haskell hasta que me di cuenta que no se me compartian los módulos entre archivos, luego encontre cabal, instalé cabal, y logre que se importen bien las cosas. 

En cuanto a decisiones de diseño, decidí utilizar una lista de tuplas para representar el estado. La forma en la que está hecho, es una funcion total constante 0, hasta que se haga alguna asignación. De esta forma siempre se puede consultar el valor de las variables (0)
La forma de representar bottom es colgarse. (podría implementar un limite de ciclos y liftear el resultado usando Maybe Estado, pero por ahora queda esto)

Queda hacer un mecanismo explicito para que no haya captura de variables pero no se me ocurrre. 

Implementé todos los comandos de Lis, pero me dan ganas de probar que tan dificil es hacer input output. 