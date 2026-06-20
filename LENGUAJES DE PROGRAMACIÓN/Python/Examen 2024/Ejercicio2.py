#[2 puntos] La información correspondiente a los empleados de una empresa se encuentra
#almacenada en una lista de diccionarios como la siguiente:
from collections import defaultdict


empleados = [
 {'nombre': 'Juan', 'departamento': 'Ventas', 'salario': 50000},
 {'nombre': 'Ana', 'departamento': 'Ventas', 'salario': 60000},
 {'nombre': 'Carlos', 'departamento': 'IT', 'salario': 70000},
 {'nombre': 'Luis', 'departamento': 'IT', 'salario': 80000},
 {'nombre': 'Marta', 'departamento': 'Recursos Humanos', 'salario': 55000},
 {'nombre': 'Sofia', 'departamento': 'Recursos Humanos', 'salario': 60000},
]
#Cada diccionario contiene información sobre el nombre del empleado, su departamento y su salario.
#Desarrollar una función en python que permita agrupar los salarios por departamento en un
#diccionario:
#{'Recursos Humanos': [55000, 60000], 'Ventas': [50000, 60000], 'IT': [70000, 80000]}
#La función debe respetar el siguiente interfaz:
 #def salarios_por_departamento(empleados):
#y devolver un diccionario que contenga los salarios agrupados por departamento.
#Se requiere el uso de compresión para resolver el ejercicio. El código desarrollado debe ser lo
#suficientemente general como para soportar cualquier listado de empleados, no solo el facilitado
#como ejemplo. 
def diccionario_departamentos(): 
    departamentos = defaultdict(list)
    for empleado in empleados: 
        departamentos[empleado['departamento']].append(empleado['salario'])
    print(departamentos)

diccionario_departamentos()
        
        


            
