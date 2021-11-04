CREATE TABLE personas (
  identificacion SERIAL  NOT NULL ,
  nom1 VARCHAR(20)   NOT NULL ,
  nom2 VARCHAR(20)   NOT NULL ,
  apll1 VARCHAR(35)   NOT NULL ,
  apll2 VARCHAR(35)   NOT NULL ,
  fnac DATE   NOT NULL ,
  genero VARCHAR(10)   NOT NULL ,
  contacto VARCHAR(45)   NOT NULL   ,
PRIMARY KEY(identificacion));




CREATE TABLE categorias (
  idcategorias SERIAL  NOT NULL ,
  nombre VARCHAR(45)   NOT NULL   ,
PRIMARY KEY(idcategorias));




CREATE TABLE paises (
  idpaises SERIAL  NOT NULL ,
  nombre INTEGER   NOT NULL   ,
PRIMARY KEY(idpaises));




CREATE TABLE locales (
  idlocales SERIAL  NOT NULL ,
  nombre VARCHAR(45)   NOT NULL ,
  contacto VARCHAR(45)   NOT NULL ,
  correo VARCHAR(255)   NOT NULL ,
  direccion VARCHAR(45)   NOT NULL ,
  zipcode VARCHAR(20))   NOT NULL   ,
PRIMARY KEY(idlocales));




