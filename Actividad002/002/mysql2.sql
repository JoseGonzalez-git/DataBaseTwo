CREATE TABLE enfermo (
  inscripcion INTEGER(5) UNSIGNED  NOT NULL  ,
  apellido VARCHAR(15)  NULL  ,
  direccion VARCHAR(20)  NULL  ,
  fecha_nac DATE  NULL  ,
  sexo VARCHAR(1)  NULL  ,
  nss INTEGER(9) UNSIGNED  NULL    ,
PRIMARY KEY(inscripcion));



CREATE TABLE hospital (
  hospital_cod INTEGER(2) UNSIGNED  NOT NULL  ,
  nombre VARCHAR(10)  NULL  ,
  direccion VARCHAR(20)  NULL  ,
  telefono VARCHAR(8)  NULL  ,
  num_cama INTEGER(3) UNSIGNED  NULL    ,
PRIMARY KEY(hospital_cod));



CREATE TABLE dept_no (
  dept_no INTEGER(2) UNSIGNED  NOT NULL  ,
  dnombre VARCHAR(14)  NULL  ,
  loc VARCHAR(14)  NULL    ,
PRIMARY KEY(dept_no));



CREATE TABLE sala (
  sala_cod INTEGER(2) UNSIGNED  NOT NULL  ,
  hospital_cod INTEGER(2) UNSIGNED  NOT NULL  ,
  nombre VARCHAR(20)  NULL  ,
  num_cama INTEGER(3) UNSIGNED  NULL    ,
PRIMARY KEY(sala_cod)  ,
INDEX sala_FKIndex1(hospital_cod),
  FOREIGN KEY(hospital_cod)
    REFERENCES hospital(hospital_cod)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE emp (
  emp_no INTEGER(4) UNSIGNED  NOT NULL  ,
  dept_no_dept_no INTEGER(2) UNSIGNED  NOT NULL  ,
  apellido VARCHAR(10)  NULL  ,
  oficio VARCHAR(10)  NULL  ,
  dir INTEGER(4) UNSIGNED  NULL  ,
  fecha_alta DATE  NULL  ,
  salario DECIMAL  NULL  ,
  comision DECIMAL  NULL    ,
PRIMARY KEY(emp_no)  ,
INDEX emp_FKIndex1(dept_no_dept_no),
  FOREIGN KEY(dept_no_dept_no)
    REFERENCES dept_no(dept_no)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE doctor (
  doctor_no INTEGER(3) UNSIGNED  NOT NULL  ,
  hospital_cod INTEGER(2) UNSIGNED  NOT NULL   AUTO_INCREMENT,
  apellido VARCHAR(13)  NULL  ,
  especialidad VARCHAR(16) NULL    ,
PRIMARY KEY(doctor_no)  ,
INDEX doctor_FKIndex1(hospital_cod),
  FOREIGN KEY(hospital_cod)
    REFERENCES hospital(hospital_cod)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE plantilla (
  emp_no INTEGER(4) UNSIGNED  NOT NULL  ,
  hospital_cod INTEGER(2) UNSIGNED  NOT NULL  ,
  sala_cod INTEGER(2) UNSIGNED  NOT NULL  ,
  apellido VARCHAR(15)  NULL  ,
  funcion VARCHAR(10)  NULL  ,
  turno VARCHAR(1)  NULL  ,
  salario DECIMAL  NULL    ,
INDEX plantilla_FKIndex1(hospital_cod)  ,
INDEX plantilla_FKIndex2(sala_cod)  ,
INDEX plantilla_FKIndex3(emp_no),
  FOREIGN KEY(hospital_cod)
    REFERENCES hospital(hospital_cod)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(sala_cod)
    REFERENCES sala(sala_cod)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(emp_no)
    REFERENCES emp(emp_no)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE ocupacion (
  enfermo_inscripcion INTEGER(5) UNSIGNED  NOT NULL  ,
  hospital_cod INTEGER(2) UNSIGNED  NOT NULL  ,
  sala_cod INTEGER(2) UNSIGNED  NOT NULL  ,
  cama INTEGER(10) UNSIGNED  NULL    ,
INDEX ocupacion_FKIndex1(hospital_cod)  ,
INDEX ocupacion_FKIndex2(sala_cod)  ,
INDEX ocupacion_FKIndex3(enfermo_inscripcion),
  FOREIGN KEY(hospital_cod)
    REFERENCES hospital(hospital_cod)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(sala_cod)
    REFERENCES sala(sala_cod)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(enfermo_inscripcion)
    REFERENCES enfermo(inscripcion)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




