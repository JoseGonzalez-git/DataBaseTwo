DROP DATABASE IF EXISTS jardineria;
CREATE DATABASE jardineria CHARACTER SET utf8mb4;
USE jardineria;

CREATE TABLE oficina (
  codigo_oficina VARCHAR(10) NOT NULL,
  ciudad VARCHAR(30) NOT NULL,
  pais VARCHAR(50) NOT NULL,
  region VARCHAR(50) DEFAULT NULL,
  codigo_postal VARCHAR(10) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (codigo_oficina)
);

CREATE TABLE empleado (
  codigo_empleado INTEGER NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) DEFAULT NULL,
  extension VARCHAR(10) NOT NULL,
  email VARCHAR(100) NOT NULL,
  codigo_oficina VARCHAR(10) NOT NULL,
  codigo_jefe INTEGER DEFAULT NULL,
  puesto VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (codigo_empleado),
  FOREIGN KEY (codigo_oficina) REFERENCES oficina (codigo_oficina),
  FOREIGN KEY (codigo_jefe) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE gama_producto (
  gama VARCHAR(50) NOT NULL,
  descripcion_texto TEXT,
  descripcion_html TEXT,
  imagen VARCHAR(256),
  PRIMARY KEY (gama)
);

CREATE TABLE cliente (
  codigo_cliente INTEGER NOT NULL,
  nombre_cliente VARCHAR(50) NOT NULL,
  nombre_contacto VARCHAR(30) DEFAULT NULL,
  apellido_contacto VARCHAR(30) DEFAULT NULL,
  telefono VARCHAR(15) NOT NULL,
  fax VARCHAR(15) NOT NULL,
  linea_direccion1 VARCHAR(50) NOT NULL,
  linea_direccion2 VARCHAR(50) DEFAULT NULL,
  ciudad VARCHAR(50) NOT NULL,
  region VARCHAR(50) DEFAULT NULL,
  pais VARCHAR(50) DEFAULT NULL,
  codigo_postal VARCHAR(10) DEFAULT NULL,
  codigo_empleado_rep_ventas INTEGER DEFAULT NULL,
  limite_credito NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (codigo_cliente),
  FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado (codigo_empleado)
);

CREATE TABLE pedido (
  codigo_pedido INTEGER NOT NULL,
  fecha_pedido date NOT NULL,
  fecha_esperada date NOT NULL,
  fecha_entrega date DEFAULT NULL,
  estado VARCHAR(15) NOT NULL,
  comentarios TEXT,
  codigo_cliente INTEGER NOT NULL,
  PRIMARY KEY (codigo_pedido),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);

