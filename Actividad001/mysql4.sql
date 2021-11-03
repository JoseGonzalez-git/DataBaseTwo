CREATE TABLE personas (
  identificacion INTEGER UNSIGNED  NOT NULL  ,
  nom1 VARCHAR(20)  NOT NULL  ,
  nom2 VARCHAR(20)  NOT NULL  ,
  apll1 VARCHAR(35)  NOT NULL  ,
  apll2 VARCHAR(35)  NOT NULL  ,
  genero VARCHAR(10)  NOT NULL  ,
  fnac DATE  NOT NULL  ,
  telefono VARCHAR(45)  NOT NULL  ,
  email VARCHAR(255)  NOT NULL    ,
PRIMARY KEY(identificacion));



CREATE TABLE lugar (
  idlugar INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre VARCHAR(45)  NOT NULL  ,
  capacidad INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idlugar));



CREATE TABLE reuniones (
  idreuniones INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  lugar_idlugar INTEGER UNSIGNED  NOT NULL  ,
  tema VARCHAR(45)  NOT NULL  ,
  fecha_inicio DATE  NOT NULL    ,
PRIMARY KEY(idreuniones)  ,
INDEX reuniones_FKIndex1(lugar_idlugar),
  FOREIGN KEY(lugar_idlugar)
    REFERENCES lugar(idlugar)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE recursos (
  idrecursos INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  lugar_idlugar INTEGER UNSIGNED  NOT NULL  ,
  descripcion TEXT  NOT NULL    ,
PRIMARY KEY(idrecursos)  ,
INDEX recursos_FKIndex1(lugar_idlugar),
  FOREIGN KEY(lugar_idlugar)
    REFERENCES lugar(idlugar)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE agenda (
  personas_identificacion INTEGER UNSIGNED  NOT NULL  ,
  reuniones_idreuniones INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(personas_identificacion, reuniones_idreuniones)  ,
INDEX personas_has_reuniones_FKIndex1(personas_identificacion)  ,
INDEX personas_has_reuniones_FKIndex2(reuniones_idreuniones),
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(reuniones_idreuniones)
    REFERENCES reuniones(idreuniones)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




