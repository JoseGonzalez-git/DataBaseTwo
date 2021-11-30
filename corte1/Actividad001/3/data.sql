INSERT INTO personas (idpersonas, nom1, nom2, apll1, apll2, n_telefono, correo_electronico, fnac) 
VALUES (159753, 'GABRIEL', 'FELIPE', 'HERRERA', 'MORENO', '55555555', 'MORENO123@correo.com', '2000-01-01');
INSERT INTO personas (idpersonas, nom1, nom2, apll1, apll2, n_telefono, correo_electronico, fnac) 
VALUES (258852, 'GLORIA', 'PATRICIA', 'MENDOZA', 'ALVEAR', '45555986', 'ALVEAR23@correo.com', '1999-06-03');
INSERT INTO personas (idpersonas, nom1, nom2, apll1, apll2, n_telefono, correo_electronico, fnac) 
VALUES (147741, 'ESTEWIL', 'CARLOS', 'QUESADA', 'CALDERÍN', '26845555', 'CALDERIN23@correo.com', '2002-08-10');
INSERT INTO personas (idpersonas, nom1, nom2, apll1, apll2, n_telefono, correo_electronico, fnac) 
VALUES (369963, 'CARLOS', 'DIDIER', 'CASTAÑO', 'CONTRERAS', '75655986', 'CONTRERAS3@correo.com', '1999-08-09');

INSERT INTO personas (idpersonas, nom1, nom2, apll1, apll2, n_telefono, correo_electronico, fnac) 
VALUES (456654, 'ADRIANA', 'MARCELA', 'REY', 'SANCHEZ', '23568555', 'SANCHEZ123@correo.com', '2005-10-15');
INSERT INTO personas (idpersonas, nom1, nom2, apll1, apll2, n_telefono, correo_electronico, fnac) 
VALUES (159951, 'CINTHYA', 'FERNANDA', 'DUSSÁN', 'GUZMÁN', '45555986', 'GUZMÁN@correo.com', '1997-06-03');
INSERT INTO personas (idpersonas, nom1, nom2, apll1, apll2, n_telefono, correo_electronico, fnac) 
VALUES (357753, 'JENNY', 'VIVIANA', 'MONCALEANO', 'PRECIADO', '26845555', 'PRECIADO@correo.com', '2007-08-10');
INSERT INTO personas (idpersonas, nom1, nom2, apll1, apll2, n_telefono, correo_electronico, fnac) 
VALUES (789987, 'GUILLERMO', 'DIDIER', 'ZUBIETA', 'CONTRERAS', '75655986', 'ZUBIETA@correo.com', '1996-08-09');

INSERT INTO sexo (idsexo, personas_idpersonas, sexo) VALUES (1, 159753, 'M');
INSERT INTO sexo (idsexo, personas_idpersonas, sexo) VALUES (2, 258852, 'F');
INSERT INTO sexo (idsexo, personas_idpersonas, sexo) VALUES (3, 147741, 'F');
INSERT INTO sexo (idsexo, personas_idpersonas, sexo) VALUES (4, 369963, 'M');
INSERT INTO sexo (idsexo, personas_idpersonas, sexo) VALUES (5, 456654, 'F');
INSERT INTO sexo (idsexo, personas_idpersonas, sexo) VALUES (6, 159951, 'F');
INSERT INTO sexo (idsexo, personas_idpersonas, sexo) VALUES (7, 357753, 'F');
INSERT INTO sexo (idsexo, personas_idpersonas, sexo) VALUES (8, 789987, 'M');

INSERT INTO expositores (idexpositores, personas_idpersonas) VALUES (1, 159753);
INSERT INTO expositores (idexpositores, personas_idpersonas) VALUES (2, 258852);
INSERT INTO expositores (idexpositores, personas_idpersonas) VALUES (3, 147741);
INSERT INTO expositores (idexpositores, personas_idpersonas) VALUES (4, 369963);

INSERT INTO articulos (idarticulos, nombre_articulo, n_paginas, tema, fecha_publicacion) VALUES (1, 'ARTICULO 1', 100, 'TEMA 1', '2021-05-11');
INSERT INTO articulos (idarticulos, nombre_articulo, n_paginas, tema, fecha_publicacion) VALUES (2, 'ARTICULO 2', 200, 'TEMA 2', '2021-06-12');
INSERT INTO articulos (idarticulos, nombre_articulo, n_paginas, tema, fecha_publicacion) VALUES (3, 'ARTICULO 3', 300, 'TEMA 3', '2021-01-13');
INSERT INTO articulos (idarticulos, nombre_articulo, n_paginas, tema, fecha_publicacion) VALUES (4, 'ARTICULO 4', 400, 'TEMA 4', '2021-03-14');

INSERT INTO personas_has_articulos (personas_idpersonas, articulos_idarticulos) VALUES (456654, 1);
INSERT INTO personas_has_articulos (personas_idpersonas, articulos_idarticulos) VALUES (159951, 2);
INSERT INTO personas_has_articulos (personas_idpersonas, articulos_idarticulos) VALUES (357753, 3);
INSERT INTO personas_has_articulos (personas_idpersonas, articulos_idarticulos) VALUES (789987, 4);

INSERT INTO charlas (idcharlas,expositores_idexpositores,tema_charla,duracion) VALUES (1,1,'TEMA 1','01:00:00');
INSERT INTO charlas (idcharlas,expositores_idexpositores,tema_charla,duracion) VALUES (2,2,'TEMA 2','01:00:00');
INSERT INTO charlas (idcharlas,expositores_idexpositores,tema_charla,duracion) VALUES (3,3,'TEMA 3','01:00:00');
INSERT INTO charlas (idcharlas,expositores_idexpositores,tema_charla,duracion) VALUES (4,4,'TEMA 4','01:00:00');

INSERT INTO workshops (idworkshops,charlas_idcharlas,nombre,descripcion,fecha,hora) VALUES (1,1,'TEMA 1','DESCRIPCION 1','2021-05-11','08:00:00');
INSERT INTO workshops (idworkshops,charlas_idcharlas,nombre,descripcion,fecha,hora) VALUES (2,2,'TEMA 2','DESCRIPCION 2','2021-06-12','11:00:00');
INSERT INTO workshops (idworkshops,charlas_idcharlas,nombre,descripcion,fecha,hora) VALUES (3,3,'TEMA 3','DESCRIPCION 3','2021-01-13','09:00:00');
INSERT INTO workshops (idworkshops,charlas_idcharlas,nombre,descripcion,fecha,hora) VALUES (4,4,'TEMA 4','DESCRIPCION 4','2021-03-14','10:00:00');

INSERT INTO articulos_has_workshops (articulos_idarticulos,workshops_idworkshops) VALUES (1,1);
INSERT INTO articulos_has_workshops (articulos_idarticulos,workshops_idworkshops) VALUES (2,2);
INSERT INTO articulos_has_workshops (articulos_idarticulos,workshops_idworkshops) VALUES (3,3);
INSERT INTO articulos_has_workshops (articulos_idarticulos,workshops_idworkshops) VALUES (4,4);