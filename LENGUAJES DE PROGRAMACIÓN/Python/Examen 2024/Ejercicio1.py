## Dada la siguiente clase que representa una colección de libros en una biblioteca:
class Biblioteca:
 
    def __init__(self):
        self.libros = []

    def agregar_libro(self, libro):
        self.libros.append(libro)
    def __str__(self):
        return f'Biblioteca con {len(self.libros)} libros.'
#Añade los métodos necesarios para convertir esta clase en iterable. Esto significa que se deben
#implementar los métodos necesarios para que los objetos de la clase Biblioteca puedan ser utilizados
#en un bucle for, o con cualquier otra construcción que requiera un iterable. A continuación, se añade
#un ejemplo de uso de la funcionalidad requerida:
#b = Biblioteca()
#b.agregar_libro('El principito')
#b.agregar_libro('El señor de los anillos')
#b.agregar_libro('El código da Vinci') 

    def __getitem__(self, key):
        return self.libros[key]

