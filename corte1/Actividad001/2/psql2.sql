CREATE TABLE familias (
  idfamilia SERIAL  NOT NULL ,
  nombre_familia VARCHAR(20)   NOT NULL ,
  tiempo_familia DATE   NOT NULL   ,
PRIMARY KEY(idfamilia));




CREATE TABLE bienes_actividad (
  idbienes_actividad SERIAL  NOT NULL ,
  descripcion TEXT   NOT NULL   ,
PRIMARY KEY(idbienes_actividad));




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


CREATE TABLE edades (
  idedades SERIAL  NOT NULL ,
  miembros_idmiembro INTEGER   NOT NULL ,
  categoria_edad VARCHAR(20)   NOT NULL   ,
PRIMARY KEY(idedades)  ,
  FOREIGN KEY(miembros_idmiembro)
    REFERENCES miembros(idmiembro)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX edades_FKIndex1 ON edades (miembros_idmiembro);


CREATE INDEX IFK_tiene ON edades (miembros_idmiembro);


CREATE TABLE actividades (
  idactividad SERIAL  NOT NULL ,
  bienes_actividad_idbienes_actividad INTEGER   NOT NULL ,
  nombre_actividad VARCHAR(45)   NOT NULL   ,
PRIMARY KEY(idactividad)  ,
  FOREIGN KEY(bienes_actividad_idbienes_actividad)
    REFERENCES bienes_actividad(idbienes_actividad));


CREATE INDEX actividades_FKIndex1 ON actividades (bienes_actividad_idbienes_actividad);


CREATE INDEX IFK_Rel_09 ON actividades (bienes_actividad_idbienes_actividad);


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


CREATE TABLE estados (
  idestado SERIAL  NOT NULL ,
  edades_idedades INTEGER   NOT NULL ,
  actividades_idactividad INTEGER   NOT NULL ,
  nombre_estado VARCHAR(20)   NOT NULL   ,
PRIMARY KEY(idestado)    ,
  FOREIGN KEY(actividades_idactividad)
    REFERENCES actividades(idactividad),
  FOREIGN KEY(edades_idedades)
    REFERENCES edades(idedades));


CREATE INDEX estados_FKIndex1 ON estados (actividades_idactividad);
CREATE INDEX estados_FKIndex2 ON estados (edades_idedades);


CREATE INDEX IFK_Rel_07 ON estados (actividades_idactividad);
CREATE INDEX IFK_Rel_08 ON estados (edades_idedades);



