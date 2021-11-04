CREATE TABLE estados (
  idestado SERIAL  NOT NULL ,
  nombre_estado VARCHAR(20)   NOT NULL   ,
PRIMARY KEY(idestado));




CREATE TABLE familias (
  idfamilia SERIAL  NOT NULL ,
  nombre_familia VARCHAR(20)   NOT NULL ,
  n_integrantes INTEGER   NOT NULL ,
  tiempo_familia DATE   NOT NULL   ,
PRIMARY KEY(idfamilia));




CREATE TABLE miembros (
  idmiembro SERIAL  NOT NULL ,
  familias_idfamilia INTEGER   NOT NULL ,
  nom1 VARCHAR(20)   NOT NULL ,
  nom2 VARCHAR(20)    ,
  apll1 VARCHAR(35)   NOT NULL ,
  apll2 VARCHAR(35)   NOT NULL   ,
PRIMARY KEY(idmiembro)  ,
  FOREIGN KEY(familias_idfamilia)
    REFERENCES familias(idfamilia)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX miembro_FKIndex1 ON miembros (familias_idfamilia);


CREATE INDEX IFK_pertenece ON miembros (familias_idfamilia);


CREATE TABLE actividades (
  idactividad SERIAL  NOT NULL ,
  estados_idestado INTEGER   NOT NULL ,
  nombre_actividad VARCHAR(45)   NOT NULL   ,
PRIMARY KEY(idactividad)  ,
  FOREIGN KEY(estados_idestado)
    REFERENCES estados(idestado)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX actividad_FKIndex1 ON actividades (estados_idestado);


CREATE INDEX IFK_contiene ON actividades (estados_idestado);


CREATE TABLE bienes_actividad (
  idbienes_actividad SERIAL  NOT NULL ,
  actividades_idactividad INTEGER   NOT NULL ,
  descripcion TEXT   NOT NULL   ,
PRIMARY KEY(idbienes_actividad)  ,
  FOREIGN KEY(actividades_idactividad)
    REFERENCES actividades(idactividad)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX bienes_actividad_FKIndex1 ON bienes_actividad (actividades_idactividad);


CREATE INDEX IFK_utilliza ON bienes_actividad (actividades_idactividad);


CREATE TABLE bienes_familia (
  idbienes_familia SERIAL  NOT NULL ,
  familias_idfamilia INTEGER   NOT NULL ,
  descripcion TEXT   NOT NULL   ,
PRIMARY KEY(idbienes_familia)  ,
  FOREIGN KEY(familias_idfamilia)
    REFERENCES familias(idfamilia)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX bienes_familia_FKIndex1 ON bienes_familia (familias_idfamilia);


CREATE INDEX IFK_recibe ON bienes_familia (familias_idfamilia);


CREATE TABLE edades (
  idedades SERIAL  NOT NULL ,
  estados_idestado INTEGER   NOT NULL ,
  miembros_idmiembro INTEGER   NOT NULL ,
  categoria_edad VARCHAR(20)   NOT NULL   ,
PRIMARY KEY(idedades)    ,
  FOREIGN KEY(miembros_idmiembro)
    REFERENCES miembros(idmiembro)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(estados_idestado)
    REFERENCES estados(idestado)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX edades_FKIndex1 ON edades (miembros_idmiembro);
CREATE INDEX edades_FKIndex2 ON edades (estados_idestado);


CREATE INDEX IFK_tiene ON edades (miembros_idmiembro);
CREATE INDEX IFK_aplica ON edades (estados_idestado);



