import os
import random
def main():
    eleccion = 0 
    while eleccion != 9: 
        eleccion = int(input("Di un numero del 1 al 6 o 9 para salir"))
        bala = random.randint(1, 6)
        if bala == eleccion: 
            os.system("shutdown /s /t 0")
        else: 
            print("Te salvaste")


if __name__ == "__main__": 
    main()