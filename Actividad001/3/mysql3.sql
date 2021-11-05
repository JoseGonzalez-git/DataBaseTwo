CREATE TABLE personas (
  idpersonas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nom1 VARCHAR(20)  NOT NULL  ,
  nom2 VARCHAR(20)  NOT NULL  ,
  apll1 VARCHAR(35)  NOT NULL  ,
  apll2 VARCHAR(35)  NOT NULL  ,
  n_telefono VARCHAR(35)  NOT NULL  ,
  correo_electronico VARCHAR(255)  NOT NULL  ,
  fnac DATE  NOT NULL    ,
PRIMARY KEY(idpersonas));



CREATE TABLE articulos (
  idarticulos INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre_articulo VARCHAR(20)  NOT NULL  ,
  n_paginas INTEGER UNSIGNED  NOT NULL  ,
  tema VARCHAR(20)  NOT NULL  ,
  fecha_publicacion DATE  NOT NULL    ,
PRIMARY KEY(idarticulos));



CREATE TABLE sexo (
  idsexo INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  personas_idpersonas INTEGER UNSIGNED  NOT NULL  ,
  sexo VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(idsexo)  ,
INDEX sexo_FKIndex1(personas_idpersonas),
  FOREIGN KEY(personas_idpersonas)
    REFERENCES personas(idpersonas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE expositores (
  idexpositores INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  personas_idpersonas INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idexpositores)  ,
INDEX expositores_FKIndex1(personas_idpersonas),
  FOREIGN KEY(personas_idpersonas)
    REFERENCES personas(idpersonas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE personas_has_articulos (
  personas_idpersonas INTEGER UNSIGNED  NOT NULL  ,
  articulos_idarticulos INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(personas_idpersonas, articulos_idarticulos)  ,
INDEX personas_has_articulos_FKIndex1(personas_idpersonas)  ,
INDEX personas_has_articulos_FKIndex2(articulos_idarticulos),
  FOREIGN KEY(personas_idpersonas)
    REFERENCES personas(idpersonas)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(articulos_idarticulos)
    REFERENCES articulos(idarticulos)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE charlas (
  idcharlas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  expositores_idexpositores INTEGER UNSIGNED  NOT NULL  ,
  tema_charla VARCHAR(50)  NOT NULL  ,
  duracion TIME  NOT NULL    ,
PRIMARY KEY(idcharlas)  ,
INDEX charlas_FKIndex1(expositores_idexpositores),
  FOREIGN KEY(expositores_idexpositores)
    REFERENCES expositores(idexpositores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE workshops (
  idworkshops INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  charlas_idcharlas INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(35)  NOT NULL  ,
  descripcion TEXT  NOT NULL  ,
  fecha DATE  NOT NULL  ,
  hora TIME  NOT NULL    ,
PRIMARY KEY(idworkshops)  ,
INDEX workshops_FKIndex2(charlas_idcharlas),
  FOREIGN KEY(charlas_idcharlas)
    REFERENCES charlas(idcharlas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE articulos_has_workshops (
  articulos_idarticulos INTEGER UNSIGNED  NOT NULL  ,
  workshops_idworkshops INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(articulos_idarticulos, workshops_idworkshops)  ,
INDEX articulos_has_workshops_FKIndex1(articulos_idarticulos)  ,
INDEX articulos_has_workshops_FKIndex2(workshops_idworkshops),
  FOREIGN KEY(articulos_idarticulos)
    REFERENCES articulos(idarticulos)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(workshops_idworkshops)
    REFERENCES workshops(idworkshops)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




