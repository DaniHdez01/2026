import random 
from Ejercicio2 import hist 
from Ejercicio2 import print_histogram

def main(): 
    random.seed(42) # Establece la semilla para obtener siempre los mismos números aleatorios de cara a depurar 
    random_numbers = [random.randint(0, 20) for _ in range(1000)]
    histogram = hist(random_numbers)
    print_histogram(histogram)

if __name__ == "__main__": 
    main()