import random
import time
def main(): 
    opcion = int(input("¿Cuantos dados vás a tirar?: "))
    total = 0
    for i in range(0, opcion):
        salida = random.randint(1, 6)
        duracion = 0.8
        fin_tiempo = time.time() + duracion
        while time.time() < fin_tiempo: 
            azar = random.randint(1,6)
            print(f"{azar}", end = "\r", flush = True)
            time.sleep(0.08)
        print(salida)
        total += salida
    print("Has sacado un: "+ str(total))
if __name__ == "__main__": 
    main()