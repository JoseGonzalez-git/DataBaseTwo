# AUTORES
- [Isaac Arrieta Mercado]
- [Jose Alejandro Gonzalez Ortiz]

## Ejercicio 4

1. Obtener, en el departamento 5, los empleados con salarios mayores a $30000.

    Algebra relacional:

    ```
    Π{ssn, fname, lname}(σ{ departament_dnumber = 5 AND salary > 30000}(employe))
    ```
    
    Consulta sql:
    ```sql
    select ssn,fname,lname from employe where departament_dnumber = 5 and salary > 30000 ;
    ```

2. Obtener los nombres de los departamentos que no tienen empleados.

    Algebra relacional:

    ```
    Π{departament . dname}(σ{departament . dnumber = 4}(departament × employe))
    ```
    
    Consulta sql:
    ```sql
    select departament.dname from departament, employe where departament.dnumber = 4  group by dname;
    ```

3. Obtener el nombre y apellido de cada empleado y el ssn de su jefe. 

    Algebra relacional:

    ```
    Π{fname, lname, superssn}(employe)
    ```
    
    Consulta sql:
    ```sql
    select fname, lname, superssn from employe ;
    ```

4. Obtener el nombre de los empleados que ganen más que su jefe.

    Algebra relacional:

    ```

    ```
    
    Consulta sql:
    ```sql

    ```

5. Obtener el nombre de los departamentos que tienen exactamente 2 mujeres en su personal.

    Algebra relacional:

    ```
    
    ```
    
    Consulta sql:
    ```sql

    ```

6. Obtener para cada empleado su nombre y apellido, el nombre del departamento donde trabaja y el nombre de su jefe.

    Algebra relacional:

    ```

    ```
    
    Consulta sql:
    ```sql

    ```