# AUTORES
- [Isaac Arrieta Mercado]
- [Jose Alejandro Gonzalez Ortiz]
## Ejercicio 1

1. Ciudad en la que está el departamento de ventas
    π ciudad
    σ nombre = "Departamento de ventas" deptos

    ```sql
    SELECT ciudad
    FROM deptos WHERE nombre = 'Departamento de ventas' ;
    ```
2. Rut y nombre de los clientes de Providencia

    π nombre
    σ comuna = "Providencia" clientes
    ```sql
    SELECT nombre, rut
    FROM clientes
    WHERE comuna='Providencia';
    ```
3. Precios del televisor y del proyector
    
    π precio
    σ nombre = "Televisor" productos
    σ nombre = "Proyector" productos
    ```sql
        SELECT precio
        FROM productos
        WHERE nombre='Televisor' OR nombre='Proyector';
    ```

4. Nombre de los productos vendidos en la venta 6
        
    π nombre
    σ ventas_num_venta = 6 AND productos . codigo = ventas_detalle . productos_codigo (productos × ventas_detalle)
    ```sql
        SELECT nombre
        FROM productos, ventas_detalle
        WHERE ventas_num_venta = 6 AND productos.codigo = ventas_detalle.productos_codigo;
    ```
5. Numero de cada una de las ventas hechas por WARD
        
    π num_venta
    σ nombre = "WARD" AND ventas . empleados_rut = empleados . rut (ventas × empleados)
    ```sql
        SELECT num_venta
        FROM ventas, empleados
        WHERE nombre='WARD'
        AND ventas.empleados_rut=empleados.rut;
    ```
6. Nombre de los clientes atendidos por TURNER

   π clientes . nombre 
   σ empleados . nombre = "TURNER" AND ventas . empleados_rut = empleados . rut (clientes × ventas × empleados)
   ```sql
        SELECT clientes.nombre
        FROM clientes, ventas, empleados
        WHERE empleados.nombre='TURNER'
        AND ventas.empleados_rut = empleados.rut;
    ```
7. Nombre y precio de los productos vendidos por MARTIN
    
    π productos . precio, productos . nombre γ codigo,
    σ empleados . nombre = "MARTIN" AND ventas . empleados_rut = empleados . rut AND ventas . num_venta = ventas_detalle . ventas_num_venta AND ventas_detalle . productos_codigo = productos . codigo (productos × ventas × empleados × ventas_detalle)
   ```sql
        SELECT productos.precio, productos.nombre
        FROM productos,ventas,empleados, ventas_detalle
        WHERE empleados.nombre='MARTIN'
        AND ventas.empleados_rut=empleados.rut
        AND ventas.num_venta=ventas_detalle.ventas_num_venta
        AND ventas_detalle.productos_codigo=productos.codigo
        GROUP BY productos.codigo;
    ```
8. Grado de sueldo en que esta CLARK

    π grados . grado
    σ empleados . nombre = "CLARK" AND empleados . rut = grados_has_empleados . empleados_rut AND grados_has_empleados . grados_grado = grados . grado (grados × empleados × grados_has_empleados)

    ```sql
        SELECT grados.grado
        FROM grados, empleados, grados_has_empleados
        WHERE empleados.nombre='CLARK'
        AND empleados.rut = grados_has_empleados.empleados_rut
        AND grados_has_empleados.grados_grado = grados.grado;
    ```
9. Nombre de los productos comprados por los habitantes de Las Condes

    π productos . nombre
    γ nombre, codigo,
    σ productos . codigo = ventas_detalle . productos_codigo AND ventas_detalle . ventas_num_venta = ventas . num_venta AND ventas . clientes_rut = clientes . rut AND clientes . comuna = "Las Condes" (productos × ventas_detalle × ventas × clientes)

 ```sql
        SELECT productos.nombre
        FROM productos, ventas_detalle, ventas, clientes
        WHERE productos.codigo=ventas_detalle.productos_codigo
        AND ventas_detalle.ventas_num_venta=ventas.num_venta
        AND ventas.clientes_rut =clientes.rut
        AND clientes.comuna='Las Condes'
        GROUP BY productos.nombre, productos.codigo;
```

