import random

class FondosInsuficientes(Exception): 
    "Fondos insuficientes, realice una apuesta menor"
    pass
class SinFondos(Exception): 
    "No hay fondos, has perdido"

def comprobarApuesta(saldo, apuesta): 
    if saldo < apuesta: 
        raise FondosInsuficientes("Fondos insuficientes, realice una apuesta menor")
def comprobarFondos(saldo): 
    if saldo == 0: 
        raise SinFondos("No hay fondos disponibles, has perdido")
def pedirCarta(): 
    return random.randint(1,11)

def ronda(jugado):
    sumadoJugador = pedirCarta()
    sumadoCrupier = pedirCarta()
    while sumadoJugador <= 21  and sumadoCrupier <=21: 
        print("Tu puntuacion es: "+str(sumadoJugador))
        print("Puntuacion del crupier "+str(sumadoCrupier))
        decision = int(input("1: pedir una carta\n 2: plantarse "))
        if decision == 2: 
            sumadoCrupier += pedirCarta()
            break
        else: 
            sumadoCrupier += pedirCarta()
            sumadoJugador +=pedirCarta()

    if sumadoJugador <= 21: 
        if sumadoJugador == sumadoCrupier: 
            print("Empate, recuperas el importe apostado")
            return jugado
        elif sumadoJugador > sumadoCrupier or sumadoCrupier > 21: 
            print("Ganaste")
            return jugado * 2
        else: 
            print("La banca gana, la apuesta se pierde")
            return 0
    else: 
        print("Has perdido, te pasaste de 21")
        return 0
    
def juego(saldo):
    while saldo > 0: 
        apuesta = int(input("Empieza la ronda, establece una apuesta o -1 para salir: "))
        if apuesta == -1: 
            break
        try: 
            comprobarApuesta(saldo, apuesta)
            saldo -= apuesta
            apuesta = ronda(apuesta)
            saldo += apuesta
            print("Tu nuevo saldo " + str(saldo))
        except FondosInsuficientes as e:
            print(f"ERROR: {e}")
        try: 
            comprobarFondos(saldo)
            print("Nueva ronda: \n")
        except SinFondos as e:
            print(f"SE ACABÓ: {e}")
            break       
        
def main(): 
    saldoInicial = int(input("Cuanto dinero deseas jugar: "))
    juego(saldoInicial)

if __name__ == "__main__": 
    main()
