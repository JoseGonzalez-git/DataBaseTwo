# AUTORES
- [Isaac Arrieta Mercado]
- [Jose Alejandro Gonzalez Ortiz]

## Ejercicio 2

1. Encuentre a todos los miembros del personal cuyo nombre empiece por 'C'.

    Algebra relacional:

    ```
    Π{apellido}(σ{apellido LIKE 'C%'}(plantilla))
    ```
    
    Consulta sql:
    ```sql
    select apellido from plantilla where upper(apellido) like 'C%' ;
    ```

2. ¿Quiénes son las enfermeras y enfermeros que trabajan en turnos de Tarde o Mañana?

    Algebra relacional:

    ```
    Π{apellido}(σ{funcion = 'ENFERMERO' OR  funcion = 'ENFERMERA'  AND (turno = 'T' OR turno = 'M')}(plantilla))
    ```
    
    Consulta sql:
    ```sql
    select apellido from plantilla where upper(funcion) in ('ENFERMERO' ,'ENFERMERA') and upper(turno) in ('T','M');
    ```

3. Haga un listado de las enfermeras que ganan entre $2.000.000 y $2.500.000.

    Algebra relacional:

    ```
    Π{apellido, salario}(σ{2000000 ≤ salario AND salario ≤ 2500000 AND funcion = 'ENFERMERA' }(plantilla))
    ```
    
    Consulta sql:
    ```sql
    select apellido, salario from plantilla where salario between 2000000 and 2500000 and upper(funcion)= 'ENFERMERA';
    ```

4. Mostrar, para todos los hospitales, el código de hospital, el nombre completo del hospital y su nombre abreviado de tres letras (a esto podemos llamarlo ABR) Ordenar la recuperación por esta abreviatura.

    Algebra relacional:

    ```
    Π{substr(nombre,1,3) abr, hospital_cod, nombre}(hospital)
    ```
    
    Consulta sql:
    ```sql
    select substr(nombre,1,3) abr, hospital_cod, nombre from hospital order by 1;
    ```

5. Hacer un listado de los nombres de los pacientes y la posición de la primera letra 'A' que aparezca en su apellido, tomando como referencia la primera letra del mismo.

    Algebra relacional:

    ```
    Π{apellido, apellido, "A", "PRIMERA LETRA A"}(enfermo)
    ```
    
    Consulta sql:
    ```sql
    select apellido, INSTR(apellido,"A") "PRIMERA LETRA A" from enfermo;
    ```

6. Para cada empleado se pide que salga su salario total (salario mas comisión) y luego su salario fragmentado, es decir, en centenas de mil, decenas de mil... decenas y unidades. La salida debe estar ordenada por el salario y el apellido descendentemente.

    Algebra relacional:

    ```
    Π{apellido, salario+ifnull(comision,""),
    substr(salario+ifnull(comision,""),1,1),
    substr(salario+ifnull(comision,""),2,1),
    substr(salario+ifnull(comision,""),3,1),
    substr(salario+ifnull(comision,""),4,1),
    substr(salario+ifnull(comision,""),5,1),
    substr(salario+ifnull(comision,""),6,1)}(emp)
    ```
    
    Consulta sql:
    ```sql
    select apellido, salario+ifnull(comision,"") sal_total,
    substr(salario+ifnull(comision,""),1,1) c,
    substr(salario+ifnull(comision,""),2,1) d,
    substr(salario+ifnull(comision,""),3,1) m,
    substr(salario+ifnull(comision,""),4,1) c,
    substr(salario+ifnull(comision,""),5,1) d,
    substr(salario+ifnull(comision,""),6,1) u
    from emp
    order by 2 desc, 1;
    ```

7. Para cada empleado que no tenga comisión o cuya comisión sea mayor que el 15% de su salario, se pide el salario total que tiene. Este será: si tiene comisión su salario más su comisión, y si no tiene, su salario más su nueva comisión (15% del salario).   La salida deberá estar ordenada por el oficio y por el salario que le queda descendentemente.

    Algebra relacional:

    ```
    Π{apellido, oficio, salario+coalesce(comision,salario*0.15) salario_total}(σ{comision = 0 or comision > salario*0.15}(emp))
    ```
    
    Consulta sql:
    ```sql
    select apellido, oficio, salario+coalesce(comision,salario*0.15) salario_total from emp where comision = 0 or comision > salario*0.15 order by oficio;
    ```

8. Encuentre a todas las enfermeras y enfermeros con indicación del salario mensual de cada uno.

    Algebra relacional:

    ```
    Π{apellido, salario/12 salario_mensual}(σ{funcion = 'Enfermeria'}(plantilla))
    ```
    
    Consulta sql:
    ```sql
    select apellido, salario/12 salario_mensual from plantilla where funcion = 'Enfermeria';
    ```

9. Se pide el nombre, oficio y el día de la semana en que han sido dados de alta los empleados de la empresa, pero solo de aquellos cuyo día de alta haya sido entre martes y jueves. Ordenado por oficio.

    Algebra relacional:

    ```
    Π{emp_no, oficio, dia}(σ{DATE_FORMAT(fecha_alta, '%a') in ('TUE','WED','THU')}(emp))
    ```
    
    Consulta sql:
    ```sql
    select emp_no, oficio, DATE_FORMAT(fecha_alta, '%a') dia from emp
    where DATE_FORMAT(fecha_alta, '%a') in ('TUE','WED','THU')
    order by oficio;
    ```

10. Encontrar el salario medio de los Analistas.

    Algebra relacional:

    ```
    Π{avg(salario)}(σ{oficio = 'ANALISTA'}(emp))
    ```
    
    Consulta sql:
    ```sql
    select avg(salario) salario_medio from emp where oficio = 'ANALISTA';
    ```

11. Encontrar el salario más alto y el salario más bajo de la tabla de empleados, así como la diferencia entre ambos.

    Algebra relacional:

    ```
    Π{max(salario) max, min(salario), max(salario) - min(salario) diff}(emp)
    ```
    
    Consulta sql:
    ```sql
    select max(salario) max, min(salario) min, max(salario) - min(salario) diff from emp;
    ```

12. Encontrar el salario más alto y el salario más bajo de la tabla de empleados, así como la diferencia entre ambos.

    Algebra relacional:

    ```
    Π{dpto_no, oficio, count(*)}(emp)
    ```
    
    Consulta sql:
    ```sql
    select dpto_no, oficio, count(*) from emp group by dpto_no, oficio;
    ```