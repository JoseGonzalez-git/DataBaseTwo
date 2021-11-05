CREATE TABLE persona (
  nid VARCHAR(50)   NOT NULL ,
  tipoID VARCHAR(4)   NOT NULL ,
  nom1 VARCHAR(50)   NOT NULL ,
  nom2 VARCHAR(50)   NOT NULL ,
  apll1 VARCHAR(30)   NOT NULL ,
  apll2 VARCHAR(30)   NOT NULL ,
  fnac DATE   NOT NULL   ,
PRIMARY KEY(nid));




CREATE TABLE paises (
  idpais SERIAL  NOT NULL ,
  nombre_pais VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idpais));




CREATE TABLE series (
  idseries SERIAL  NOT NULL ,
  nombre_serie VARCHAR(45)   NOT NULL ,
  fecha_estreno DATE   NOT NULL ,
  emicion BOOL   NOT NULL ,
  duracion_episodio TIME   NOT NULL ,
  descripcion TEXT   NOT NULL ,
  mezcla_sonido VARCHAR(45)   NOT NULL ,
  formato_relacion_aspecto VARCHAR(45)   NOT NULL   ,
PRIMARY KEY(idseries));




CREATE TABLE categorias (
  idcategorias SERIAL  NOT NULL ,
  nombre_categoria VARCHAR(45)   NOT NULL   ,
PRIMARY KEY(idcategorias));




