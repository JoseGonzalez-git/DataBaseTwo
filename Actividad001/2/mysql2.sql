CREATE TABLE estados (
  idestado INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre_estado VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(idestado));



CREATE TABLE familias (
  idfamilia INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre_familia VARCHAR(20)  NOT NULL  ,
  n_integrantes INTEGER UNSIGNED  NOT NULL  ,
  tiempo_familia DATE  NOT NULL    ,
PRIMARY KEY(idfamilia));



CREATE TABLE miembros (
  idmiembro INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  familias_idfamilia INTEGER UNSIGNED  NOT NULL  ,
  nom1 VARCHAR(20)  NOT NULL  ,
  nom2 VARCHAR(20)  NULL  ,
  apll1 VARCHAR(35)  NOT NULL  ,
  apll2 VARCHAR(35)  NOT NULL    ,
PRIMARY KEY(idmiembro)  ,
INDEX miembro_FKIndex1(familias_idfamilia),
  FOREIGN KEY(familias_idfamilia)
    REFERENCES familias(idfamilia)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE actividades (
  idactividad INTEGER UNSIGNED ZEROFILL  NOT NULL   AUTO_INCREMENT,
  estados_idestado INTEGER UNSIGNED  NOT NULL  ,
  nombre_actividad VARCHAR(45)  NOT NULL    ,
PRIMARY KEY(idactividad)  ,
INDEX actividad_FKIndex1(estados_idestado),
  FOREIGN KEY(estados_idestado)
    REFERENCES estados(idestado)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE bienes_actividad (
  idbienes_actividad INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  actividades_idactividad INTEGER UNSIGNED ZEROFILL  NOT NULL  ,
  descripcion TEXT  NOT NULL    ,
PRIMARY KEY(idbienes_actividad)  ,
INDEX bienes_actividad_FKIndex1(actividades_idactividad),
  FOREIGN KEY(actividades_idactividad)
    REFERENCES actividades(idactividad)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE bienes_familia (
  idbienes_familia INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  familias_idfamilia INTEGER UNSIGNED  NOT NULL  ,
  descripcion TEXT  NOT NULL    ,
PRIMARY KEY(idbienes_familia)  ,
INDEX bienes_familia_FKIndex1(familias_idfamilia),
  FOREIGN KEY(familias_idfamilia)
    REFERENCES familias(idfamilia)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE edades (
  idedades INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  estados_idestado INTEGER UNSIGNED  NOT NULL  ,
  miembros_idmiembro INTEGER UNSIGNED  NOT NULL  ,
  categoria_edad VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(idedades)  ,
INDEX edades_FKIndex1(miembros_idmiembro)  ,
INDEX edades_FKIndex2(estados_idestado),
  FOREIGN KEY(miembros_idmiembro)
    REFERENCES miembros(idmiembro)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(estados_idestado)
    REFERENCES estados(idestado)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




