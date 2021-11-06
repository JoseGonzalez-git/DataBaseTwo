CREATE TABLE personas (
  identificacion INTEGER   NOT NULL ,
  nom1 VARCHAR(20)   NOT NULL ,
  nom2 VARCHAR(20)   NOT NULL ,
  apll1 VARCHAR(35)   NOT NULL ,
  apll2 VARCHAR(35)   NOT NULL ,
  genero VARCHAR(10)   NOT NULL ,
  fnac DATE   NOT NULL ,
  telefono VARCHAR(45)   NOT NULL ,
  email VARCHAR(255)   NOT NULL   ,
PRIMARY KEY(identificacion));




CREATE TABLE lugar (
  idlugar SERIAL  NOT NULL ,
  nombre VARCHAR(45)   NOT NULL ,
  capacidad INTEGER   NOT NULL   ,
PRIMARY KEY(idlugar));




CREATE TABLE reuniones (
  idreuniones SERIAL  NOT NULL ,
  lugar_idlugar INTEGER   NOT NULL ,
  tema VARCHAR(45)   NOT NULL ,
  fecha_inicio DATE   NOT NULL   ,
PRIMARY KEY(idreuniones)  ,
  FOREIGN KEY(lugar_idlugar)
    REFERENCES lugar(idlugar)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX reuniones_FKIndex1 ON reuniones (lugar_idlugar);


CREATE INDEX IFK_se_realizan ON reuniones (lugar_idlugar);


CREATE TABLE recursos (
  idrecursos SERIAL  NOT NULL ,
  lugar_idlugar INTEGER   NOT NULL ,
  descripcion TEXT   NOT NULL   ,
PRIMARY KEY(idrecursos)  ,
  FOREIGN KEY(lugar_idlugar)
    REFERENCES lugar(idlugar)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX recursos_FKIndex1 ON recursos (lugar_idlugar);


CREATE INDEX IFK_tiene ON recursos (lugar_idlugar);


CREATE TABLE agenda (
  personas_identificacion INTEGER   NOT NULL ,
  reuniones_idreuniones INTEGER   NOT NULL   ,
PRIMARY KEY(personas_identificacion, reuniones_idreuniones)    ,
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(reuniones_idreuniones)
    REFERENCES reuniones(idreuniones)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX personas_has_reuniones_FKIndex1 ON agenda (personas_identificacion);
CREATE INDEX personas_has_reuniones_FKIndex2 ON agenda (reuniones_idreuniones);


CREATE INDEX IFK_reciben ON agenda (personas_identificacion);
CREATE INDEX IFK_crean ON agenda (reuniones_idreuniones);



