CREATE TABLE personas (
  identificacion INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nom1 VARCHAR(20)  NOT NULL  ,
  nom2 VARCHAR(20)  NOT NULL  ,
  apll1 VARCHAR(35)  NOT NULL  ,
  apll2 VARCHAR(35)  NOT NULL  ,
  fnac DATE  NOT NULL  ,
  genero VARCHAR(10)  NOT NULL  ,
  contacto VARCHAR(45)  NOT NULL    ,
PRIMARY KEY(identificacion));



CREATE TABLE categorias (
  idcategorias INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre VARCHAR(45)  NOT NULL    ,
PRIMARY KEY(idcategorias));



CREATE TABLE paises (
  idpaises INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre VARCHAR(50)  NOT NULL    ,
PRIMARY KEY(idpaises));



CREATE TABLE locales (
  idlocales INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre VARCHAR(45)  NOT NULL  ,
  contacto VARCHAR(45)  NOT NULL  ,
  correo VARCHAR(255)  NOT NULL  ,
  direccion VARCHAR(45)  NOT NULL  ,
  zipcode VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(idlocales));



CREATE TABLE clientes (
  idclientes INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  personas_identificacion INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idclientes)  ,
INDEX clientes_FKIndex1(personas_identificacion),
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE actores (
  idactores INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  personas_identificacion INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idactores)  ,
INDEX actores_FKIndex1(personas_identificacion),
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE ciudades (
  idciudades INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  paises_idpaises INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(45)  NOT NULL    ,
PRIMARY KEY(idciudades)  ,
INDEX ciudades_FKIndex1(paises_idpaises),
  FOREIGN KEY(paises_idpaises)
    REFERENCES paises(idpaises)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE sucursales (
  locales_idlocales INTEGER UNSIGNED  NOT NULL  ,
  ciudades_idciudades INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(locales_idlocales, ciudades_idciudades)  ,
INDEX locales_has_ciudades_FKIndex1(locales_idlocales)  ,
INDEX locales_has_ciudades_FKIndex2(ciudades_idciudades),
  FOREIGN KEY(locales_idlocales)
    REFERENCES locales(idlocales)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(ciudades_idciudades)
    REFERENCES ciudades(idciudades)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE empleados (
  idempleados INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  locales_idlocales INTEGER UNSIGNED  NOT NULL  ,
  personas_identificacion INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idempleados)  ,
INDEX empleados_FKIndex1(personas_identificacion)  ,
INDEX empleados_FKIndex2(locales_idlocales),
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(locales_idlocales)
    REFERENCES locales(idlocales)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE peliculas (
  idpeliculas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  actores_idactores INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(45)  NOT NULL  ,
  descripcion TEXT  NOT NULL  ,
  duracion TIME  NOT NULL  ,
  fecha_lanzamiento DATE  NOT NULL  ,
  precio DECIMAL  NOT NULL    ,
PRIMARY KEY(idpeliculas)  ,
INDEX peliculas_FKIndex1(actores_idactores),
  FOREIGN KEY(actores_idactores)
    REFERENCES actores(idactores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE peliculas_tiene_categorias (
  peliculas_idpeliculas INTEGER UNSIGNED  NOT NULL  ,
  categorias_idcategorias INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(peliculas_idpeliculas, categorias_idcategorias)  ,
INDEX peliculas_has_categorias_FKIndex1(peliculas_idpeliculas)  ,
INDEX peliculas_has_categorias_FKIndex2(categorias_idcategorias),
  FOREIGN KEY(peliculas_idpeliculas)
    REFERENCES peliculas(idpeliculas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(categorias_idcategorias)
    REFERENCES categorias(idcategorias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE pedidos (
  idpedidos INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  clientes_idclientes INTEGER UNSIGNED  NOT NULL  ,
  empleados_idempleados INTEGER UNSIGNED  NOT NULL  ,
  fecha_entrega DATE  NULL    ,
PRIMARY KEY(idpedidos)  ,
INDEX pedidos_FKIndex1(empleados_idempleados)  ,
INDEX pedidos_FKIndex2(clientes_idclientes),
  FOREIGN KEY(empleados_idempleados)
    REFERENCES empleados(idempleados)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(clientes_idclientes)
    REFERENCES clientes(idclientes)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE catalogo_de_peliculas (
  locales_idlocales INTEGER UNSIGNED  NOT NULL  ,
  peliculas_idpeliculas INTEGER UNSIGNED  NOT NULL  ,
  cantidad INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(locales_idlocales, peliculas_idpeliculas)  ,
INDEX locales_has_peliculas_FKIndex1(locales_idlocales)  ,
INDEX locales_has_peliculas_FKIndex2(peliculas_idpeliculas),
  FOREIGN KEY(locales_idlocales)
    REFERENCES locales(idlocales)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(peliculas_idpeliculas)
    REFERENCES peliculas(idpeliculas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE catalogo_de_actores (
  peliculas_idpeliculas INTEGER UNSIGNED  NOT NULL  ,
  actores_idactores INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(peliculas_idpeliculas, actores_idactores)  ,
INDEX peliculas_has_actores_FKIndex1(peliculas_idpeliculas)  ,
INDEX peliculas_has_actores_FKIndex2(actores_idactores),
  FOREIGN KEY(peliculas_idpeliculas)
    REFERENCES peliculas(idpeliculas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(actores_idactores)
    REFERENCES actores(idactores)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE ejemplar_pelicula (
  idejemplar_pelicula INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  pedidos_idpedidos INTEGER UNSIGNED  NOT NULL  ,
  peliculas_idpeliculas INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idejemplar_pelicula)  ,
INDEX ejemplar_pelicula_FKIndex1(peliculas_idpeliculas)  ,
INDEX ejemplar_pelicula_FKIndex2(pedidos_idpedidos),
  FOREIGN KEY(peliculas_idpeliculas)
    REFERENCES peliculas(idpeliculas)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(pedidos_idpedidos)
    REFERENCES pedidos(idpedidos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




