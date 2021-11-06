insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (1, 'Maddie', 'Arni', 'Bellenie', 'Benesevich', '2019-09-09', 'M', '11584-0029');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (2, 'Cariotta', 'Meaghan', 'Posnett', 'Dameisele', '2020-08-05', 'F', '42799-217');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (3, 'Laura', 'Mollee', 'Greenin', 'Tanton', '2013-07-02', 'F', '55154-4727');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (4, 'Roddy', 'Delbert', 'Miner', 'Bedin', '2004-02-20', 'M', '59746-308');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (5, 'Agace', 'Fredelia', 'MacKenny', 'Simeoli', '2021-04-25', 'F', '55289-324');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (6, 'Patric', 'Orland', 'Learmond', 'Mc Gee', '2003-07-24', 'M', '62257-585');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (7, 'Wren', 'Katuscha', 'Presshaugh', 'McFarlane', '2016-03-24', 'F', '68084-282');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (8, 'Jeralee', 'Delila', 'Burker', 'Milesop', '2002-06-15', 'F', '36987-2923');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (9, 'Elwyn', 'Renado', 'Mallison', 'Carnier', '2006-10-25', 'M', '0003-2327');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (10, 'Cristiano', 'Jerrome', 'Dayes', 'Friman', '2011-06-08', 'M', '67475-114');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (11, 'Howard', 'Skipp', 'Claye', 'Veazey', '2010-04-01', 'M', '58407-625');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (12, 'Vyky', 'Dasi', 'Rackstraw', 'Gounod', '2007-11-05', 'F', '0143-9660');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (13, 'Herta', 'Haley', 'Valeri', 'Bayley', '1998-12-30', 'F', '49981-001');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (14, 'Riley', 'Derrek', 'Pirrie', 'Farnes', '2021-08-28', 'M', '68786-228');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (15, 'Eal', 'Dore', 'Davydkov', 'Yanuk', '2019-11-16', 'M', '68786-211');
insert into personas (identificacion, nom1, nom2, apll1, apll2, fnac, genero, contacto) values (16, 'Nolan', 'Carmine', 'Corriea', 'Cottel', '2017-07-01', 'M', '50268-618');

insert into clientes (idclientes, personas_identificacion) values (1, 1);
insert into clientes (idclientes, personas_identificacion) values (2, 2);
insert into clientes (idclientes, personas_identificacion) values (3, 3);
insert into clientes (idclientes, personas_identificacion) values (4, 4);

insert into actores (idactores, personas_identificacion) values (1, 5);
insert into actores (idactores, personas_identificacion) values (2, 6);
insert into actores (idactores, personas_identificacion) values (3, 7);
insert into actores (idactores, personas_identificacion) values (4, 8);
insert into actores (idactores, personas_identificacion) values (5, 13);
insert into actores (idactores, personas_identificacion) values (6, 14);
insert into actores (idactores, personas_identificacion) values (7, 15);
insert into actores (idactores, personas_identificacion) values (8, 16);

insert into paises (idpaises, nombre) values (1, 'Colombia');
insert into paises (idpaises, nombre) values (2, 'Venezuela');
insert into paises (idpaises, nombre) values (3, 'Peru');
insert into paises (idpaises, nombre) values (4, 'Argentina');

insert into ciudades (idciudades,paises_idpaises, nombre) values (1, 1,'Bogota');
insert into ciudades (idciudades,paises_idpaises, nombre) values (2, 2,'Caracas');
insert into ciudades (idciudades,paises_idpaises, nombre) values (3, 3,'Lima');
insert into ciudades (idciudades,paises_idpaises, nombre) values (4, 4,'Buenos Aires');

insert into locales (idlocales, nombre, contacto, correo, direccion, zipcode) values (1, 'Cinepolis', '324569865', 'cinepolis@correo.com', 'Calle 1', '12345');
insert into locales (idlocales, nombre, contacto, correo, direccion, zipcode) values (2, 'Poliscine', '454569865', 'polis@correo.com' , 'Calle 2', '54321');
insert into locales (idlocales, nombre, contacto, correo, direccion, zipcode) values (3, 'CineX', '754569865', 'cinex@correo.com' , 'Calle 3', '98345');
insert into locales (idlocales, nombre, contacto, correo, direccion, zipcode) values (4, 'CinepoliX', '964569865', 'cinepoliX@correo.com' , 'Calle 4', '72345');

insert into sucursales (locales_idlocales, ciudades_idciudades) values (1, 1);
insert into sucursales (locales_idlocales, ciudades_idciudades) values (2, 2);
insert into sucursales (locales_idlocales, ciudades_idciudades) values (3, 3);
insert into sucursales (locales_idlocales, ciudades_idciudades) values (4, 4);

