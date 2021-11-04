CREATE TABLE articulos (
  idarticulos INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre_articulo VARCHAR(20)  NOT NULL  ,
  n_paginas INTEGER UNSIGNED  NOT NULL  ,
  tema VARCHAR(20)  NULL  ,
  fecha_publicacion DATE  NULL    ,
PRIMARY KEY(idarticulos));



CREATE TABLE personas (
  idpersonas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  articulos_idarticulos INTEGER UNSIGNED  NOT NULL  ,
  nom1 VARCHAR(20)  NULL  ,
  nom2 VARCHAR(20)  NULL  ,
  apll1 VARCHAR(35)  NULL  ,
  apll2 VARCHAR(35)  NULL  ,
  n_telefono VARCHAR(35)  NULL  ,
  correo_electronico VARCHAR(255)  NULL  ,
  fnac DATE  NULL    ,
PRIMARY KEY(idpersonas)  ,
INDEX personas_FKIndex1(articulos_idarticulos),
  FOREIGN KEY(articulos_idarticulos)
    REFERENCES articulos(idarticulos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE sexo (
  idsexo INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  personas_idpersonas INTEGER UNSIGNED  NOT NULL  ,
  sexo VARCHAR(20)  NULL    ,
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



CREATE TABLE charlas (
  idcharlas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  expositores_idexpositores INTEGER UNSIGNED  NOT NULL  ,
  tema_charla VARCHAR  NOT NULL  ,
  duracion TIME  NULL    ,
PRIMARY KEY(idcharlas)  ,
INDEX charlas_FKIndex1(expositores_idexpositores),
  FOREIGN KEY(expositores_idexpositores)
    REFERENCES expositores(idexpositores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE workshops (
  idworkshops INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  charlas_idcharlas INTEGER UNSIGNED  NOT NULL  ,
  articulos_idarticulos INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(35)  NOT NULL  ,
  descripcion TEXT  NOT NULL  ,
  fecha DATE  NOT NULL  ,
  hora TIME  NOT NULL    ,
PRIMARY KEY(idworkshops)  ,
INDEX workshops_FKIndex1(articulos_idarticulos)  ,
INDEX workshops_FKIndex2(charlas_idcharlas),
  FOREIGN KEY(articulos_idarticulos)
    REFERENCES articulos(idarticulos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(charlas_idcharlas)
    REFERENCES charlas(idcharlas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




