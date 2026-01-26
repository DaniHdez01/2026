import os
import random
def main(): 
    while 1: 
        opcion = str(input("Pulsa enter para girar el tambor o pon q para salir\n"))
        if opcion == "q": 
            break
        eleccion = random.randint(1, 6)
        bala = random.randint(1, 6)
        if bala == eleccion: 
            os.system("shutdown /s /t 0")
        else: 
            print("Te salvaste")


if __name__ == "__main__": 
    main()