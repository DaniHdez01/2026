
import random
import webbrowser

def salirDelJuego(): 
    print("Saliendo del juego")

    
def main(): 
    while 1: 
        opcion = str(input("Pulsa enter para girar el tambor o pon q para salir\n"))
        if opcion == "q": 
            salirDelJuego()
            break
        eleccion = random.randint(1, 6)
        bala = random.randint(1, 6)
        if bala == eleccion: 
            for i in range (1,20): 
                webbrowser.open("https://www.youtube.com/shorts/Ay8lynMZ4mE")
        else: 
            print("Te salvaste")


if __name__ == "__main__": 
    main()