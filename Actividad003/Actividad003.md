# Subconsultas
## A. Con operadores básicos de comparación:

1. Devuelve el nombre del cliente con mayor límite de crédito.

```sql
```

![1](/img/)

2. Devuelve el nombre del producto que tenga el precio de venta más caro.

```sql
```

![2](/img/)

3. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en
cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido
de cada producto a partir de los datos de la tabla detalle_pedido. Una vez que sepa
cuál es el código del producto, puede obtener su nombre fácilmente.)

```sql
```

![3](/img/)

4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin
utilizar INNER JOIN).

```sql
```

![4](/img/)

5. Devuelve el producto que más unidades tiene en stock.

```sql
```

6. Devuelve el producto que menos unidades tiene en stock.

```sql
```

7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de
Alberto Soria.

```sql
```

## B. Subconsultas con ALL y ANY
8. Devuelve el nombre del cliente con mayor límite de crédito.

```sql
```

9. Devuelve el nombre del producto que tenga el precio de venta más caro.

```sql
```

10. Devuelve el producto que menos unidades tiene en stock.

```sql
```

## C. Subconsultas con IN y NOT IN
11. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún
cliente.

```sql
```

12. Devuelve un listado que muestre solamente los clientes que no han realizado ningún
pago.

```sql
```

13. Devuelve un listado que muestre solamente los clientes que sí han realizado ningún
pago.

```sql
```

14. Devuelve un listado de los productos que nunca han aparecido en un pedido.

```sql
```

15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados
que no sean representante de ventas de ningún cliente.

```sql
```

16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los
representantes de ventas de algún cliente que haya realizado la compra de algún
producto de la gama Frutales.

```sql
```

17. Devuelve un listado con los clientes que han realizado algún pedido, pero no han
realizado ningún pago.

```sql
```

## D. Subconsultas con EXISTS y NOT EXISTS
18. Devuelve un listado que muestre solamente los clientes que no han realizado ningún
pago.

```sql
```

19. Devuelve un listado que muestre solamente los clientes que sí han realizado ningún
pago.

```sql
```

20. Devuelve un listado de los productos que nunca han aparecido en un pedido.

```sql
```

21. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

```sql
```

## E. Subconsultas correlacionadas
### Consultas variadas:

22. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha
realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún
pedido.

```sql
```

23. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de
ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

```sql
```

24. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados
alfabéticamente de menor a mayor.

```sql
```

25. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de
ventas y el número de teléfono de la oficina del representante de ventas, de aquellos
clientes que no hayan realizado ningún pago.

```sql
```

26. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y
primer apellido de su representante de ventas y la ciudad donde está su oficina.

```sql
```

27. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados
que no sean representante de ventas de ningún cliente.

```sql
```

28. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de
empleados que tiene.

```sql
```