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

INSERT INTO hospital (hospital_cod, nombre, direccion, telefono, num_cama)
VALUE (12,'Herazmo','Calle 34','22222222',100);
INSERT INTO hospital (hospital_cod, nombre, direccion, telefono, num_cama)
VALUE (23,'Francisco','Calle 87','33333333',200);
INSERT INTO hospital (hospital_cod, nombre, direccion, telefono, num_cama)
VALUE (36,'San Jose','Calle 90','44444444',300);
INSERT INTO hospital (hospital_cod, nombre, direccion, telefono, num_cama)
VALUE (45,'General','Calle 91', '55555555',400);

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
VALUE (5,45,'Sala 5',27);

INSERT INTO emp (emp_no,dept_no_dept_no,apellido,oficio,dir,fecha_alta,salario,comision)
VALUE (7698,20,'BLAKE','Director',7698,'2002-05-10',1650,null);
INSERT INTO emp (emp_no,dept_no_dept_no,apellido,oficio,dir,fecha_alta,salario,comision)
VALUE (7369,5,'SMITH','Vendedor',7698,'2001-12-17',800,30);
INSERT INTO emp (emp_no,dept_no_dept_no,apellido,oficio,dir,fecha_alta,salario,comision)
VALUE (7499,5,'ALLEN','Vendedor',7698,'2002-05-02',1000,100);
INSERT INTO emp (emp_no,dept_no_dept_no,apellido,oficio,dir,fecha_alta,salario,comision)
VALUE (7521,10,'WARD','Analista',7698,'2002-05-10',1250,null);
INSERT INTO emp (emp_no,dept_no_dept_no,apellido,oficio,dir,fecha_alta,salario,comision)
VALUE (7566,15,'JONES','Empleado',7698,'2002-05-10',1250,null); 

INSERT INTO doctor (doctor_no, hospital_cod, apellido, especialidad)
VALUE (1,12,'Valencia','Cardiologia');
INSERT INTO doctor (doctor_no, hospital_cod, apellido, especialidad)
VALUE (2,23,'Hernandez','Ginecologia');
INSERT INTO doctor (doctor_no, hospital_cod, apellido, especialidad)
VALUE (3,36,'Mendez','Pediatra');
INSERT INTO doctor (doctor_no, hospital_cod, apellido, especialidad)
VALUE (4,45,'Araujo','Psiquiatria');

INSERT INTO plantilla (emp_no,hospital_cod,sala_cod,apellido,funcion,turno,salario)
VALUE (7499,12,1,'BLAKE','ENFERMERA','T',800);
INSERT INTO plantilla (emp_no,hospital_cod,sala_cod,apellido,funcion,turno,salario)
VALUE (7369,23,2,'SMITH','ENFERMERA','M',1000);
INSERT INTO plantilla (emp_no,hospital_cod,sala_cod,apellido,funcion,turno,salario)
VALUE (7499,36,3,'ALLEN','INTERNO','N',880);
Insert INTO plantilla (emp_no,hospital_cod,sala_cod,apellido,funcion,turno,salario)
VALUE (7521,45,4,'WARD','ENFERMERO','T',1200);
Insert INTO plantilla (emp_no,hospital_cod,sala_cod,apellido,funcion,turno,salario)
VALUE (7566,45,5,'JONES','ENFERMERO','N',1300);

INSERT INTO ocupacion (enfermo_inscripcion,hospital_cod,sala_cod,cama)
VALUE (54367,12,1,1);
INSERT INTO ocupacion (enfermo_inscripcion,hospital_cod,sala_cod,cama)
VALUE (10995,23,2,2);
INSERT INTO ocupacion (enfermo_inscripcion,hospital_cod,sala_cod,cama)
VALUE (42315,36,3,3);
INSERT INTO ocupacion (enfermo_inscripcion,hospital_cod,sala_cod,cama)
VALUE (78433,45,4,1);
INSERT INTO ocupacion (enfermo_inscripcion,hospital_cod,sala_cod,cama)
VALUE (24125,45,5,2);