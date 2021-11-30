--- Ejemplo 1
drop table vehiculos;
drop table persona;

CREATE TABLE persona(
	cedula         integer,
	nombre         nvarchar2(30),
	direccion      nvarchar2(30),
	email          nvarchar2(30),
	constraint     PKPersona primary key (cedula)
);

CREATE TABLE vehiculos ( 
	codigoCliente  integer , 
	valorFiscal float,
	constraint  PKVehiculos primary key (codigoCliente),
	constraint  FK1Vehiculos foreign key (codigoCliente) references persona (cedula)
);

INSERT INTO persona(cedula,nombre,direccion,email)VALUES(35,'Marta Garcia Garcia','c','f');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(36,'Paula Esteban Alvarez','y','t');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(37,'Claudia Alvarez Blanco','p','a');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(38,'Andrea Gomez Hernandez','x','d');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(39,'David Estevez Blanco','p','u');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(40,'Jorge Esteban Diaz','v','hh');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(41,'Alejandro Blanco Aguilar','c','ka');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(42,'Steven Bravo Hernandez','i','a');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(43,'Jorge Castillo Gomez','b','k');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(44,'Daniela Escudero Arias','v','s');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(45,'Laura Aguilar Fernandez','g','g');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(46,'Pablo Beltran Diez','b','u');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(47,'Marta Esteban Diez','f2','o');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(48,'Javier Alonso Gutierrez','e','r');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(49,'Pablo Dominguez Benitez','y','d');
INSERT INTO persona(cedula,nombre,direccion,email)VALUES(50,'Laura Espinosa Bravo','h','g');


INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (35,1500);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (36,200);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (37,,2500);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (38,500);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (39,510);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (40,515);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (41,475);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (42,2500);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (43,700);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (44,780);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (45,275);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (46,200);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (47,900);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (48,1000);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (49,900);
INSERT INTO vehiculos(codigoCliente,valorFiscal)VALUES (50,700);