10. Nombre de los clientes que han comprado productos que valen $30000

    π clientes . nombre
    γ nombre, rut,
    σ clientes . rut = ventas . clientes_rut AND ventas . num_venta = ventas_detalle . ventas_num_venta AND ventas_detalle . productos_codigo = productos . codigo AND productos . precio = 30000 (clientes × ventas × ventas_detalle × productos)
 ```sql
    SELECT clientes.nombre
    FROM clientes, ventas, ventas_detalle, productos
    WHERE clientes.rut=ventas.clientes_rut
    AND ventas.num_venta=ventas_detalle.ventas_num_venta
    AND ventas_detalle.productos_codigo=productos.codigo
    AND productos.precio=30000
    GROUP BY clientes.nombre, clientes.rut;
```
11. Numero de productos que valen más de $25000

    π COUNT (precio)
    γ COUNT (precio)
    σ precio > 250000 productos

 ```sql
    SELECT COUNT(precio)
    FROM productos
    WHERE precio>250000;
```

12.Monto total recaudado por las ventas hechas

π SUM (monto)
γ SUM (monto) ventas

```sql
    SELECT SUM(monto)
    FROM ventas;
```
13.Cantidad total de mesas vendidas

```sql
    SELECT SUM(ventas_detalle.cantidad)
    FROM ventas_detalle, productos
    WHERE ventas_detalle.productos_codigo = productos.codigo
    AND productos.nombre='mesa';
```

14. Total, pagado por Pepe por todas las compras que ha hecho

    π SUM (monto)
    γ SUM (monto)
    σ ventas . clientes_rut = clientes . rut AND clientes . nombre = "Pepe" (ventas × clientes)

```sql
    SELECT SUM(ventas.monto)
    FROM ventas, clientes
    WHERE ventas.clientes_rut=clientes.rut
    AND clientes.nombre='Pepe';
```
15. Monto total de comisiones ganadas por ALLEN

    π SUM ((empleados.comision)/100*ventas.monto)
    γ SUM ((empleados.comision)/100*ventas.monto)
    σ empleados . rut = ventas . empleados_rut AND empleados . nombre = "ALLEN" (empleados × ventas)

```sql
    SELECT SUM((empleados.comision)/100*ventas.monto)
    FROM empleados, ventas
    WHERE empleados.rut=ventas.empleados_rut
    AND empleados.nombre='ALLEN';
```
16. Nombre del jefe de SCOTT

    π nombre
    σ rut = (π rut_jefe
    σ nombre = "SCOTT" empleados) empleados    
    

```sql
    SELECT nombre
    FROM empleados
    WHERE rut=(SELECT rut_jefe
    FROM empleados
    WHERE nombre='SCOTT');
```
17. Nombre y precio del producto más caro

    π nombre, precio
    σ precio = (π MAX (precio)
    γ MAX (precio) productos) productos

```sql
    SELECT nombre, precio
    FROM productos
    WHERE precio=(SELECT MAX(precio)
    FROM productos);
```

18. Nombre y sueldo del empleado de NEW YORK que tiene el peor sueldo

    π empleados . nombre, empleados . sueldo
    σ empleados . deptos_numdep = deptos . numdep AND sueldo = 
    (π MIN (sueldo)
    γ MIN (sueldo)
    σ empleados . deptos_numdep = deptos . numdep AND deptos . ciudad = "NEW YORK" (empleados × deptos)) AND deptos . ciudad = "NEW YORK" (empleados × deptos)
    

```sql
    SELECT empleados.nombre, empleados.sueldo
    FROM empleados, deptos
    WHERE empleados.deptos_numdep=deptos.numdep
    AND sueldo=(SELECT MIN(empleados.sueldo)
    FROM empleados, deptos
    WHERE empleados.deptos_numdep=deptos.numdep
    AND deptos.ciudad='NEW YORK')
    AND deptos.ciudad='NEW YORK';
```

19. Nombre del vendedor que ha vendido el producto más caro

    γ nombre,
    σ empleados . rut = ventas . empleados_rut AND ventas . num_venta = ventas_detalle . ventas_num_venta AND ventas_detalle . productos_codigo = productos . codigo AND productos . precio = (π MAX (precio)
    γ MAX (precio) productos) (empleados × ventas_detalle × ventas × productos)

```sql
    SELECT empleados.nombre
    FROM empleados, ventas_detalle, ventas, productos
    WHERE empleados.rut=ventas.empleados_rut
    AND ventas.num_venta=ventas_detalle.ventas_num_venta
    AND ventas_detalle.productos_codigo=productos.codigo
    AND productos.precio=(SELECT MAX(productos.precio)
    FROM productos)
    GROUP BY empleados.nombre;
```

20. Rut de los clientes y monto total comprado por cada uno de ellos

    γ rut, SUM (monto)
    σ ventas . clientes_rut = clientes . rut (ventas × clientes)

