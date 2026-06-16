class Plato: 
    def __init__(self, nombre, precio, cantidad):
        self.nombre = nombre
        self.precio = precio
        self.cantidad = cantidad
    
    def precioTotal(self): 
        return self.cantidad * self.precio
    
class Pedido: 
    def __init__(self, platos): 
        self.platos = platos

    def generar_cuenta(self): 
        for plato in self.platos: 
            yield plato
        