insert into empleados (idempleados, locales_idlocales, personas_identificacion) values (1, 1, 9);
insert into empleados (idempleados, locales_idlocales, personas_identificacion) values (2, 2, 10);
insert into empleados (idempleados, locales_idlocales, personas_identificacion) values (3, 3, 11);
insert into empleados (idempleados, locales_idlocales, personas_identificacion) values (4, 4, 12);

insert into peliculas (idpeliculas, actores_idactores, nombre, descripcion, duracion, fecha_lanzamiento, precio) values (1, 5, 'PELICULA 1', 'Descripcion 1', '01:45:00', '2001-05-13', 25000);
insert into peliculas (idpeliculas, actores_idactores, nombre, descripcion, duracion, fecha_lanzamiento, precio) values (2, 6, 'PELICULA 2', 'Descripcion 2', '02:45:00', '2002-05-13', 15000);
insert into peliculas (idpeliculas, actores_idactores, nombre, descripcion, duracion, fecha_lanzamiento, precio) values (3, 7, 'PELICULA 3', 'Descripcion 3', '01:25:00', '2003-05-13', 28000);
insert into peliculas (idpeliculas, actores_idactores, nombre, descripcion, duracion, fecha_lanzamiento, precio) values (4, 8, 'PELICULA 4', 'Descripcion 4', '02:30:00', '2004-05-13', 19000);

insert into categorias (idcategorias, nombre) values (1, 'Accion');
insert into categorias (idcategorias, nombre) values (2, 'Comedia');
insert into categorias (idcategorias, nombre) values (3, 'Drama');
insert into categorias (idcategorias, nombre) values (4, 'Terror');

insert into peliculas_tiene_categorias (peliculas_idpeliculas, categorias_idcategorias) values (1, 1);
insert into peliculas_tiene_categorias (peliculas_idpeliculas, categorias_idcategorias) values (2, 2);
insert into peliculas_tiene_categorias (peliculas_idpeliculas, categorias_idcategorias) values (3, 3);
insert into peliculas_tiene_categorias (peliculas_idpeliculas, categorias_idcategorias) values (4, 4);

insert into catalogo_de_actores (peliculas_idpeliculas, actores_idactores) values (1, 5);
insert into catalogo_de_actores (peliculas_idpeliculas, actores_idactores) values (2, 6);
insert into catalogo_de_actores (peliculas_idpeliculas, actores_idactores) values (3, 7);
insert into catalogo_de_actores (peliculas_idpeliculas, actores_idactores) values (4, 8);
insert into catalogo_de_actores (peliculas_idpeliculas, actores_idactores) values (1, 1);
insert into catalogo_de_actores (peliculas_idpeliculas, actores_idactores) values (2, 2);
insert into catalogo_de_actores (peliculas_idpeliculas, actores_idactores) values (3, 3);
insert into catalogo_de_actores (peliculas_idpeliculas, actores_idactores) values (4, 4);

insert into pedidos (idpedidos, clientes_idclientes, empleados_idempleados, fecha_entrega) values (1, 1, 1, '2021-05-13');
insert into pedidos (idpedidos, clientes_idclientes, empleados_idempleados, fecha_entrega) values (2, 2, 2, '2021-06-13');
insert into pedidos (idpedidos, clientes_idclientes, empleados_idempleados, fecha_entrega) values (3, 3, 3, '2021-07-13');
insert into pedidos (idpedidos, clientes_idclientes, empleados_idempleados, fecha_entrega) values (4, 4, 4, '2021-08-13');

insert into ejemplar_pelicula (idejemplar_pelicula, pedidos_idpedidos, peliculas_idpeliculas) values (1, 1, 1);
insert into ejemplar_pelicula (idejemplar_pelicula, pedidos_idpedidos, peliculas_idpeliculas) values (2, 2, 2);
insert into ejemplar_pelicula (idejemplar_pelicula, pedidos_idpedidos, peliculas_idpeliculas) values (3, 3, 3);
insert into ejemplar_pelicula (idejemplar_pelicula, pedidos_idpedidos, peliculas_idpeliculas) values (4, 4, 4);

insert into catalogo_de_peliculas (locales_idlocales, peliculas_idpeliculas, cantidad) values (1, 1, 26);
insert into catalogo_de_peliculas (locales_idlocales, peliculas_idpeliculas, cantidad) values (2, 2, 30);
insert into catalogo_de_peliculas (locales_idlocales, peliculas_idpeliculas, cantidad) values (3, 3, 20);
insert into catalogo_de_peliculas (locales_idlocales, peliculas_idpeliculas, cantidad) values (4, 4, 10);