```sql
    SELECT SUM(ventas.monto), clientes.rut
    FROM ventas, clientes
    WHERE ventas.clientes_rut=clientes.rut
    GROUP BY clientes.rut;
```

21. Nombre de los clientes y monto total comprado por cada uno de ellos

    π clientes . nombre, SUM (monto)
    γ nombre, rut, SUM (monto)
    σ ventas . clientes_rut = clientes . rut (ventas × clientes)

```sql
    SELECT clientes.nombre, SUM(ventas.monto)
    FROM ventas, clientes
    WHERE ventas.clientes_rut=clientes.rut
    GROUP BY clientes.nombre, clientes.rut;
```


22. Nombre de los vendedores y monto total vendido por cada uno de ellos

    π clientes . nombre, SUM (monto)
    γ nombre, rut, SUM (monto)
    σ ventas . clientes_rut = clientes . rut (ventas × clientes)

```sql
    SELECT clientes.nombre, SUM(ventas.monto)
    FROM ventas, clientes
    WHERE ventas.clientes_rut=clientes.rut
    GROUP BY clientes.nombre, clientes.rut;
```

23. Nombre del producto más vendido


    π productos . nombre, (γ productos_codigo, SUM (cantidad) ventas_detalle) 
    σ productos . codigo = total . productos_codigo AND total = (γ productos_codigo, SUM (cantidad) ventas_detalle) productos
    

```sql
    SELECT productos.nombre
    FROM productos, (SELECT productos_codigo, SUM(cantidad) as SUM
    FROM ventas_detalle
    GROUP BY productos_codigo) as total
    WHERE productos.codigo=total.productos_codigo
    AND total.SUM = (SELECT MAX(SUM)
    FROM (SELECT productos_codigo, SUM(cantidad) as SUM
    FROM ventas_detalle
    GROUP BY productos_codigo) as total);
```

24. Nombre del cliente que ha comprado más veces en la tienda

```sql
    SELECT clientes.nombre
    FROM clientes, (SELECT clientes_rut, COUNT(clientes_rut) as suma
    FROM ventas
    GROUP BY clientes_rut) as total
    WHERE clientes.rut=total.clientes_rut
    AND total.suma=(SELECT MAX(suma)
    FROM (SELECT clientes_rut, COUNT(clientes_rut) as suma
    FROM ventas
    GROUP BY clientes_rut) as total); 
``` 
25. Nombre del producto que nunca se ha vendido

    π productos . nombre
    σ NOT (productos . codigo = (π ventas_detalle . productos_codigo ventas_detalle) ) productos
    
```sql
    SELECT productos.nombre
    FROM productos
    WHERE productos.codigo
    NOT IN (SELECT ventas_detalle.productos_codigo
    FROM ventas_detalle);
``` 

26. Comuna en la que vive el cliente que ha comprado más televisores

```sql
    SELECT clientes.comuna
    FROM clientes, (SELECT ventas.clientes_rut, SUM(ventas_detalle.cantidad) as suma
    FROM ventas, ventas_detalle, productos
    WHERE ventas.num_venta=ventas_detalle.ventas_num_venta
    AND ventas_detalle.productos_codigo=productos.codigo
    AND productos.nombre='televisor'
    GROUP BY ventas.clientes_rut) as total
    WHERE clientes.rut=total.clientes_rut
    AND total.suma=(SELECT MAX(suma)
    FROM (SELECT ventas.clientes_rut, SUM(ventas_detalle.cantidad) as suma
    FROM ventas, ventas_detalle, productos
    WHERE ventas.num_venta=ventas_detalle.ventas_num_venta
    AND ventas_detalle.productos_codigo=productos.codigo
    AND productos.nombre='televisor'
    GROUP BY ventas.clientes_rut) as total); 
``` 

27. Nombre del vendedor que ha vendido más dvd's

```sql
    SELECT empleados.nombre
    FROM empleados, (SELECT ventas.empleados_rut, SUM(ventas_detalle.cantidad) as suma
    FROM ventas, ventas_detalle, productos
    WHERE ventas.num_venta=ventas_detalle.ventas_num_venta
    AND ventas_detalle.productos_codigo=productos.codigo
    AND productos.nombre='dvd'
    GROUP BY ventas.empleados_rut) as total
    WHERE empleados.rut=total.empleados_rut
    AND total.suma=(SELECT MAX(suma)
    FROM (SELECT ventas.empleados_rut, SUM(ventas_detalle.cantidad) as suma
    FROM ventas, ventas_detalle, productos
    WHERE ventas.num_venta=ventas_detalle.ventas_num_venta
    AND ventas_detalle.productos_codigo=productos.codigo
    AND productos.nombre='dvd'
    GROUP BY ventas.empleados_rut) as total);
``` 

