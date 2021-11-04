CREATE TABLE articulos (
  idarticulos SERIAL  NOT NULL ,
  nombre_articulo VARCHAR(20)   NOT NULL ,
  n_paginas INTEGER   NOT NULL ,
  tema VARCHAR(20)    ,
  fecha_publicacion DATE      ,
PRIMARY KEY(idarticulos));




CREATE TABLE personas (
  idpersonas SERIAL  NOT NULL ,
  articulos_idarticulos INTEGER   NOT NULL ,
  nom1 VARCHAR(20)    ,
  nom2 VARCHAR(20)    ,
  apll1 VARCHAR(35)    ,
  apll2 VARCHAR(35)    ,
  n_telefono VARCHAR(35)    ,
  correo_electronico VARCHAR(255)    ,
  fnac DATE      ,
PRIMARY KEY(idpersonas)  ,
  FOREIGN KEY(articulos_idarticulos)
    REFERENCES articulos(idarticulos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX personas_FKIndex1 ON personas (articulos_idarticulos);


CREATE INDEX IFK_participa ON personas (articulos_idarticulos);


CREATE TABLE sexo (
  idsexo SERIAL  NOT NULL ,
  personas_idpersonas INTEGER   NOT NULL ,
  sexo VARCHAR(20)      ,
PRIMARY KEY(idsexo)  ,
  FOREIGN KEY(personas_idpersonas)
    REFERENCES personas(idpersonas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX sexo_FKIndex1 ON sexo (personas_idpersonas);


CREATE INDEX IFK_tiene ON sexo (personas_idpersonas);


CREATE TABLE expositores (
  idexpositores SERIAL  NOT NULL ,
  personas_idpersonas INTEGER   NOT NULL   ,
PRIMARY KEY(idexpositores)  ,
  FOREIGN KEY(personas_idpersonas)
    REFERENCES personas(idpersonas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX expositores_FKIndex1 ON expositores (personas_idpersonas);


CREATE INDEX IFK_aplican_como ON expositores (personas_idpersonas);


CREATE TABLE charlas (
  idcharlas SERIAL  NOT NULL ,
  expositores_idexpositores INTEGER   NOT NULL ,
  tema_charla VARCHAR   NOT NULL ,
  duracion TIME      ,
PRIMARY KEY(idcharlas)  ,
  FOREIGN KEY(expositores_idexpositores)
    REFERENCES expositores(idexpositores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX charlas_FKIndex1 ON charlas (expositores_idexpositores);


CREATE INDEX IFK_presenta ON charlas (expositores_idexpositores);


CREATE TABLE workshops (
  idworkshops SERIAL  NOT NULL ,
  charlas_idcharlas INTEGER   NOT NULL ,
  articulos_idarticulos INTEGER   NOT NULL ,
  nombre VARCHAR(35)   NOT NULL ,
  descripcion TEXT   NOT NULL ,
  fecha DATE   NOT NULL ,
  hora TIME   NOT NULL   ,
PRIMARY KEY(idworkshops)    ,
  FOREIGN KEY(articulos_idarticulos)
    REFERENCES articulos(idarticulos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(charlas_idcharlas)
    REFERENCES charlas(idcharlas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX workshops_FKIndex1 ON workshops (articulos_idarticulos);
CREATE INDEX workshops_FKIndex2 ON workshops (charlas_idcharlas);


CREATE INDEX IFK_utiliza ON workshops (articulos_idarticulos);
CREATE INDEX IFK_contiene ON workshops (charlas_idcharlas);



