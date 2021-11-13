INSERT INTO enfermo (inscripcion,apellido,direccion,fecha_nac,sexo,nss) 
VALUE (10995,'Valencia M.','Calle 13','1967-04-23','M',280862482);
INSERT INTO enfermo (inscripcion,apellido,direccion,fecha_nac,sexo,nss) 
VALUE (42315,'Hernandez G.','Calle 53','1968-01-17','F',311969044);
INSERT INTO enfermo (inscripcion,apellido,direccion,fecha_nac,sexo,nss) 
VALUE (54367,'Mendez A.','Calle 32','1969-04-24','M',234556547);
INSERT INTO enfermo (inscripcion,apellido,direccion,fecha_nac,sexo,nss) 
VALUE (78433,'Pereira E.','Calle 23','1967-04-24','F',264577868);
INSERT INTO enfermo (inscripcion,apellido,direccion,fecha_nac,sexo,nss) 
VALUE (24125,'Alvarez E.','Calle 24','1972-08-07','M',264567689);

INSERT INTO hospitales (hospitales_cod, nombre, direccion, telefono, num_cama)
VALUE (12,'Herazmo Meoz','Calle 34');
INSERT INTO hospitales (hospitales_cod, nombre, direccion, telefono, num_cama)
VALUE (23,'San Francisco Asis','Calle 87');
INSERT INTO hospitales (hospitales_cod, nombre, direccion, telefono, num_cama)
VALUE (36,'San Jose','Calle 90');
INSERT INTO hospitales (hospitales_cod, nombre, direccion, telefono, num_cama)
VALUE (45,'General','Calle 91');

INSERT INTO dept_no (dept_no, dnombre, loc)
VALUE (5,'Ventas','MONTERIA');
INSERT INTO dept_no (dept_no, dnombre, loc)
VALUE (10,'Investigacion','COVEÑAS');
INSERT INTO dept_no (dept_no, dnombre, loc)
VALUE (15,'Contabilidad','MONPOX');
INSERT INTO dept_no (dept_no, dnombre, loc)
VALUE (20,'Operaciones','CALI');

INSERT INTO sala (sala_cod,hospital_cod,nombre,num_cama)
VALUE (1,12,'Sala 1',10);
INSERT INTO sala (sala_cod,hospital_cod,nombre,num_cama)
VALUE (2,23,'Sala 2',15);
INSERT INTO sala (sala_cod,hospital_cod,nombre,num_cama)
VALUE (3,36,'Sala 3',20);
INSERT INTO sala (sala_cod,hospital_cod,nombre,num_cama)
VALUE (4,45,'Sala 4',23);
INSERT INTO sala (sala_cod,hospital_cod,nombre,num_cama)
VALUE (4,45,'Sala 5',27);

INSERT INTO emp ()