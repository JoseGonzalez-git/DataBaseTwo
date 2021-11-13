CREATE TABLE productos (
  codigo INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(100)  NOT NULL  ,
  precio DECIMAL  NOT NULL    ,
PRIMARY KEY(codigo));



CREATE TABLE deptos (
  numdep INTEGER  NOT NULL  ,
  nombre VARCHAR(100)  NOT NULL  ,
  ciudad VARCHAR(100)  NOT NULL    ,
PRIMARY KEY(numdep));



CREATE TABLE clientes (
  rut INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(100)  NOT NULL  ,
  comuna VARCHAR(100)  NOT NULL    ,
PRIMARY KEY(rut));



CREATE TABLE empleados (
  rut INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(100)  NOT NULL  ,
  cargo VARCHAR(10)  NOT NULL  ,
  rut_jefe INTEGER UNSIGNED  NOT NULL  ,
  sueldo DECIMAL  NOT NULL  ,
  comision  DECIMAL  NOT NULL  ,
  deptos_numdep INTEGER  NOT NULL    ,
PRIMARY KEY(rut)  ,
INDEX empleados_FKIndex1(deptos_numdep),
  FOREIGN KEY(deptos_numdep)
    REFERENCES deptos(numdep)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE ventas (
  num_venta INTEGER UNSIGNED  NOT NULL  ,
  empleados_rut INTEGER UNSIGNED  NOT NULL  ,
  clientes_rut INTEGER UNSIGNED  NOT NULL  ,
  monto DECIMAL  NOT NULL  ,
  fecha DATE  NOT NULL    ,
PRIMARY KEY(num_venta)  ,
INDEX ventas_FKIndex1(clientes_rut)  ,
INDEX ventas_FKIndex2(empleados_rut),
  FOREIGN KEY(clientes_rut)
    REFERENCES clientes(rut)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(empleados_rut)
    REFERENCES empleados(rut)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE grados (
  grado INTEGER UNSIGNED  NOT NULL  ,
  empleados_rut INTEGER UNSIGNED  NOT NULL  ,
  sueldo_inf DECIMAL  NOT NULL  ,
  sueldo_sup DECIMAL  NULL    ,
PRIMARY KEY(grado)  ,
INDEX grados_FKIndex1(empleados_rut),
  FOREIGN KEY(empleados_rut)
    REFERENCES empleados(rut)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE ventas_detalle (
  productos_codigo INTEGER UNSIGNED  NOT NULL  ,
  ventas_num_venta INTEGER UNSIGNED  NOT NULL  ,
  cantidad INTEGER UNSIGNED  NOT NULL    ,
INDEX ventas_detalle_FKIndex1(ventas_num_venta)  ,
INDEX ventas_detalle_FKIndex2(productos_codigo),
  FOREIGN KEY(ventas_num_venta)
    REFERENCES ventas(num_venta)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(productos_codigo)
    REFERENCES productos(codigo)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




