import random
import time
def main(): 
    opcion = int(input("¿Cuantos dados vás a tirar?: "))
    total = 0; 
    for i in range(0, opcion):
        salida = random.randint(1, 6)
        print(salida)
        total += salida
        time.sleep(0.3)
    print("Has sacado un: "+ str(total))
if __name__ == "__main__": 
    main()