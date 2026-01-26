from collections import defaultdict

def salarios_por_departamento(empleados):
    """
    Agrupa los salarios de los empleados por departamento.

    Args:
        empleados (list): Una lista de diccionarios, donde cada diccionario representa un empleado.

    Returns:
        dict: Un diccionario con los departamentos como claves y una lista de salarios como valores.
    """
    salarios_agrupados = defaultdict(list)
    for empleado in empleados:
        salarios_agrupados[empleado['departamento']].append(empleado['salario'])
    return dict(salarios_agrupados)

def main(): 
    empleados = [
{'nombre': 'Juan', 'departamento': 'Ventas', 'salario': 50000},
{'nombre': 'Ana', 'departamento': 'Ventas', 'salario': 60000},
{'nombre': 'Carlos', 'departamento': 'IT', 'salario': 70000},
{'nombre': 'Luis', 'departamento': 'IT', 'salario': 80000},
{'nombre': 'Marta', 'departamento': 'Recursos Humanos', 'salario': 55000},
{'nombre': 'Sofia', 'departamento': 'Recursos Humanos', 'salario': 60000},
]
    salarios_agrupados = salarios_por_departamento(empleados)
    print("Salarios agrupados por departamento:")
    print(salarios_agrupados)

# Se asegura de que el código en main() solo se ejecute cuando el script es el programa principal.
if __name__ == "__main__":
    main()