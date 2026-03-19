def main(): 
    try: 
        n = int(input("Escribe un número para dividir 100"))
        if type(n) is not int: 
            raise ValueError("El dato introducido debe ser un número")
        if n == 0: 
            raise ZeroDivisionError("No es posible dividir entre 0")
        else: 
            resultado = 100 / n
            print(f"Resultado: {resultado}")
    except ValueError as Ve: 
        print(f"ERROR: {Ve}")
    except ZeroDivisionError as e: 
        print(f"ERROR: {e}")
    finally:
        print("Fin de ejecución")

main()