---- Ejemplo 2
DROP TABLE lineaDetalle;
DROP TABLE Producto;
DROP TABLE Proveedor;
DROP TABLE Factura;
DROP TABLE Zona;
DROP TABLE Cliente;

CREATE TABLE Cliente(
   cedulaCliente varchar2(12),
   nombre varchar2(100),
   email varchar2(100) UNIQUE,
   CONSTRAINT PKCLIENTE PRIMARY KEY(cedulaCliente)
);

CREATE TABLE Zona(
  codigo int,
  nombre varchar2(60),
  CONSTRAINT PKZONA PRIMARY KEY(codigo)
);

CREATE TABLE Factura(
   consecutivo int,
   fecha date NOT NULL,
   zona int,
   cedula varchar2(12),
   CONSTRAINT PKFACTURA PRIMARY KEY(consecutivo),
   CONSTRAINT FK1_FACTURA FOREIGN KEY(cedula) REFERENCES cliente(cedulaCliente),
   CONSTRAINT FK2_FACTURA FOREIGN KEY(zona) REFERENCES Zona(codigo)
);

CREATE TABLE Proveedor(
 codigo int,
 nombre varchar2(250),
 pais int,
 CONSTRAINT PKPROVEEDOR PRIMARY KEY(codigo) 
);

CREATE TABLE Producto(
  codigoBarras varchar2(24),
  descripcion varchar2(250),
  precio float,
  proveedor int,
  CONSTRAINT PKPRODUCTO PRIMARY KEY(codigoBarras),
  CONSTRAINT FK_PRODUCTO FOREIGN KEY (proveedor) REFERENCES Proveedor(codigo)
);

CREATE TABLE lineaDetalle(
  factura int,
  producto varchar2(100),
  cantidad int,
  precioUnitario float,
  CONSTRAINT PKLINEADETALLE PRIMARY KEY(factura,producto),
  CONSTRAINT FK1_LINEADETALLE FOREIGN KEY(factura) REFERENCES Factura(consecutivo),
  CONSTRAINT FK2_LINEADETALLE FOREIGN KEY(producto) REFERENCES Producto(codigoBarras)
);

INSERT INTO Cliente VALUES('114450640','Alexander Camacho', 'alexcp91@gmail.com');
INSERT INTO Cliente VALUES('463874487','Juan Parez', 'jp@hotmail.com');
INSERT INTO Cliente VALUES('875676766','Laura Chinchilla', 'lauchi@yahoo.com');
INSERT INTO Cliente VALUES('123456788','Milanta Segura', 'miliSe2@gmail.com');
INSERT INTO Cliente VALUES('464823828','Alonso Heredia', 'alohe@gmail.com');

INSERT INTO Zona VALUES(1,'San Jose');
INSERT INTO Zona VALUES(2,'Alajuela');
INSERT INTO Zona VALUES(3,'Cartago');
INSERT INTO Zona VALUES(4,'Heredia');
INSERT INTO Zona VALUES(5,'Guanacaste');
INSERT INTO Zona VALUES(6,'Puntarenas');
INSERT INTO Zona VALUES(7,'Limón');

INSERT INTO Factura VALUES(1,TO_DATE('10/04/13','DD/MM/YY'),2,'114450640');
INSERT INTO Factura VALUES(2,TO_DATE('23/05/12','DD/MM/YY'),3,'875676766');
INSERT INTO Factura VALUES(3,TO_DATE('10/07/13','DD/MM/YY'),7,'463874487');
INSERT INTO Factura VALUES(4,TO_DATE('10/04/11','DD/MM/YY'),4,'114450640');
INSERT INTO Factura VALUES(5,TO_DATE('10/01/12','DD/MM/YY'),2,'123456788');
INSERT INTO Factura VALUES(6,TO_DATE('08/12/11','DD/MM/YY'),3,'463874487');
INSERT INTO Factura VALUES(7,TO_DATE('10/04/11','DD/MM/YY'),4,'114450640');
INSERT INTO Factura VALUES(8,TO_DATE('03/04/95','DD/MM/YY'),1,'123456788');
INSERT INTO Factura VALUES(9,TO_DATE('10/09/10','DD/MM/YY'),4,'463874487');
INSERT INTO Factura VALUES(10,TO_DATE('03/04/09','DD/MM/YY'),4,'875676766');
INSERT INTO Factura VALUES(11,TO_DATE('04/04/09','DD/MM/YY'),4,'123456788');
INSERT INTO Factura VALUES(12,TO_DATE('12/04/09','DD/MM/YY'),4,'463874487');
INSERT INTO Factura VALUES(13,TO_DATE('08/03/09','DD/MM/YY'),4,'875676766');
INSERT INTO Factura VALUES(14,TO_DATE('01/05/09','DD/MM/YY'),4,'123456788');
INSERT INTO Factura VALUES(15,TO_DATE('11/02/09','DD/MM/YY'),4,'875676766');

