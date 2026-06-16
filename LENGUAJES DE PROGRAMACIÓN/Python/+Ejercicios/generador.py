def main(): 
    n_str = input("Introduce un número: ") #
    try: #
        n = int(n_str) #
    except ValueError: #
        print("Entrada inválida. Por favor, introduce un número entero.") #
        return #

    for i in range(0, n): #
        if (i % 2 == 0): #
            yield i #

if __name__ == "__main__": #
    for num_par in main(): #
        print(num_par) #