CREATE TABLE usuario (
  idusuario SERIAL  NOT NULL ,
  persona_nid VARCHAR(50)   NOT NULL ,
  nombre_usuario VARCHAR(50)   NOT NULL ,
  correo_electronico VARCHAR(255)   NOT NULL ,
  contrasena VARCHAR(100)   NOT NULL   ,
PRIMARY KEY(idusuario)  ,
  FOREIGN KEY(persona_nid)
    REFERENCES persona(nid)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX usuario_FKIndex1 ON usuario (persona_nid);


CREATE INDEX IFK_crea ON usuario (persona_nid);


CREATE TABLE premios_serie (
  idpremios SERIAL  NOT NULL ,
  series_idseries INTEGER   NOT NULL ,
  nombre_premio VARCHAR(50)   NOT NULL ,
  fecha_entrega DATE    ,
  gano BOOL   NOT NULL   ,
PRIMARY KEY(idpremios)  ,
  FOREIGN KEY(series_idseries)
    REFERENCES series(idseries)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX premios_FKIndex1 ON premios_serie (series_idseries);


CREATE INDEX IFK_es_nominada ON premios_serie (series_idseries);


CREATE TABLE ciudades (
  idciudad SERIAL  NOT NULL ,
  paises_idpais INTEGER   NOT NULL ,
  nombre_ciudad VARCHAR(50)      ,
PRIMARY KEY(idciudad)  ,
  FOREIGN KEY(paises_idpais)
    REFERENCES paises(idpais)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX ciudad_FKIndex1 ON ciudades (paises_idpais);


CREATE INDEX IFK_tiene3 ON ciudades (paises_idpais);


CREATE TABLE actores (
  idactores SERIAL  NOT NULL ,
  persona_nid VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idactores)  ,
  FOREIGN KEY(persona_nid)
    REFERENCES persona(nid)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX actores_FKIndex1 ON actores (persona_nid);


CREATE INDEX IFK_trabaja_como3 ON actores (persona_nid);


CREATE TABLE temporadas (
  id_temporada SERIAL  NOT NULL ,
  series_idseries INTEGER   NOT NULL ,
  n_temporada INTEGER   NOT NULL   ,
PRIMARY KEY(id_temporada)  ,
  FOREIGN KEY(series_idseries)
    REFERENCES series(idseries)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX temporadas_FKIndex1 ON temporadas (series_idseries);


CREATE INDEX IFK_contiene ON temporadas (series_idseries);


CREATE TABLE director (
  iddirector SERIAL  NOT NULL ,
  persona_nid VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(iddirector)  ,
  FOREIGN KEY(persona_nid)
    REFERENCES persona(nid)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX director_FKIndex1 ON director (persona_nid);


CREATE INDEX IFK_trabaja_como1 ON director (persona_nid);


CREATE TABLE valoracion_numerica_serie (
  idvaloracion_num SERIAL  NOT NULL ,
  usuario_idusuario INTEGER   NOT NULL ,
  series_idseries INTEGER   NOT NULL ,
  valoracion INTEGER      ,
PRIMARY KEY(idvaloracion_num)    ,
  FOREIGN KEY(series_idseries)
    REFERENCES series(idseries)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX valoracion_numerica_serie_FKIndex1 ON valoracion_numerica_serie (series_idseries);
CREATE INDEX valoracion_numerica_serie_FKIndex2 ON valoracion_numerica_serie (usuario_idusuario);


CREATE INDEX IFK_recibe1 ON valoracion_numerica_serie (series_idseries);
CREATE INDEX IFK_realiza5 ON valoracion_numerica_serie (usuario_idusuario);


CREATE TABLE valoracion_escrita_serie (
  idvaloracion_escrita SERIAL  NOT NULL ,
  usuario_idusuario INTEGER   NOT NULL ,
  series_idseries INTEGER   NOT NULL ,
  comentario TEXT      ,
PRIMARY KEY(idvaloracion_escrita)    ,
  FOREIGN KEY(series_idseries)
    REFERENCES series(idseries)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario)
      ON UPDATE CASCADE);


CREATE INDEX valoracion_escrita_serie_FKIndex1 ON valoracion_escrita_serie (series_idseries);
CREATE INDEX valoracion_escrita_serie_FKIndex2 ON valoracion_escrita_serie (usuario_idusuario);


CREATE INDEX IFK_recibe ON valoracion_escrita_serie (series_idseries);
CREATE INDEX IFK_realiza ON valoracion_escrita_serie (usuario_idusuario);


CREATE TABLE episodios (
  id_episodio SERIAL  NOT NULL ,
  director_iddirector INTEGER   NOT NULL ,
  n_episodio INTEGER    ,
  temporadas_id_temporada INTEGER   NOT NULL ,
  nombre_episodio VARCHAR(45)   NOT NULL ,
  descripcion TEXT   NOT NULL ,
  fecha_publicacion DATE   NOT NULL   ,
PRIMARY KEY(id_episodio)    ,
  FOREIGN KEY(temporadas_id_temporada)
    REFERENCES temporadas(id_temporada)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(director_iddirector)
    REFERENCES director(iddirector)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX episodios_FKIndex1 ON episodios (temporadas_id_temporada);
CREATE INDEX episodios_FKIndex2 ON episodios (director_iddirector);


CREATE INDEX IFK_agrupa ON episodios (temporadas_id_temporada);
CREATE INDEX IFK_dirige ON episodios (director_iddirector);


CREATE TABLE categorias_has_series (
  categorias_idcategorias INTEGER   NOT NULL ,
  series_idseries INTEGER   NOT NULL   ,
PRIMARY KEY(categorias_idcategorias, series_idseries)    ,
  FOREIGN KEY(categorias_idcategorias)
    REFERENCES categorias(idcategorias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(series_idseries)
    REFERENCES series(idseries)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX categorias_has_series_FKIndex1 ON categorias_has_series (categorias_idcategorias);
CREATE INDEX categorias_has_series_FKIndex2 ON categorias_has_series (series_idseries);


CREATE INDEX IFK_tiene ON categorias_has_series (categorias_idcategorias);
CREATE INDEX IFK_posee ON categorias_has_series (series_idseries);


CREATE TABLE productores (
  idproductores SERIAL  NOT NULL ,
  episodios_id_episodio INTEGER   NOT NULL ,
  persona_nid VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idproductores)    ,
  FOREIGN KEY(persona_nid)
    REFERENCES persona(nid)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(episodios_id_episodio)
    REFERENCES episodios(id_episodio)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX productores_FKIndex1 ON productores (persona_nid);
CREATE INDEX productores_FKIndex2 ON productores (episodios_id_episodio);


CREATE INDEX IFK_trabaja_como2 ON productores (persona_nid);
CREATE INDEX IFK_gestiona ON productores (episodios_id_episodio);


CREATE TABLE personajes (
  idpersonajes SERIAL  NOT NULL ,
  episodios_id_episodio INTEGER   NOT NULL ,
  actores_idactores INTEGER   NOT NULL ,
  nombre VARCHAR(45)      ,
PRIMARY KEY(idpersonajes)    ,
  FOREIGN KEY(actores_idactores)
    REFERENCES actores(idactores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(episodios_id_episodio)
    REFERENCES episodios(id_episodio)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX personajes_FKIndex1 ON personajes (actores_idactores);
CREATE INDEX personajes_FKIndex2 ON personajes (episodios_id_episodio);


CREATE INDEX IFK_interpreta ON personajes (actores_idactores);
CREATE INDEX IFK_es_parte_de ON personajes (episodios_id_episodio);


CREATE TABLE lugar_rodaje (
  idlugar_rodaje SERIAL  NOT NULL ,
  episodios_id_episodio INTEGER   NOT NULL ,
  ciudades_idciudad INTEGER   NOT NULL ,
  nombre_lugar VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idlugar_rodaje)    ,
  FOREIGN KEY(ciudades_idciudad)
    REFERENCES ciudades(idciudad)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(episodios_id_episodio)
    REFERENCES episodios(id_episodio)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX lugar_rodaje_FKIndex1 ON lugar_rodaje (ciudades_idciudad);
CREATE INDEX lugar_rodaje_FKIndex2 ON lugar_rodaje (episodios_id_episodio);


CREATE INDEX IFK_se_ubica_en ON lugar_rodaje (ciudades_idciudad);
CREATE INDEX IFK_tiene2 ON lugar_rodaje (episodios_id_episodio);


CREATE TABLE premios_actores (
  idpremios_actores SERIAL  NOT NULL ,
  actores_idactores INTEGER   NOT NULL ,
  nombre_premio VARCHAR(45)   NOT NULL ,
  fecha_entrega DATE    ,
  gano BOOL   NOT NULL   ,
PRIMARY KEY(idpremios_actores)  ,
  FOREIGN KEY(actores_idactores)
    REFERENCES actores(idactores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX premios_actores_FKIndex1 ON premios_actores (actores_idactores);


CREATE INDEX IFK_es_nominado ON premios_actores (actores_idactores);


CREATE TABLE valoracion_numerica_episodio (
  idvaloracion_numerica_episodio SERIAL  NOT NULL ,
  episodios_id_episodio INTEGER   NOT NULL ,
  usuario_idusuario INTEGER   NOT NULL ,
  valoracion INTEGER   NOT NULL   ,
PRIMARY KEY(idvaloracion_numerica_episodio)    ,
  FOREIGN KEY(episodios_id_episodio)
    REFERENCES episodios(id_episodio)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX valoracion_numerica_episodio_FKIndex1 ON valoracion_numerica_episodio (episodios_id_episodio);
CREATE INDEX valoracion_numerica_episodio_FKIndex2 ON valoracion_numerica_episodio (usuario_idusuario);


CREATE INDEX IFK_tiene1 ON valoracion_numerica_episodio (episodios_id_episodio);
CREATE INDEX IFK_realiza2 ON valoracion_numerica_episodio (usuario_idusuario);


CREATE TABLE valoracion_escrita_episodio (
  idvaloracion_escrita_episodio SERIAL  NOT NULL ,
  episodios_id_episodio INTEGER   NOT NULL ,
  usuario_idusuario INTEGER   NOT NULL ,
  comentario TEXT   NOT NULL   ,
PRIMARY KEY(idvaloracion_escrita_episodio)    ,
  FOREIGN KEY(episodios_id_episodio)
    REFERENCES episodios(id_episodio)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX valoracion_escrita_episodio_FKIndex1 ON valoracion_escrita_episodio (episodios_id_episodio);
CREATE INDEX valoracion_escrita_episodio_FKIndex2 ON valoracion_escrita_episodio (usuario_idusuario);


CREATE INDEX IFK_recibe4 ON valoracion_escrita_episodio (episodios_id_episodio);
CREATE INDEX IFK_realiza1 ON valoracion_escrita_episodio (usuario_idusuario);


CREATE TABLE guionistas (
  idguionistas SERIAL  NOT NULL ,
  episodios_id_episodio INTEGER   NOT NULL ,
  persona_nid VARCHAR(50)   NOT NULL   ,
PRIMARY KEY(idguionistas)    ,
  FOREIGN KEY(persona_nid)
    REFERENCES persona(nid)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(episodios_id_episodio)
    REFERENCES episodios(id_episodio)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX guionistas_FKIndex1 ON guionistas (persona_nid);
CREATE INDEX guionistas_FKIndex2 ON guionistas (episodios_id_episodio);


CREATE INDEX IFK_trabaja_como4 ON guionistas (persona_nid);
CREATE INDEX IFK_participa ON guionistas (episodios_id_episodio);



