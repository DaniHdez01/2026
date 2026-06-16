#1. Clases y Métodos Mágicos (POO)
#Objetivo: Practicar la creación de clases, el uso de self, el constructor __init__ y el método __str__.

#Crea una clase llamada Libro que reciba en su constructor el titulo, el autor y el número de paginas.

#Implementa el método mágico __str__ para que, al imprimir el objeto, devuelva un texto con el formato: "El libro [titulo], escrito por [autor], tiene [paginas] páginas".

class Libro :
    def __init__(self, titulo, autor, paginas): 
        self.titulo = titulo 
        self.autor = autor
        self.paginas = paginas 
    def __str__(self): 
        return f"Libro {self.titulo} escrito por {self.autor} con {self.paginas} páginas"
    
    def imprimir(self):
        print(self.__str__())

def main(): 
    titulo = "Capitan Alatriste"
    autor = "Arturo Perez Reverte"
    paginas = 600
    titulo = "Capitan Alatriste" #
    autor = "Arturo Perez Reverte" #
    paginas = 600 #

    libro = Libro(titulo, autor, paginas)
    libro = Libro(titulo, autor, paginas) #
    print(libro) # Imprime la información del libro usando el método __str__
    libro.imprimir() # También puedes usar el método imprimir que ahora funciona correctamente

main()