CREATE TABLE producto (
  codigo_producto VARCHAR(15) NOT NULL,
  nombre VARCHAR(70) NOT NULL,
  gama VARCHAR(50) NOT NULL,
  dimensiones VARCHAR(25) NULL,
  proveedor VARCHAR(50) DEFAULT NULL,
  descripcion text NULL,
  cantidad_en_stock SMALLINT NOT NULL,
  precio_venta NUMERIC(15,2) NOT NULL,
  precio_proveedor NUMERIC(15,2) DEFAULT NULL,
  PRIMARY KEY (codigo_producto),
  FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

CREATE TABLE detalle_pedido (
  codigo_pedido INTEGER NOT NULL,
  codigo_producto VARCHAR(15) NOT NULL,
  cantidad INTEGER NOT NULL,
  precio_unidad NUMERIC(15,2) NOT NULL,
  numero_linea SMALLINT NOT NULL,
  PRIMARY KEY (codigo_pedido, codigo_producto),
  FOREIGN KEY (codigo_pedido) REFERENCES pedido (codigo_pedido),
  FOREIGN KEY (codigo_producto) REFERENCES producto (codigo_producto)
);

CREATE TABLE pago (
  codigo_cliente INTEGER NOT NULL,
  forma_pago VARCHAR(40) NOT NULL,
  id_transaccion VARCHAR(50) NOT NULL,
  fecha_pago date NOT NULL,
  total NUMERIC(15,2) NOT NULL,
  PRIMARY KEY (codigo_cliente, id_transaccion),
  FOREIGN KEY (codigo_cliente) REFERENCES cliente (codigo_cliente)
);



-- Datos
INSERT INTO oficina VALUES ('RJ-BRA','Rio de Janeiro','Brazil','RJ','08019','+34 93 3561182','Avenida Diagonal, 38','3A escalera Derecha');
INSERT INTO oficina VALUES ('B-CO','Bogotá','Colombia','B','02108','+57 314 837 0825','Avenida Carrera, 20','3er Piso');
INSERT INTO oficina VALUES ('M-I','Mánchester','Inglaterra','M','EC2N 1HN','+44 20 78772041','52 Old Broad Street','Ground Floor');
INSERT INTO oficina VALUES ('MAD-ES','Madrid','España','Madrid','28032','+34 91 7514487','Bulevar Indalecio Prieto, 32','');
INSERT INTO oficina VALUES ('MAR-FR','Marsella','Francia','MF','75017','+33 14 723 4404','29 Rue Jouffroy d''abbans','');
INSERT INTO oficina VALUES ('SFC-USA','San Francisco','EEUU','CA','94080','+1 650 219 4782','100 Market Street','Suite 300');
INSERT INTO oficina VALUES ('D-EA','Dubai','Emiratos Arabes','DE','NSW 2010','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2');

INSERT INTO empleado VALUES (1,'Marcos','Magaña','Perez','3897','marcos@jardineria.es','RJ-BRA',1,'Director General');
INSERT INTO empleado VALUES (2,'Ruben','López','Martinez','2899','rlopez@jardineria.es','B-CO',2,'Subdirector Marketing');
INSERT INTO empleado VALUES (3,'Alberto','Soria','Carrasco','2837','asoria@jardineria.es','M-I',3,'Subdirector Ventas');
INSERT INTO empleado VALUES (4,'Maria','Solís','Jerez','2847','msolis@jardineria.es','MAD-ES',4,'Secretaria');
INSERT INTO empleado VALUES (5,'Felipe','Rosas','Marquez','2844','frosas@jardineria.es','MAR-FR',5,'Representante Ventas');
INSERT INTO empleado VALUES (6,'Juan Carlos','Ortiz','Serrano','2845','cortiz@jardineria.es','SFC-USA',6,'Representante Ventas');
INSERT INTO empleado VALUES (7,'Carlos','Soria','Jimenez','2444','csoria@jardineria.es','D-EA',7,'Director Oficina');

INSERT INTO gama_producto VALUES ('Herbaceas','Plantas para jardin decorativas',NULL,NULL);
INSERT INTO gama_producto VALUES ('Herramientas','Herramientas para todo tipo de acción',NULL,NULL);
INSERT INTO gama_producto VALUES ('Aromáticas','Plantas aromáticas',NULL,NULL);
INSERT INTO gama_producto VALUES ('Frutales','Árboles pequeños de producción frutal',NULL,NULL);
INSERT INTO gama_producto VALUES ('Ornamentales','Plantas vistosas para la decoración del jardín',NULL,NULL);

INSERT INTO cliente VALUES (1,'GoldFish Garden','Daniel G','GoldFish','5556901745','5556901746','False Street 52 2 A',NULL,'Bogotá',NULL,'Colombia','24006',1,3000);
INSERT INTO cliente VALUES (2,'Club Golf Puerta del hierro','Paco','Lopez','62456810','919535678','C/sinesio delgado','Madrid','Madrid','Madrid','Spain','28930',2,40000);
INSERT INTO cliente VALUES (3,'Gardening Associates','Anne','Wright','5557410345','5557410346','Wall-e Avenue',NULL,'Miami','Miami','USA','24010',3,6000);
INSERT INTO cliente VALUES (4,'Gerudo Valley','Link','Flaute','5552323129','5552323128','Oaks Avenue nº22',NULL,'New York',NULL,'USA','85495',4,12000);
INSERT INTO cliente VALUES (5,'Tendo Garden','Akane','Tendo','55591233210','55591233211','Null Street nº69',NULL,'Miami',NULL,'USA','696969',5,600000);
INSERT INTO cliente VALUES (6,'Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',6,154310);
INSERT INTO cliente VALUES (7,'Beragua','Jose','Bermejo','654987321','916549872','C/pintor segundo','Getafe','Madrid','Madrid','Spain','28942',7,20000);

INSERT INTO pedido VALUES (1,'2006-01-17','2006-01-19','2006-01-19','Entregado','Pagado a plazos',1);
INSERT INTO pedido VALUES (2,'2007-10-23','2007-10-28','2007-10-26','Entregado','La entrega llego antes de lo esperado',2);
INSERT INTO pedido VALUES (3,'2008-06-20','2008-06-25',NULL,'Rechazado','Limite de credito superado',3);
INSERT INTO pedido VALUES (4,'2009-01-20','2009-01-26',NULL,'Pendiente',NULL, 4);
INSERT INTO pedido VALUES (8,'2008-11-09','2008-11-14','2008-11-14','Entregado','El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas',5);
INSERT INTO pedido VALUES (9,'2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',6);
INSERT INTO pedido VALUES (10,'2009-01-15','2009-01-20',NULL,'Pendiente','El cliente llama para confirmar la fecha - Esperando al proveedor',7);

INSERT INTO producto VALUES ('FR-67','Cerezo','Frutales','16/18','Jerte Distribuciones S.L.','Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo \"Duke\", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado',50,70,56);
INSERT INTO producto VALUES ('FR-4','Naranjo calibre 8/10','Frutales','','NaranjasValencianas.com','El naranjo es un árbol pequeño, que no supera los 3-5 metros de altura, con una copa compacta, cónica, transformada en esérica gracias a la poda. Su tronco es de color gris y liso, y las hojas son perennes, coriáceas, de un verde intenso y brillante, con forma oval o elíptico-lanceolada. Poseen, en el caso del naranjo amargo, un típico peciolo alado en forma de Â‘corazónÂ’, que en el naranjo dulce es más estrecho y menos patente.',15,29,23);
INSERT INTO producto VALUES ('FR-48','Nogal Común','Frutales','','Frutales Talavera S.A','',400,9,7);
INSERT INTO producto VALUES ('FR-31','Ciruelo Santa Rosa','Frutales','','Frutales Talavera S.A','árbol de tamaño mediano que alcanza una altura máxima de 5-6 m. Tronco de corteza pardo-azulada, brillante, lisa o agrietada longitudinalmente. Produce ramas alternas, pequeñas, delgadas, unas veces lisas, glabras y otras pubescentes y vellosas',400,8,6);
INSERT INTO producto VALUES ('FR-106','Peral','Frutales','8/10','Frutales Talavera S.A','Árbol piramidal, redondeado en su juventud, luego oval, que llega hasta 20 metros de altura y por término medio vive 65 años.Tronco alto, grueso, de corteza agrietada, gris, de la cual se destacan con frecuencia placas lenticulares.Las ramas se insertan formando ángulo agudo con el tronco (45º), de corteza lisa, primero verde y luego gris-violácea, con numerosas lenticelas.',50,11,8);
INSERT INTO producto VALUES ('AR-001','Ajedrea','Aromáticas','15-20','Murcia Seasons','Planta aromática que fresca se utiliza para condimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes',140,1,0);
INSERT INTO producto VALUES ('FR-82','Higuera','Frutales','16/18','Frutales Talavera S.A','La higuera (Ficus carica L.) es un árbol típico de secano en los países mediterráneos. Su rusticidad y su fácil multiplicación hacen de la higuera un frutal muy apropiado para el cultivo extensivo.. Siempre ha sido considerado como árbol que no requiere cuidado alguno una vez plantado y arraigado, limitándose el hombre a recoger de él los frutos cuando maduran, unos para consumo en fresco y otros para conserva. Las únicas higueras con cuidados culturales esmerados, en muchas comarcas, son las brevales, por el interés económico de su primera cosecha, la de brevas.',50,70,56);

INSERT INTO detalle_pedido VALUES (1,'FR-67',10,70,3);
INSERT INTO detalle_pedido VALUES (2,'FR-4',3,29,6);
INSERT INTO detalle_pedido VALUES (3,'FR-48',120,9,6);
INSERT INTO detalle_pedido VALUES (4,'FR-31',12,8,7);
INSERT INTO detalle_pedido VALUES (8,'FR-106',3,11,1);
INSERT INTO detalle_pedido VALUES (9,'AR-001',80,1,3);
INSERT INTO detalle_pedido VALUES (10,'FR-82',5,70,2);


INSERT INTO pago VALUES (1,'PayPal','ak-std-000001','2008-11-10',2000);
INSERT INTO pago VALUES (2,'Transferencia','ak-std-000005','2009-02-19',926);
INSERT INTO pago VALUES (3,'PayPal','ak-std-000010','2007-01-08',1849);
INSERT INTO pago VALUES (4,'Transferencia','ak-std-000011','2006-01-18',23794);
INSERT INTO pago VALUES (5,'Cheque','ak-std-000012','2009-01-13',2390);
INSERT INTO pago VALUES (6,'Transferencia','ak-std-000013','2009-01-06',929);
INSERT INTO pago VALUES (7,'Cheque','ak-std-000014','2008-08-04',2246);

