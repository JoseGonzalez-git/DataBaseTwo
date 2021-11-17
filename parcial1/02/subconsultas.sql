#punto 1

# Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta
#que tendrá que calcular cuál es el número total de unidades que se han vendido de cada
#producto a partir de los datos de la tabla detalle_pedido. Una vez que sepa cuál es el
#código del producto, puede obtener su nombre fácilmente.)
SELECT producto.nombre, detalle_pedido.cantidad FROM producto INNER JOIN detalle_pedido ON producto.codigo_producto=detalle_pedido.codigo_producto WHERE cantidad =(SELECT MAX(cantidad) from detalle_pedido);

# Devuelve el producto que más unidades tiene en stock.
SELECT nombre, cantidad_en_stock FROM producto WHERE cantidad_en_stock =(SELECT max(cantidad_en_stock) FROM producto);

#punto 2

# Devuelve el nombre del cliente con mayor límite de crédito.
SELECT nombre_cliente FROM cliente WHERE limite_credito >= ALL(SELECT (limite_credito) FROM cliente );

#Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT nombre,precio_venta FROM producto WHERE precio_venta >= ALL (SELECT(precio_venta) FROM producto);

#punto 3

# Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
select nombre, apellido1, apellido2, puesto, oficina.telefono from empleado, oficina where empleado.codigo_empleado not in (select cliente.codigo_empleado_rep_ventas from cliente) and empleado.codigo_oficina = oficina.codigo_oficina and empleado.puesto = 'Representante Ventas';

#Devuelve un listado de los productos que nunca han aparecido en un pedido.
select codigo_producto, nombre from producto where producto.codigo_producto not in (select detalle_pedido.codigo_producto from detalle_pedido);

#Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
select codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto from cliente where cliente.codigo_cliente not in (select pago.codigo_cliente from pago);

#punto 4

#Devuelve un listado de los productos que nunca han aparecido en un pedido.
select codigo_producto, nombre from producto where not exists (select detalle_pedido.codigo_producto from detalle_pedido where detalle_pedido.codigo_producto = producto.codigo_producto);

#Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
select codigo_producto, nombre from producto where exists (select detalle_pedido.codigo_producto from detalle_pedido where detalle_pedido.codigo_producto = producto.codigo_producto);

# Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
select codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto from cliente where not exists (select pago.codigo_cliente from pago where cliente.codigo_cliente = pago.codigo_cliente);