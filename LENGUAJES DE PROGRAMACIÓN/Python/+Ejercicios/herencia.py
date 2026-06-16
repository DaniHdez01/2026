#2. Herencia y uso de super() (POO)
#Objetivo: Comprender cómo heredar atributos y métodos de una clase padre.

#Crea una clase Vehiculo con los atributos marca y modelo.

#Crea una clase Coche que herede de Vehiculo y añada un nuevo atributo llamado num_puertas.

#Asegúrate de invocar al constructor de la clase padre desde Coche utilizando la función super().

class Vehiculo: 
    def __init__(self, marca, modelo): 
        self.marca = marca
        self.modelo = modelo
    
class Coche(Vehiculo): 
    def __init__(self,marca, modelo, num_puertas): 
        super().__init__(marca, modelo)
        self.num_puertas = num_puertas
    def __str__(self):
        return f"Nombre del vehiculo: {self.marca} \n Modelo: {self.modelo} \n numero de puertas {self.num_puertas}"

    def print(self): 
        print(self.__str__()) 

def main(): 
    marca = "Nissan"
    modelo = "Micra"
    num_puertas = 5

    micra = Coche(marca, modelo, num_puertas)
    print(micra)

main()