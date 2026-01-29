import random 

def ganador(): 
    print("GANASTE!")
    return 1
def perdedor(): 
    print("PERDISTE GAY JAJAJAJA")
    return 0

def piedraPapelTijeras(): 
    jugadas = ['piedra', 'papel', 'tijera']
    while 1: 
        jugador = str(input("Elije piedra papel o tijera\n"))
        i = random.randint(0,2)
        jugadaIA = jugadas[i]
        if jugador not in jugadas: 
            print("Error" + jugador + "no es una jugada valida")
        if jugadaIA == 'piedra': 
            if jugador == 'papel':
               return ganador()
            elif jugador == 'tijera': 
               return perdedor()
            else: 
                print("EMPATE\n")
        elif jugadaIA == 'papel': 
            if jugador == 'tijera': 
               return ganador()
            elif jugador == 'piedra': 
               return perdedor()
            else: 
                print("EMPATE\n")
        else: 
            if jugador == 'piedra': 
               return perdedor()
            elif jugador == 'tijera': 
                return ganador()
            else: 
                print("EMPATE\n")
            
def juego(pMax):
    pJugador = 0
    pIA = 0
    while pJugador < pMax and pIA < pMax: 
        resultado = piedraPapelTijeras()
        if resultado == 1: 
            pJugador +=1
        else: 
            pIA += 1
        print("Marcador" + str(pJugador) + "-" + str(pIA))
    if pJugador == pMax: 
        print("felicidades, has ganado")
    else: 
        print("Has perdido por gay jajajjaa pa la lobby")

def main(): 
    print("Bienvenido a piedra papel o tijeras")
    pMax=int(input("Establece una puntuacion maxima: "))
    juego(pMax)

if __name__ == "__main__": 
    main()