28. Nombre, sueldo y grado de los gerentes (MANAGER)

```sql
    SELECT empleados.nombre
    FROM empleados, (SELECT ventas.empleados_rut, SUM(ventas_detalle.cantidad) as suma
    FROM ventas, ventas_detalle, productos
    WHERE ventas.num_venta=ventas_detalle.ventas_num_venta
    AND ventas_detalle.productos_codigo=productos.codigo
    AND productos.nombre='dvd'
    GROUP BY ventas.empleados_rut) as total
    WHERE empleados.rut=total.empleados_rut
    AND total.suma=(SELECT MAX(suma)
    FROM (SELECT ventas.empleados_rut, SUM(ventas_detalle.cantidad) as suma
    FROM ventas, ventas_detalle, productos
    WHERE ventas.num_venta=ventas_detalle.ventas_num_venta
    AND ventas_detalle.productos_codigo=productos.codigo
    AND productos.nombre='dvd'
    GROUP BY ventas.empleados_rut) as total);
``` 

29. Cantidad de productos cuyos precios son inferiores al promedio

    π empleados . nombre, empleados . sueldo, grados . grado
    σ empleados . sueldo > grados . sueldo_inf AND empleados . sueldo < grados . sueldo_sup AND empleados . cargo = "MANAGER" (empleados × grados)

```sql
    SELECT empleados.nombre, empleados.sueldo, grados.grado
    FROM empleados, grados
    WHERE empleados.sueldo > grados.sueldo_inf
    AND empleados.sueldo < grados.sueldo_sup
    AND empleados.cargo='MANAGER';
```
30. Monto total de las ventas hechas al cliente que más veces ha comprado
```sql
    SELECT COUNT(codigo)
    FROM productos
    WHERE productos.precio<(SELECT AVG(precio)
    FROM productos);
```
31. Total, de sueldos pagados en cada uno de los departamentos

    π deptos . nombre, SUM (sueldo)
    γ nombre, numdep, SUM (sueldo)
    σ deptos . numdep = empleados . deptos_numdep (empleados × deptos)
    
```sql
    SELECT deptos.nombre, SUM(empleados.sueldo)
    FROM empleados, deptos
    WHERE deptos.numdep=empleados.deptos_numdep
    GROUP BY deptos.nombre, deptos.numdep;
```
32. Número de empleados que están en grado 2

    π COUNT (rut)
    γ COUNT (rut)
    σ grados_has_empleados . grados_grado = 2 AND grados_has_empleados . empleados_rut = empleados . rut (grados_has_empleados × empleados)

```sql
    SELECT COUNT(empleados.rut)
    FROM grados_has_empleados,empleados
    WHERE  grados_has_empleados.grados_grado=2
    and grados_has_empleados.empleados_rut=empleados.rut;
```

33. Monto total vendido en cada comuna

    γ comuna, SUM (monto)
    σ ventas . clientes_rut = clientes . rut (ventas × clientes)

```sql
    SELECT clientes.comuna, SUM(ventas.monto)
    FROM ventas, clientes
    WHERE ventas.clientes_rut=clientes.rut
    GROUP BY clientes.comuna;
```

34. Cantidad total vendida de cada producto

    π productos . nombre, SUM (cantidad)
    γ nombre, codigo, SUM (cantidad)
    σ productos . codigo = ventas_detalle . productos_codigo (productos × ventas_detalle)

```sql
    SELECT productos.nombre, SUM(ventas_detalle.cantidad)
    FROM productos, ventas_detalle
    WHERE productos.codigo=ventas_detalle.productos_codigo
    GROUP BY productos.nombre, productos.codigo;
```

35. Número de clientes que han comprado mesas

    π COUNT (rut)
    γ COUNT (rut)
    σ clientes . rut = total . clientes_rut (clientes ×
    ρ total
        γ clientes_rut,
        σ ventas . num_venta = ventas_detalle . num_venta AND ventas_detalle . productos_codigo = productos . codigo AND productos . nombre = "mesa" (ventas × ventas_detalle × productos))

```sql
    SELECT COUNT(clientes.rut)
    FROM clientes, (SELECT ventas.clientes_rut
    FROM ventas, ventas_detalle, productos
    WHERE ventas.num_venta=ventas_detalle.num_venta
    AND ventas_detalle.productos_codigo=productos.codigo
    AND productos.nombre='mesa'
    GROUP BY ventas.clientes_rut) AS total
    WHERE clientes.rut=total.clientes_rut;
```

