CREATE TABLE familias (
  idfamilia INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre_familia VARCHAR(20)  NOT NULL  ,
  tiempo_familia DATE  NOT NULL    ,
PRIMARY KEY(idfamilia));



CREATE TABLE bienes_actividad (
  idbienes_actividad INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  descripcion TEXT  NOT NULL    ,
PRIMARY KEY(idbienes_actividad));



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



CREATE TABLE edades (
  idedades INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  miembros_idmiembro INTEGER UNSIGNED  NOT NULL  ,
  categoria_edad VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(idedades)  ,
INDEX edades_FKIndex1(miembros_idmiembro),
  FOREIGN KEY(miembros_idmiembro)
    REFERENCES miembros(idmiembro)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE actividades (
  idactividad INTEGER UNSIGNED ZEROFILL  NOT NULL   AUTO_INCREMENT,
  bienes_actividad_idbienes_actividad INTEGER UNSIGNED  NOT NULL  ,
  nombre_actividad VARCHAR(45)  NOT NULL    ,
PRIMARY KEY(idactividad)  ,
INDEX actividades_FKIndex1(bienes_actividad_idbienes_actividad),
  FOREIGN KEY(bienes_actividad_idbienes_actividad)
    REFERENCES bienes_actividad(idbienes_actividad)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



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



CREATE TABLE estados (
  idestado INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  edades_idedades INTEGER UNSIGNED  NOT NULL  ,
  actividades_idactividad INTEGER UNSIGNED ZEROFILL  NOT NULL  ,
  nombre_estado VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(idestado)  ,
INDEX estados_FKIndex1(actividades_idactividad)  ,
INDEX estados_FKIndex2(edades_idedades),
  FOREIGN KEY(actividades_idactividad)
    REFERENCES actividades(idactividad)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(edades_idedades)
    REFERENCES edades(idedades)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




