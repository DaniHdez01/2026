
import time

class Alumno: 
    def __init__(self, nombre): 
        self.nombre = nombre
    def getNombre(self): 
        return self.nombre
class Profesor: 
    def __init__(self, nombre): 
        self.nombre = nombre

    def getNombre(self): 
        return self.nombre

class Asignatura: 
    def __init__(self, nombre, profesor): 
        self.alumnos = []
        self.profesor = profesor
        self.nombreAsig = nombre

    def getDatosAsignatura(self):
        datos = f"Asignatura: {self.nombreAsig} \n Profesor: {self.profesor.getNombre()}\n Alumnos:"
        for alumno in self.alumnos: 
            datos += f"\n  - {alumno.getNombre()}" # Concatenar nombres de alumnos
        return datos
    
    def agregarAlumno(self, alumno): 
        if isinstance (alumno, Alumno): 
            self.alumnos.append(alumno)

class Titulacion: 
    def __init__(self, asignatura, nombre): 
        self.asignaturas = asignatura
        self.nombre = nombre
    def getDatosTitulacion(self): 
        # Se asume que self.asignaturas es un objeto Asignatura y se accede a su nombre
        #IMPORTANTE, definir los strings como f"" para acceder a las variables de otras clases
        # 
        datos = f"Nombre de titulación: {self.nombre} \n Asignaturas: {self.asignaturas.nombreAsig if self.asignaturas else 'Ninguna'}"
        return datos

class Universidad: 
    def __init__(self, nombre, titulacion):
        self.nombre = nombre 
        self.titulaciones = titulacion
    def getDatosUni(self): 
        # Se corrige el typo 'tiutulacion' y se llama al método getDatosTitulacion()
        datos = f"Nombre de universidad: {self.nombre} \n Titulaciones: {self.titulaciones.getDatosTitulacion() if self.titulaciones else 'Ninguna'}"
        return datos


def main(): 

    #Crear los alumnos
    letras_para_alumnos = "ABCDEFGHIJKLMNOP" # Se corrige la cadena para evitar comas y espacios
    alumnos = []
    for letra in letras_para_alumnos: # Se itera directamente sobre las letras
        alumnoNuevo = Alumno(letra) 
        alumnos.append(alumnoNuevo)
    time.sleep(1) # Pausa de un segundo después de crear los alumnos

    #Crear profesor
    print("Profesor contratado: ")
    alfredo = Profesor("Alfredo Duro")
    print(alfredo.getNombre())
    time.sleep(1) 

    asignatura = Asignatura("Mates", alfredo)
    for alumno in alumnos: 
        asignatura.agregarAlumno(alumno)
    print("Asignatura creada:\n" + asignatura.getDatosAsignatura())
    time.sleep(1) 

    titulacion = Titulacion(asignatura, "Ciencias matemáticas")
    print("Titulación creada:\n" + titulacion.getDatosTitulacion())
    time.sleep(1)

    # Se corrige el orden de los argumentos para el constructor de Universidad
    universidad = Universidad("Universidad Rey Juan Carlos", titulacion) # Se invierten los argumentos para que coincidan con __init__
    print("Universidad creada:\n" + universidad.getDatosUni())

if __name__ == "__main__":
    main() 