36. Nombre del departamento que tiene más empleados

    π deptos . nombre, (π deptos_numdep, COUNT (rut) → suma
    γ deptos_numdep, COUNT (rut) empleados) 
    σ deptos . numdep = total . deptos_numdep AND total . suma = " "deptos
    
```sql
    SELECT deptos.nombre
    FROM deptos, (SELECT deptos_numdep , COUNT(rut) AS suma
    FROM empleados
    GROUP BY deptos_numdep ) AS total
    WHERE deptos.numdep=total.deptos_numdep
    AND total.suma=(SELECT MAX(suma)
    FROM (SELECT deptos_numdep , COUNT(rut) AS suma
    FROM empleados
    GROUP BY deptos_numdep ) AS total);
```

37. Número de empleados que tiene cada gerente (MANAGER)

    π rut, nombre
    σ cargo = "MANAGER" empleados

```sql
    SELECT a.nombre, COUNT(empleados.rut)
    FROM empleados, (SELECT rut, nombre
    FROM empleados
    WHERE cargo='MANAGER') AS a
    WHERE empleados.rut_jefe=a.rut
    GROUP BY a.nombre,a.rut;
```

38. Nombre del vendedor que ha hecho el mayor número de ventas

```sql
    SELECT empleados.nombre
    FROM empleados, (SELECT empleados.rut, COUNT(num_venta) AS suma
    FROM empleados, ventas
    WHERE empleados.rut=ventas.empleados_rut
    GROUP BY empleados.rut) AS total
    WHERE empleados.rut=total.rut
    AND total.suma=(SELECT MAX(suma)
    FROM (SELECT empleados.rut, COUNT(num_venta) AS suma
    FROM empleados, ventas
    WHERE empleados.rut=ventas.empleados_rut
    GROUP BY empleados.rut) AS total);
```

39. Monto del mayor sueldo que paga la tienda y quien lo recibe

    π nombre, sueldo
    σ sueldo = (π MAX (sueldo)
    γ MAX (sueldo) empleados) empleados
    

```sql
    SELECT nombre, sueldo
    FROM empleados
    WHERE sueldo=(SELECT MAX(sueldo)
    FROM empleados);
```

40. Nombre y precio del producto que ha sido vendido menos veces

```sql
    SELECT productos.nombre, productos.precio
    FROM productos, (SELECT productos_codigo, SUM(cantidad) AS suma
    FROM ventas_detalle
    GROUP BY productos_codigo) AS total
    WHERE productos.codigo=total.productos_codigo
    AND total.suma=(SELECT MIN(suma)
    FROM (SELECT productos_codigo, SUM(cantidad) AS suma
    FROM ventas_detalle GROUP BY productos_codigo) AS total);
```

41. Nombre del mejor vendedor (quien tiene el mayor monto de ventas)

```sql
    SELECT empleados.nombre
    FROM empleados, (SELECT empleados_rut , SUM(monto) AS suma
    FROM ventas
    GROUP BY empleados_rut ) AS total
    WHERE empleados.rut=total.empleados_rut 
    AND total.suma=(SELECT MAX(suma)
    FROM (SELECT empleados_rut , SUM(monto) AS suma
    FROM ventas
    GROUP BY empleados_rut ) AS total);
```

43. Precio promedio de los productos vendidos a clientes de Providencia

```sql
     SELECT COUNT(clientes.rut)
    FROM clientes, (SELECT ventas.clientes_rut
    FROM ventas, ventas_detalle, productos
    WHERE ventas.num_venta=ventas_detalle.ventas_num_venta
    AND ventas_detalle.productos_codigo=productos.codigo
    AND productos.nombre='mesa'
    GROUP BY ventas.clientes_rut) AS total
    WHERE clientes.rut=total.clientes_rut;
```

44. Rut, nombre y comuna de los clientes atendidos por el mejor vendedor

```sql
    SELECT clientes.rut, clientes.nombre, clientes.comuna
    FROM clientes, ventas
    WHERE clientes.rut=ventas.clientes_rut
    AND ventas.empleados_rut=(SELECT empleados.rut
    FROM empleados, (SELECT empleados_rut, SUM(monto) AS suma
    FROM ventas
    GROUP BY empleados_rut) AS total
    WHERE empleados.rut=total.empleados_rut
    AND total.suma=(SELECT MAX(suma)
    FROM (SELECT empleados_rut, SUM(monto) AS suma
    FROM ventas
    GROUP BY empleados_rut) AS total))
    GROUP BY clientes.rut, clientes.nombre, clientes.comuna;
```


