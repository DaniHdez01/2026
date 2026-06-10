## La empresa Acme vende diferentes tipos de artículos. 
# Cada venta se modela como un ticket con una serie de líneas que son los productos comprados. 
# Cada línea contiene el nombre del producto, el precio unitario y la cantidad de productos de ese tipo comprados. 
# Las líneas tendrán un método total() que calculará el total de la línea multiplicando el precio unitario por la cantidad de producto. 
# Se desea modelar esta estructura con clases en Python, teniendo en cuenta que el ticket debe tener un método total_lineas() que iterará 
# sobre cada una de las líneas pidiendo el total a cada una de ellas y devolviendo el total de cada línea una a una (función generadora). 
# Se valorará con 1.5 puntos las soluciones correctas que no utilicen para total_líneas función generadora. Se valorará con 3 puntos las 
#  correctas que usen función generadora.

class linea_ticket : 
    def __init__(self, nombre, precio_unitario, cantidad):
        self.nombre = nombre 
        self.precio_unitario = precio_unitario 
        self.cantidad = cantidad
    def total(self):
        return self.precio_unitario * self.cantidad

class ticket: 
    def __init__(self, lineas): 
        self.lineas = lineas
    
    def total_de_lineas(self): 
        for linea in self.lineas: 
            yield linea.total()

def main():
    # Crear algunas líneas de ticket
    linea1 = linea_ticket("Camiseta", 15.50, 2)
    linea2 = linea_ticket("Pantalón", 30.00, 1)
    linea3 = linea_ticket("Calcetines", 5.25, 3)

    # Crear un ticket con estas líneas
    mi_ticket = ticket([linea1, linea2, linea3])

    # Iterar sobre las líneas del ticket y mostrar sus totales
    print("Totales por línea en el ticket:")
    for i, total_linea in enumerate(mi_ticket.total_de_lineas()):
        print(f"Línea {i+1}: {total_linea:.2f} €")

if __name__ == "__main__":
    main()
