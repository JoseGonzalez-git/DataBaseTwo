CREATE TABLE personas (
  idpersonas SERIAL  NOT NULL ,
  nom1 VARCHAR(20)   NOT NULL ,
  nom2 VARCHAR(20)   NOT NULL ,
  apll1 VARCHAR(35)   NOT NULL ,
  apll2 VARCHAR(35)   NOT NULL ,
  n_telefono VARCHAR(35)   NOT NULL ,
  correo_electronico VARCHAR(255)   NOT NULL ,
  fnac DATE   NOT NULL   ,
PRIMARY KEY(idpersonas));




CREATE TABLE articulos (
  idarticulos SERIAL  NOT NULL ,
  nombre_articulo VARCHAR(20)   NOT NULL ,
  n_paginas INTEGER   NOT NULL ,
  tema VARCHAR(20)   NOT NULL ,
  fecha_publicacion DATE   NOT NULL   ,
PRIMARY KEY(idarticulos));




CREATE TABLE sexo (
  idsexo SERIAL  NOT NULL ,
  personas_idpersonas INTEGER   NOT NULL ,
  sexo VARCHAR(20)   NOT NULL   ,
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


CREATE TABLE personas_has_articulos (
  personas_idpersonas INTEGER   NOT NULL ,
  articulos_idarticulos INTEGER   NOT NULL   ,
PRIMARY KEY(personas_idpersonas, articulos_idarticulos)    ,
  FOREIGN KEY(personas_idpersonas)
    REFERENCES personas(idpersonas),
  FOREIGN KEY(articulos_idarticulos)
    REFERENCES articulos(idarticulos));


CREATE INDEX personas_has_articulos_FKIndex1 ON personas_has_articulos (personas_idpersonas);
CREATE INDEX personas_has_articulos_FKIndex2 ON personas_has_articulos (articulos_idarticulos);


CREATE INDEX IFK_Rel_07 ON personas_has_articulos (personas_idpersonas);
CREATE INDEX IFK_Rel_08 ON personas_has_articulos (articulos_idarticulos);


CREATE TABLE charlas (
  idcharlas SERIAL  NOT NULL ,
  expositores_idexpositores INTEGER   NOT NULL ,
  tema_charla VARCHAR(50)   NOT NULL ,
  duracion TIME   NOT NULL   ,
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
  nombre VARCHAR(35)   NOT NULL ,
  descripcion TEXT   NOT NULL ,
  fecha DATE   NOT NULL ,
  hora TIME   NOT NULL   ,
PRIMARY KEY(idworkshops)  ,
  FOREIGN KEY(charlas_idcharlas)
    REFERENCES charlas(idcharlas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX workshops_FKIndex2 ON workshops (charlas_idcharlas);


CREATE INDEX IFK_contiene ON workshops (charlas_idcharlas);


CREATE TABLE articulos_has_workshops (
  articulos_idarticulos INTEGER   NOT NULL ,
  workshops_idworkshops INTEGER   NOT NULL   ,
PRIMARY KEY(articulos_idarticulos, workshops_idworkshops)    ,
  FOREIGN KEY(articulos_idarticulos)
    REFERENCES articulos(idarticulos),
  FOREIGN KEY(workshops_idworkshops)
    REFERENCES workshops(idworkshops));


CREATE INDEX articulos_has_workshops_FKIndex1 ON articulos_has_workshops (articulos_idarticulos);
CREATE INDEX articulos_has_workshops_FKIndex2 ON articulos_has_workshops (workshops_idworkshops);


CREATE INDEX IFK_Rel_09 ON articulos_has_workshops (articulos_idarticulos);
CREATE INDEX IFK_Rel_10 ON articulos_has_workshops (workshops_idworkshops);



