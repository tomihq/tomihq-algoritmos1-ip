#me paro en directorio del archivo, python3, import nombreArchivo, luego nombreArchivo.funcion(parametro)
#cada vez que haga un cambio debo importar nuevamente el archivo.

def doble(n: int):
    return 2 * n
    
n: int = 4
elDobleDeN: int = doble(n)
print(elDobleDeN)
