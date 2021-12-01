# Procedimientos Almacenados
## Autores
- Isaac Damian Arrieta Mercado
- Jose Alejandro Gonzalez Ortiz

## Procedimientos sin sentencias

1. Escriba un procedimiento que no tenga ningún parámetro de entrada ni de salida y quemuestre el texto¡Hola mundo!

```sql
    drop procedure if exists hola_mundo ;
    delimiter //
        create procedure hola_mundo()
        begin
        select 'Hola mundo';
    end//
    delimiter ;

    call hola_mundo();
```

2. Escriba un procedimiento que reciba un número real de entrada y muestre un mensaje indicando si el número es positivo, negativo o cero.

```sql
    drop procedure if exists numposneg ;
    delimiter //
    create procedure numposneg(in numero int)
    begin if numero > 0 then select 'Numero positivo';
    elseif numero < 0 then select 'Nuemro negativo';
    else select 'El numero es cero';
    end if;
    end//
    delimiter ;

    call numposneg(-9);
```

3. Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetrode entrada, con el valor un número real, y un parámetro de salida, con una cadena decaracteres indicando si el número es positivo, negativo o cero.

```sql
    DROP PROCEDURE IF EXISTS mensaje_tipo;
    DELIMITER //
    CREATE PROCEDURE mensaje_tipo(IN numero NUMERIC, OUT mensaje VARCHAR(40))
    BEGIN
        IF numero > 0 THEN
            SET mensaje = 'Positivo';
        ELSEIF numero < 0 THEN
            SET mensaje = 'Negativo';
        ELSE
            SET mensaje = 'Cero';
        END IF;
    END//
    DELIMITER ;
    CALL mensaje_tipo(1, @mensaje);
    select @mensaje;
```

4. Escriba un procedimiento que reciba un número real de entrada, que representa el valorde la nota de un alumno, y muestre un mensaje indicando qué nota ha obtenido teniendo en cuenta las siguientes condiciones:

* [0,5) = Insuficiente
* [5,6) = Aprobado
* [6, 7) = Bien
* [7, 9) = Notable
* [9, 10] = Sobresaliente
* En cualquier otro caso la nota no será válida

```sql
    DROP PROCEDURE IF EXISTS mensaje_nota;
    delimiter //
    CREATE PROCEDURE mensaje_nota(IN nota NUMERIC)
    BEGIN
        IF nota >= 0 AND nota < 5 THEN
            SELECT 'Insuficiente';
        ELSEIF nota >= 5 AND nota < 6 THEN
            SELECT 'Aprobado';
        ELSEIF nota >= 6 AND nota < 7 THEN
            SELECT 'Bien';
        ELSEIF nota >= 7 AND nota < 9 THEN
            SELECT 'Notable';
        ELSEIF nota >= 9 AND nota <= 10 THEN
            SELECT 'Sobresaliente';
        ELSE
            SELECT 'No es una nota válida';
        END IF;
    END//
    delimiter ;
    
    CALL mensaje_nota(8);
```

5.  Modifique el procedimiento diseñado en el ejercicio anterior para que tenga un parámetrode entrada, con el valor de la nota en formato numérico y un parámetro de salida, con unacadena de texto indicando la nota correspondiente.

```sql
    DROP PROCEDURE IF EXISTS mensaje_nota;
    delimiter //
    CREATE PROCEDURE mensaje_nota(IN nota NUMERIC, OUT mensaje VARCHAR(40))
    BEGIN
        IF nota >= 0 AND nota < 5 THEN
            SET mensaje = 'Insuficiente';
        ELSEIF nota >= 5 AND nota < 6 THEN
            SET mensaje = 'Aprobado';
        ELSEIF nota >= 6 AND nota < 7 THEN
            SET mensaje = 'Bien';
        ELSEIF nota >= 7 AND nota < 9 THEN
            SET mensaje = 'Notable';
        ELSEIF nota >= 9 AND nota <= 10 THEN
            SET mensaje = 'Sobresaliente';
        ELSE
            SET mensaje = 'No es una nota válida';
        END IF;
    END//
    delimiter ;
    CALL mensaje_nota(1, @mensaje);
    SELECT @mensaje;
```

6. Resuelva el procedimiento diseñado en el ejercicio anterior haciendo uso de la estructurade control CASE. 

```sql
    
```

7. Escriba un procedimiento que reciba como parámetro de entrada un valor numérico querepresente un día de la semana y que devuelva una cadena de caracteres con el nombre del día de la semana correspondiente. Por ejemplo, para el valor de entrada1deberíadevolver la cadenalunes.

## Procedimientos con sentencias SQL1.

1. Escriba un procedimiento que reciba el nombre de un país como parámetro de entrada yrealice una consulta sobre la tablaclientepara obtener todos los clientes que existen en latabla de ese país.

2. Escriba un procedimiento que reciba como parámetro de entrada una forma de pago, queserá una cadena de caracteres (Ejemplo:PayPal, Transferencia, etc.). Y devuelva comosalida el pago de máximo valor realizado para esa forma de pago. Deberá hacer uso de latablapagode la base de datosjardinería.

3. Escriba un procedimiento que reciba como parámetro de entrada una forma de pago, queserá una cadena de caracteres (Ejemplo:PayPal,Transferencia, etc). Y devuelva como salida los siguientes valores teniendo en cuenta la forma de pago seleccionada comoparámetro de entrada:

* el pago de máximo valor,
* el pago de mínimo valor,
* el valor medio de los pagos realizados,
* la suma de todos los pagos,
* el número de pagos realizados para esa forma de pago.

    Deberá hacer uso de la tablapagode la base de datosjardinería.

4. Crear una base de datos llamada “procedimientos01” que contenga una tabla llamada operaciones.  La tabla operaciones debe tener dos columnas de tipo INT UNSIGNED,una columna llamada “numero” y otra llamada “cuadrado”.

    Una   vez   creada   la   base   de   datos   y   la   tabla   deberá crear un procedimiento llamado calcular_cuadrados con   las   siguientes características.   Elprocedimiento recibe un parámetro de entrada llamadotopede tipo INT UNSIGNED y calculará el valor de los cuadrados de los primeros números naturales hasta el valor introducido como parámetro. El valor del número y de sus cuadrados deberán ser almacenados en la tabla cuadrados que hemos creado previamente.

    Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de la tablaantes de insertar los nuevos valores de los cuadrados que va a calcular.
    
    Utilice un bucleWHILEpara resolver el procedimiento.

5. Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.

6. Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.

7. Crear una base de datos llamada “procedimientos02” que contenga una tabla llamada ejercicio. La tabla debe tener una única columna llamada “numero” y el tipo de dato de esta columna debe ser INT UNSIGNED.

    Una   vez   creada   la   base   de   datos   y   la   tabla   deberá crear   un procedimiento llamado calcular_númeroscon   las   siguientes   características.   El procedimiento   recibe   un   parámetro   de   entrada   llamado valor_inicialde   tipo INT UNSIGNED y deberá almacenar en la tabla ejercicio toda la secuencia de números desde el valor inicial pasado como entrada hasta el 1.

    Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas antes de insertar los nuevos valores.

    Utilice un bucle WHILE para resolver el procedimiento.

8. Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior. 

9. Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.

10. Crea unabase de datos llamada procedimientos que contenga una tabla llamada pares y otra tabla llamada impares. Las dos tablas deben tener única columna llamada número y el tipo de dato de esta columna debe ser INT UNSIGNED. 

    Una   vez   creada   la   base   de   datos   y   las   tablas   deberácrear   un procedimiento llamado calcular_pares_impares con   las   siguientes   características.   El procedimiento recibe un parámetro de entrada llamado tope de tipo INT UNSIGNED y deberá almacenar en la tabla pares aquellos números pares que existan entre el número 1el valor introducido como parámetro. Habrá que realizar la misma operación para  almacenar los números impares en la tabla impares.

    Tenga en cuenta que el procedimiento deberá eliminar el contenido actual de las tablas antes de insertar los nuevos valores. 

    Utilice un bucle WHILE para resolver el procedimiento.

11. Utilice un bucle REPEAT para resolver el procedimiento del ejercicio anterior.

12. Utilice un bucle LOOP para resolver el procedimiento del ejercicio anterior.

## Transacciones con procedimientos almacenados

1. Crea una base de datos llamada cine que contengados tablas con las siguientes columnas.

Tabla cuentas:

* id_cuenta: entero sin signo (clave primaria).
* saldo: real sin signo.

Tabla entradas:

* id_butaca: entero sin signo (clave primaria). 
* nif: cadena de 9 caracteres.

Una   vez   creada   la   base   de   datos   y   las   tablas   deberá crear   un procedimiento llamado comprar_entrada con   las   siguientes   características.   El procedimiento recibe 3 parámetros  de entrada(nif,id_cuenta,id_butaca) y devolverá como salida un parámetro llamado error que tendrá un valor igual a 0 si la compra de la entrada se ha podido realizar con éxito y un valor igual a 1 en caso contrario.

El procedimiento de compra realiza los siguientes pasos:

* Inicia una transacción.

* Actualiza la columnasaldode la tablacuentascobrando 5 euros a la cuenta con elid_cuentaadecuado.

* Inserta una una fila en la tablaentradasindicando la butaca (id_butaca) que acaba de comprar el usuario (nif).

* Comprueba si ha ocurrido algún error en las operaciones anteriores. Si no ocurre ningún error entonces aplica un COMMIT a la transacción y si ha ocurrido algún error aplica un ROLLBACK.Deberá manejar los siguientes errores que puedan ocurrir durante el proceso.

* ERROR 1264 (Out of range value).
* ERROR 1062 (Duplicate entry for PRIMARY KEY).

2. ¿Qué ocurre cuando intentamos comprar una entrada y le pasamos como parámetro unnúmero de cuenta que no existe en la tablacuentas? ¿Ocurre algún error o podemoscomprar la entrada?  En caso de que exista algún error, ¿cómo podríamos resolverlo?

## Funciones con sentencias SQL

1. Escribe una función para la base de datostiendaque devuelva el número total deproductos que hay en la tablaproductos.

2. Escribe una función para la base de datostiendaque devuelva el valor medio del preciode los productos de un determinado fabricante que se recibirá como parámetro de entrada.El parámetro de entrada será el nombre del fabricante.

3. Escribe una función para la base de datostiendaque devuelva el valor máximo del preciode los productos de un determinado fabricante que se recibirá como parámetro de entrada.El parámetro de entrada será el nombre del fabricante.

4. Escribe una función para la base de datostiendaque devuelva el valor mínimo del preciode los productos de un determinado fabricante que se recibirá como parámetro de entrada.El parámetro de entrada será el nombre del fabricante.