INSERT INTO productos (codigo, nombre, precio)
VALUE (1,'dvd', 50000);
INSERT INTO productos (codigo, nombre, precio)
VALUE (2,'Coca-Cola', 30000);
INSERT INTO productos (codigo, nombre, precio)
VALUE (3,'Televisor',80000);
INSERT INTO productos (codigo, nombre, precio) 
VALUE (4,'Mesa',45000);
INSERT INTO productos (codigo, nombre, precio) 
VALUE (5,'Proyector',120000);

INSERT INTO deptos (numdep, nombre, ciudad)
VALUE (1,'Departamento de Ventas','Monteria');
INSERT INTO deptos (numdep, nombre, ciudad)
VALUE (2,'Departamento de Marketing','NEW YORK');
INSERT INTO deptos (numdep, nombre, ciudad)
VALUE (3,'Departamento de Finanzas','CORDOBA');

INSERT INTO clientes (rut,nombre,comuna)
VALUE (4,'María de los Ángeles','Providencia');
INSERT INTO clientes (rut,nombre,comuna)
VALUE (2,'María del Carmen','Providencia');
INSERT INTO clientes (rut,nombre,comuna)
VALUE (13,'Drew Barrymore','Las Condes');
INSERT INTO clientes (rut,nombre,comuna)
VALUE (20,'Larry Page','Las Condes');
INSERT INTO clientes (rut,nombre,comuna)
VALUE (6,'Tom Delonge','Providencia');
INSERT INTO clientes (rut,nombre,comuna)
VALUE (7,'Pepe','El Bosque');

INSERT INTO empleados (rut,nombre,cargo,rut_jefe,sueldo,comision,deptos_numdep)
VALUE (8,'TURNER','Empleado',10,3000000,2000,3);
INSERT INTO empleados (rut,nombre,cargo,rut_jefe,sueldo,comision,deptos_numdep)
VALUE (32,'CLARK','MANAGER',32,4000000, 3000,3);
INSERT INTO empleados (rut,nombre,cargo,rut_jefe,sueldo,comision,deptos_numdep)
VALUE (1,'SCOTT','Empleado',10,2000000,4000,1);
INSERT INTO empleados (rut,nombre,cargo,rut_jefe,sueldo,comision,deptos_numdep)
VALUE (12,'ALLEN','Empleado',32,1400000,5000,2);
INSERT INTO empleados (rut,nombre,cargo,rut_jefe,sueldo,comision,deptos_numdep)
VALUE (50,'WARD','MANAGER',50,3540000,32000,1);
INSERT INTO empleados (rut,nombre,cargo,rut_jefe,sueldo,comision,deptos_numdep)
VALUE (10,'MARE','MANAGER',10,4780000,5430,2);

INSERT INTO ventas (num_venta, empleados_rut,clientes_rut,monto,fecha)
VALUE (1,8,4,300000,'2021-02-12');
INSERT INTO ventas (num_venta, empleados_rut,clientes_rut,monto,fecha)
VALUE (2,32,2,480000,'2021-05-12');
INSERT INTO ventas (num_venta, empleados_rut,clientes_rut,monto,fecha)
VALUE (3,1,13,480000,'2021-09-10');
INSERT INTO ventas (num_venta, empleados_rut,clientes_rut,monto,fecha)
VALUE (4,50,20,600000,'2021-10-23');
INSERT INTO ventas (num_venta, empleados_rut,clientes_rut,monto,fecha)
VALUE (5,10,7,670500,'2021-11-23');
INSERT INTO ventas (num_venta, empleados_rut,clientes_rut,monto,fecha)
VALUE (6,1,2,300500,'2021-11-02');

INSERT INTO grados (grado,sueldo_inf,sueldo_sup)
VALUE (1,1000000,1999999);
INSERT INTO grados (grado,sueldo_inf,sueldo_sup)
VALUE (2,2000000,2999999);
INSERT INTO grados (grado,sueldo_inf,sueldo_sup)
VALUE (3,3000000,3999999);
INSERT INTO grados (grado,sueldo_inf,sueldo_sup)
VALUE (4,4000000,4999999);

INSERT INTO grados_has_empleados (grados_grado,empleados_rut)
VALUE (1,12);
INSERT INTO grados_has_empleados (grados_grado,empleados_rut)
VALUE (2,1);
INSERT INTO grados_has_empleados (grados_grado,empleados_rut)
VALUE (3,8);
INSERT INTO grados_has_empleados (grados_grado,empleados_rut)
VALUE (3,50);
INSERT INTO grados_has_empleados (grados_grado,empleados_rut)
VALUE (4,32);
INSERT INTO grados_has_empleados (grados_grado,empleados_rut)
VALUE (4,10);

INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (1,1,10);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (2,1,3);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (3,1,4);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (5,2,4);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (5,2,5);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (3,2,6);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (5,3,6);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (4,3,10);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (3,3,3);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (3,4,6);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (5,5,3);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (5,6,3);
INSERT INTO ventas_detalle (productos_codigo, ventas_num_venta, cantidad)
VALUES (3,6,1);