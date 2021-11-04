CREATE TABLE persona (
  nid VARCHAR(20)  NOT NULL  ,
  tipoID VARCHAR(4)  NOT NULL  ,
  nom1 VARCHAR(20)  NOT NULL  ,
  nom2 VARCHAR(20)  NOT NULL  ,
  apll1 VARCHAR(30)  NOT NULL  ,
  apll2 VARCHAR(30)  NOT NULL  ,
  fnac DATE  NOT NULL    ,
PRIMARY KEY(nid));



CREATE TABLE paises (
  idpais INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre_pais VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(idpais));



CREATE TABLE series (
  idseries INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre_serie VARCHAR(45)  NOT NULL  ,
  fecha_estreno DATE  NOT NULL  ,
  emicion BOOL  NOT NULL  ,
  duracion_episodio TIME NOT NULL  ,
  descripcion TEXT  NOT NULL  ,
  mezcla_sonido VARCHAR(45)  NOT NULL  ,
  formato_relacion_aspecto VARCHAR(45)  NOT NULL    ,
PRIMARY KEY(idseries));



CREATE TABLE categorias (
  idcategorias INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre_categoria VARCHAR(45)  NOT NULL    ,
PRIMARY KEY(idcategorias));



CREATE TABLE usuario (
  idusuario INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  persona_nid VARCHAR(20)  NOT NULL  ,
  nombre_usuario VARCHAR(20)  NOT NULL  ,
  correo_electronico VARCHAR(255)  NOT NULL  ,
  contrasena VARCHAR(100)  NOT NULL    ,
PRIMARY KEY(idusuario)  ,
INDEX usuario_FKIndex1(persona_nid),
  FOREIGN KEY(persona_nid)
    REFERENCES persona(nid)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE premios_serie (
  idpremios INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  series_idseries INTEGER UNSIGNED  NOT NULL  ,
  nombre_premio VARCHAR(20)  NOT NULL  ,
  fecha_entrega DATE  NULL  ,
  gano BOOL  NOT NULL    ,
PRIMARY KEY(idpremios)  ,
INDEX premios_FKIndex1(series_idseries),
  FOREIGN KEY(series_idseries)
    REFERENCES series(idseries)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE ciudades (
  idciudad INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  paises_idpais INTEGER UNSIGNED  NOT NULL  ,
  nombre_ciudad VARCHAR(20)  NULL    ,
PRIMARY KEY(idciudad)  ,
INDEX ciudad_FKIndex1(paises_idpais),
  FOREIGN KEY(paises_idpais)
    REFERENCES paises(idpais)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE actores (
  idactores INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  persona_nid VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(idactores)  ,
INDEX actores_FKIndex1(persona_nid),
  FOREIGN KEY(persona_nid)
    REFERENCES persona(nid)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE temporadas (
  n_temporada INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  series_idseries INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(n_temporada)  ,
INDEX temporadas_FKIndex1(series_idseries),
  FOREIGN KEY(series_idseries)
    REFERENCES series(idseries)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE director (
  iddirector INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  persona_nid VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(iddirector)  ,
INDEX director_FKIndex1(persona_nid),
  FOREIGN KEY(persona_nid)
    REFERENCES persona(nid)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE valoracion_numerica_serie (
  idvaloracion_num INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  usuario_idusuario INTEGER UNSIGNED  NOT NULL  ,
  series_idseries INTEGER UNSIGNED  NOT NULL  ,
  valoracion INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(idvaloracion_num)  ,
INDEX valoracion_numerica_serie_FKIndex1(series_idseries)  ,
INDEX valoracion_numerica_serie_FKIndex2(usuario_idusuario),
  FOREIGN KEY(series_idseries)
    REFERENCES series(idseries)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE valoracion_escrita_serie (
  idvaloracion_escrita INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  usuario_idusuario INTEGER UNSIGNED  NOT NULL  ,
  series_idseries INTEGER UNSIGNED  NOT NULL  ,
  comentario TEXT  NULL    ,
PRIMARY KEY(idvaloracion_escrita)  ,
INDEX valoracion_escrita_serie_FKIndex1(series_idseries)  ,
INDEX valoracion_escrita_serie_FKIndex2(usuario_idusuario),
  FOREIGN KEY(series_idseries)
    REFERENCES series(idseries)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario)
      ON DELETE NO ACTION
      ON UPDATE CASCADE);



CREATE TABLE episodios (
  n_episodios INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  director_iddirector INTEGER UNSIGNED  NOT NULL  ,
  temporadas_n_temporada INTEGER UNSIGNED  NOT NULL  ,
  nombre_episodio VARCHAR(45)  NOT NULL  ,
  descripcion TEXT  NOT NULL  ,
  valoracion_numerica INTEGER UNSIGNED  NOT NULL  ,
  valoracion_escrita TEXT  NOT NULL  ,
  fecha_publicacion DATE  NOT NULL    ,
PRIMARY KEY(n_episodios)  ,
INDEX episodios_FKIndex1(temporadas_n_temporada)  ,
INDEX episodios_FKIndex2(director_iddirector),
  FOREIGN KEY(temporadas_n_temporada)
    REFERENCES temporadas(n_temporada)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(director_iddirector)
    REFERENCES director(iddirector)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE categorias_has_series (
  categorias_idcategorias INTEGER UNSIGNED  NOT NULL  ,
  series_idseries INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(categorias_idcategorias, series_idseries)  ,
INDEX categorias_has_series_FKIndex1(categorias_idcategorias)  ,
INDEX categorias_has_series_FKIndex2(series_idseries),
  FOREIGN KEY(categorias_idcategorias)
    REFERENCES categorias(idcategorias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(series_idseries)
    REFERENCES series(idseries)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE productores (
  idproductores INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  episodios_n_episodios INTEGER UNSIGNED  NOT NULL  ,
  persona_nid VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(idproductores)  ,
INDEX productores_FKIndex1(persona_nid)  ,
INDEX productores_FKIndex2(episodios_n_episodios),
  FOREIGN KEY(persona_nid)
    REFERENCES persona(nid)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(episodios_n_episodios)
    REFERENCES episodios(n_episodios)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE personajes (
  idpersonajes INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  episodios_n_episodios INTEGER UNSIGNED  NOT NULL  ,
  actores_idactores INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(45)  NULL    ,
PRIMARY KEY(idpersonajes)  ,
INDEX personajes_FKIndex1(actores_idactores)  ,
INDEX personajes_FKIndex2(episodios_n_episodios),
  FOREIGN KEY(actores_idactores)
    REFERENCES actores(idactores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(episodios_n_episodios)
    REFERENCES episodios(n_episodios)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE lugar_rodaje (
  idlugar_rodaje INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  episodios_n_episodios INTEGER UNSIGNED  NOT NULL  ,
  ciudades_idciudad INTEGER UNSIGNED  NOT NULL  ,
  nombre_lugar VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(idlugar_rodaje)  ,
INDEX lugar_rodaje_FKIndex1(ciudades_idciudad)  ,
INDEX lugar_rodaje_FKIndex2(episodios_n_episodios),
  FOREIGN KEY(ciudades_idciudad)
    REFERENCES ciudades(idciudad)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(episodios_n_episodios)
    REFERENCES episodios(n_episodios)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE premios_actores (
  idpremios_actores INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  actores_idactores INTEGER UNSIGNED  NOT NULL  ,
  nombre_premio VARCHAR(45)  NOT NULL  ,
  fecha_entrega DATE  NULL  ,
  gano BOOL  NOT NULL    ,
PRIMARY KEY(idpremios_actores)  ,
INDEX premios_actores_FKIndex1(actores_idactores),
  FOREIGN KEY(actores_idactores)
    REFERENCES actores(idactores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE valoracion_numerica_episodio (
  idvaloracion_numerica_episodio INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  usuario_idusuario INTEGER UNSIGNED  NOT NULL  ,
  episodios_n_episodios INTEGER UNSIGNED  NOT NULL  ,
  valoracion INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idvaloracion_numerica_episodio)  ,
INDEX valoracion_numerica_episodio_FKIndex1(episodios_n_episodios)  ,
INDEX valoracion_numerica_episodio_FKIndex2(usuario_idusuario),
  FOREIGN KEY(episodios_n_episodios)
    REFERENCES episodios(n_episodios)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE valoracion_escrita_episodio (
  idvaloracion_escrita_episodio INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  usuario_idusuario INTEGER UNSIGNED  NOT NULL  ,
  episodios_n_episodios INTEGER UNSIGNED  NOT NULL  ,
  comentario TEXT  NOT NULL    ,
PRIMARY KEY(idvaloracion_escrita_episodio)  ,
INDEX valoracion_escrita_episodio_FKIndex1(episodios_n_episodios)  ,
INDEX valoracion_escrita_episodio_FKIndex2(usuario_idusuario),
  FOREIGN KEY(episodios_n_episodios)
    REFERENCES episodios(n_episodios)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE guionistas (
  idguionistas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  episodios_n_episodios INTEGER UNSIGNED  NOT NULL  ,
  persona_nid VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(idguionistas)  ,
INDEX guionistas_FKIndex1(persona_nid)  ,
INDEX guionistas_FKIndex2(episodios_n_episodios),
  FOREIGN KEY(persona_nid)
    REFERENCES persona(nid)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(episodios_n_episodios)
    REFERENCES episodios(n_episodios)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




