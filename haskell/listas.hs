{-RECURSIÓN + LISTAS.-}
{-Ejercicio 1. Indicar la longitud de una lista. "Desestructuro" la cabeza por cada iteracion y voy sumando 1 y hago recursion en base a cola de la lista.-}
longitud :: [t] -> Integer 
longitud [] = 0
longitud (_:xs) = 1 + longitud xs

{-Ejercicio 2, dada una secuencia con más de un elemento, obtener el último elemento de la lista. Voy utilizando recursividad hasta quedarme con la cola que tiene un elemento.-}
ultimo :: [t] -> [t] 
ultimo lista | longitud lista == 1 = lista
             | otherwise = ultimo(tail(lista))

{- Ejercicio 3, dada una secuencia, retornar una nueva secuencia de tipo t que vaya desde el indice 0 hasta el anterior a la longitud de la lista. Básicamente devuelvo una copia de la lista-}

principio :: [t] -> [t]
principio lista = subseq (lista) 0 (longitud lista - 1)

{- 
    Función subseq:
    requiere: |lista| > 0 
    Ejemplo: [1, 2, 3, 9] 
    asegura: {res será una lista vacía [] si indiceDesde es menor a 0}
    asegura: {res será una lista vacía [] si indiceHasta es mayor a la longitud de la lista menos uno.}
    asegura: {res será el primer elemento de la lista en caso de que indiceDesde e indiceHasta sean 0}
    asegura: {res será una sublista de lista que tendrá los elementos de lista desde indiceDesde hasta indiceHasta}

    Input: [1, 4, 8] 1 2 
    Output: [4, 8]

    Input: [] 1 2
    Output: []

    Input: [1, 3] 0 0
    Output: head([1, 3]) = [1]

    Input: [1, 5, 6, 2] 1 2 = Tomo la cabeza y creo una nueva lista utilizando el operador : que se genera al utilizar nuevamente la función subseq para continuar añadiendo el resto de los elementos hasta que se alcance el indiceHasta.
    Proceso: Si indiceDesde es distinto de cero, entonces significa que el primer elemento de la lista original no está en la subsecuencia que queremos construir. Por lo tanto, podemos ignorar el primer elemento y crear una nueva subsecuencia que incluya los elementos de la cola de la lista. La nueva subsecuencia tendrá una longitud de indiceHasta - indiceDesde, por lo que establecemos un nuevo indiceDesde de cero y un indiceHasta de indiceHasta - 1.

    Si indiceDesde es cero, entonces eso significa que queremos incluir el primer elemento de la lista original en la subsecuencia resultante. En este caso, se agrega head(lista) a la subsecuencia resultante y se hace una llamada recursiva a subseq con la cola de la lista y con un nuevo indiceDesde de cero y un indiceHasta de indiceHasta - 1.

    En cualquier caso, si indiceDesde es mayor que cero, se hace una llamada recursiva a subseq con la cola de la lista y con un nuevo indiceDesde y indiceHasta disminuidos en uno cada uno. En cada llamada recursiva, se sigue eliminando el primer elemento de la lista hasta que indiceDesde llega a cero, momento en el cual se comienza a agregar elementos a la subsecuencia resultante.
-}

subseq :: [t] -> Integer -> Integer -> [t]
subseq lista indiceDesde indiceHasta | indiceDesde < 0 || indiceHasta < 0 = []
                                     | indiceHasta > longitud(lista)-1 = []
                                     | indiceDesde == 0 && indiceHasta == 0 = [head(lista)]
                                     | indiceDesde == 0 = head(lista) : subseq (tail(lista)) 0 (indiceHasta-1)
                                     | otherwise = subseq (tail(lista)) (indiceDesde-1) (indiceHasta-1) 