INSERT INTO Proveedor VALUES(123,'SysCom',234);
INSERT INTO Proveedor VALUES(134,'PowerSys',389);
INSERT INTO Proveedor VALUES(167,'DivesTO',506);
INSERT INTO Proveedor VALUES(764,'RagMAC',506);
INSERT INTO Proveedor VALUES(345,'ElecPlusPlus',127);
INSERT INTO Proveedor VALUES(874,'CAPSULECorporation',404);
INSERT INTO Proveedor VALUES(110,'DosPinos',345);
INSERT INTO Proveedor VALUES(009,'MISIplus',383);
INSERT INTO Proveedor VALUES(003,'antlantisElectronics',022);
INSERT INTO Proveedor VALUES(993,'pedropacoINC',220);
INSERT INTO Proveedor VALUES(001,'MonstersInc',434);
INSERT INTO Proveedor VALUES(133,'Chalalacr',344);
INSERT INTO Proveedor VALUES(314,'muchoConDemasiadoINC',550);
INSERT INTO Proveedor VALUES(124,'laLocaINC',468);
INSERT INTO Proveedor VALUES(030,'MASDALUPITA',466);


INSERT INTO Producto VALUES('0001','electronico',6287,030);
INSERT INTO Producto VALUES('0002','electronico',34234,123);
INSERT INTO Producto VALUES('0003','electronico',42934,874);
INSERT INTO Producto VALUES('0004','electronico',2345,030);
INSERT INTO Producto VALUES('0005','electronico',99992,030);
INSERT INTO Producto VALUES('0006','electronico',76577,124);
INSERT INTO Producto VALUES('0007','electronico',10345,133);
INSERT INTO Producto VALUES('0008','electronico',158903,124);
INSERT INTO Producto VALUES('0009','electronico',46378,001);
INSERT INTO Producto VALUES('0010','GUGU',5000,133);
INSERT INTO Producto VALUES('0011','LecheDescremada',1000,110);
INSERT INTO Producto VALUES('0012','Zepol',2000,009);
INSERT INTO Producto VALUES('0013','helado',1000,110);
INSERT INTO Producto VALUES('0014','chiles',200,009);
INSERT INTO Producto VALUES('0015','electronico',44126,993);
INSERT INTO Producto VALUES('0016','electronico',44126,993);
INSERT INTO Producto VALUES('0017','electronico',44126,003);
INSERT INTO Producto VALUES('0018','electronico',44126,874);
INSERT INTO Producto VALUES('0019','electronico',44126,003);
INSERT INTO Producto VALUES('0020','electronico',44126,874);
INSERT INTO Producto VALUES('0021','electronico',44126,874);
INSERT INTO Producto VALUES('0022','electronico',44126,874);
INSERT INTO Producto VALUES('0023','electronico',44126,134);
INSERT INTO Producto VALUES('0024','electronico',44126,874);
INSERT INTO Producto VALUES('0025','electronico',44126,874);
INSERT INTO Producto VALUES('0026','electronico',44126,345);
INSERT INTO Producto VALUES('0027','electronico',44126,134);
INSERT INTO Producto VALUES('0028','electronico',44126,345);
INSERT INTO Producto VALUES('0029','electronico',44126,764);
INSERT INTO Producto VALUES('0030','electronico',44126,123);
INSERT INTO Producto VALUES('0031','electronico',44126,167);
INSERT INTO Producto VALUES('0032','electronico',44126,123);
INSERT INTO Producto VALUES('0033','electronico',44126,134);

INSERT INTO lineaDetalle VALUES(1,'0001',1,1238);
INSERT INTO lineaDetalle VALUES(2,'0002',5,4489);
INSERT INTO lineaDetalle VALUES(3,'0003',2,4934);
INSERT INTO lineaDetalle VALUES(4,'0004',1,2453);
INSERT INTO lineaDetalle VALUES(5,'0005',5,2237);
INSERT INTO lineaDetalle VALUES(5,'0006',5,7657);
INSERT INTO lineaDetalle VALUES(6,'0007',5,1034);
INSERT INTO lineaDetalle VALUES(7,'0008',5,9127);
INSERT INTO lineaDetalle VALUES(8,'0009',1,4404);
INSERT INTO lineaDetalle VALUES(9,'0010',5,4904);
INSERT INTO lineaDetalle VALUES(10,'0011',1,3945);
INSERT INTO lineaDetalle VALUES(11,'0012',5,5906);
INSERT INTO lineaDetalle VALUES(12,'0013',1,4345);
INSERT INTO lineaDetalle VALUES(13,'0014',2,1727);
INSERT INTO lineaDetalle VALUES(14,'0015',5,38793);
INSERT INTO lineaDetalle VALUES(15,'0016',2,42236);
INSERT INTO lineaDetalle VALUES(1,'0017',6,3898);
INSERT INTO lineaDetalle VALUES(2,'0018',6,3838);
INSERT INTO lineaDetalle VALUES(3,'0019',6,2208);
INSERT INTO lineaDetalle VALUES(4,'0020',6,9229);
INSERT INTO lineaDetalle VALUES(5,'0021',6,3889);
INSERT INTO lineaDetalle VALUES(6,'0022',6,38967);
INSERT INTO lineaDetalle VALUES(7,'0023',6,2326);
INSERT INTO lineaDetalle VALUES(8,'0024',6,1326);
INSERT INTO lineaDetalle VALUES(9,'0025',6,2226);
INSERT INTO lineaDetalle VALUES(10,'0026',1,23226);
INSERT INTO lineaDetalle VALUES(11,'0027',6,23226);
INSERT INTO lineaDetalle VALUES(12,'0028',1,23226);
INSERT INTO lineaDetalle VALUES(13,'0029',6,2226);
INSERT INTO lineaDetalle VALUES(7,'0030',6,23226);
INSERT INTO lineaDetalle VALUES(15,'0031',3,3226);
INSERT INTO lineaDetalle VALUES(1,'0032',6,23226);
INSERT INTO lineaDetalle VALUES(7,'0033',6,23226);