CREATE TABLE clientes (
  idclientes SERIAL  NOT NULL ,
  personas_identificacion INTEGER   NOT NULL   ,
PRIMARY KEY(idclientes)  ,
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX clientes_FKIndex1 ON clientes (personas_identificacion);


CREATE INDEX IFK_son ON clientes (personas_identificacion);


CREATE TABLE actores (
  idactores SERIAL  NOT NULL ,
  personas_identificacion INTEGER   NOT NULL   ,
PRIMARY KEY(idactores)  ,
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX actores_FKIndex1 ON actores (personas_identificacion);


CREATE INDEX IFK_pueden_ser ON actores (personas_identificacion);


CREATE TABLE ciudades (
  idciudades SERIAL  NOT NULL ,
  paises_idpaises INTEGER   NOT NULL ,
  nombre VARCHAR(45)   NOT NULL   ,
PRIMARY KEY(idciudades)  ,
  FOREIGN KEY(paises_idpaises)
    REFERENCES paises(idpaises)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX ciudades_FKIndex1 ON ciudades (paises_idpaises);


CREATE INDEX IFK_por ON ciudades (paises_idpaises);


CREATE TABLE sucursales (
  locales_idlocales INTEGER   NOT NULL ,
  ciudades_idciudades INTEGER   NOT NULL   ,
PRIMARY KEY(locales_idlocales, ciudades_idciudades)    ,
  FOREIGN KEY(locales_idlocales)
    REFERENCES locales(idlocales)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(ciudades_idciudades)
    REFERENCES ciudades(idciudades)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX locales_has_ciudades_FKIndex1 ON sucursales (locales_idlocales);
CREATE INDEX locales_has_ciudades_FKIndex2 ON sucursales (ciudades_idciudades);


CREATE INDEX IFK_tiene1 ON sucursales (locales_idlocales);
CREATE INDEX IFK_en ON sucursales (ciudades_idciudades);


CREATE TABLE empleados (
  idempleados SERIAL  NOT NULL ,
  locales_idlocales INTEGER   NOT NULL ,
  personas_identificacion INTEGER   NOT NULL   ,
PRIMARY KEY(idempleados)    ,
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(locales_idlocales)
    REFERENCES locales(idlocales)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX empleados_FKIndex1 ON empleados (personas_identificacion);
CREATE INDEX empleados_FKIndex2 ON empleados (locales_idlocales);


CREATE INDEX IFK_aplican_como ON empleados (personas_identificacion);
CREATE INDEX IFK_trabajan ON empleados (locales_idlocales);


CREATE TABLE peliculas (
  idpeliculas SERIAL  NOT NULL ,
  actores_idactores INTEGER   NOT NULL ,
  nombre VARCHAR(45)   NOT NULL ,
  descripcion TEXT   NOT NULL ,
  duracion TIME   NOT NULL ,
  fecha_lanzamiento DATE   NOT NULL ,
  precio DOUBLE   NOT NULL   ,
PRIMARY KEY(idpeliculas)  ,
  FOREIGN KEY(actores_idactores)
    REFERENCES actores(idactores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX peliculas_FKIndex1 ON peliculas (actores_idactores);


CREATE INDEX IFK_papel_principal ON peliculas (actores_idactores);


CREATE TABLE peliculas_tiene_categorias (
  peliculas_idpeliculas INTEGER   NOT NULL ,
  categorias_idcategorias INTEGER   NOT NULL   ,
PRIMARY KEY(peliculas_idpeliculas, categorias_idcategorias)    ,
  FOREIGN KEY(peliculas_idpeliculas)
    REFERENCES peliculas(idpeliculas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(categorias_idcategorias)
    REFERENCES categorias(idcategorias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX peliculas_has_categorias_FKIndex1 ON peliculas_tiene_categorias (peliculas_idpeliculas);
CREATE INDEX peliculas_has_categorias_FKIndex2 ON peliculas_tiene_categorias (categorias_idcategorias);


CREATE INDEX IFK_se_clasifica ON peliculas_tiene_categorias (peliculas_idpeliculas);
CREATE INDEX IFK_tiene ON peliculas_tiene_categorias (categorias_idcategorias);


CREATE TABLE pedidos (
  idpedidos SERIAL  NOT NULL ,
  clientes_idclientes INTEGER   NOT NULL ,
  empleados_idempleados INTEGER   NOT NULL ,
  fecha_entrega DATE      ,
PRIMARY KEY(idpedidos)    ,
  FOREIGN KEY(empleados_idempleados)
    REFERENCES empleados(idempleados)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(clientes_idclientes)
    REFERENCES clientes(idclientes)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX pedidos_FKIndex1 ON pedidos (empleados_idempleados);
CREATE INDEX pedidos_FKIndex2 ON pedidos (clientes_idclientes);


CREATE INDEX IFK_atienden ON pedidos (empleados_idempleados);
CREATE INDEX IFK_realiza ON pedidos (clientes_idclientes);


CREATE TABLE catalogo_de_peliculas (
  locales_idlocales INTEGER   NOT NULL ,
  peliculas_idpeliculas INTEGER   NOT NULL ,
  cantidad INTEGER   NOT NULL   ,
PRIMARY KEY(locales_idlocales, peliculas_idpeliculas)    ,
  FOREIGN KEY(locales_idlocales)
    REFERENCES locales(idlocales)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(peliculas_idpeliculas)
    REFERENCES peliculas(idpeliculas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX locales_has_peliculas_FKIndex1 ON catalogo_de_peliculas (locales_idlocales);
CREATE INDEX locales_has_peliculas_FKIndex2 ON catalogo_de_peliculas (peliculas_idpeliculas);


CREATE INDEX IFK_gestiona ON catalogo_de_peliculas (locales_idlocales);
CREATE INDEX IFK_se_guardan ON catalogo_de_peliculas (peliculas_idpeliculas);


CREATE TABLE catalogo_de_actores (
  peliculas_idpeliculas INTEGER   NOT NULL ,
  actores_idactores INTEGER   NOT NULL   ,
PRIMARY KEY(peliculas_idpeliculas, actores_idactores)    ,
  FOREIGN KEY(peliculas_idpeliculas)
    REFERENCES peliculas(idpeliculas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(actores_idactores)
    REFERENCES actores(idactores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX peliculas_has_actores_FKIndex1 ON catalogo_de_actores (peliculas_idpeliculas);
CREATE INDEX peliculas_has_actores_FKIndex2 ON catalogo_de_actores (actores_idactores);


CREATE INDEX IFK_tiene2 ON catalogo_de_actores (peliculas_idpeliculas);
CREATE INDEX IFK_participan ON catalogo_de_actores (actores_idactores);


CREATE TABLE ejemplar_pelicula (
  idejemplar_pelicula SERIAL  NOT NULL ,
  pedidos_idpedidos INTEGER   NOT NULL ,
  peliculas_idpeliculas INTEGER   NOT NULL   ,
PRIMARY KEY(idejemplar_pelicula)    ,
  FOREIGN KEY(peliculas_idpeliculas)
    REFERENCES peliculas(idpeliculas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(pedidos_idpedidos)
    REFERENCES pedidos(idpedidos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX ejemplar_pelicula_FKIndex1 ON ejemplar_pelicula (peliculas_idpeliculas);
CREATE INDEX ejemplar_pelicula_FKIndex2 ON ejemplar_pelicula (pedidos_idpedidos);


CREATE INDEX IFK_asocia ON ejemplar_pelicula (peliculas_idpeliculas);
CREATE INDEX IFK_registra ON ejemplar_pelicula (pedidos_idpedidos);



