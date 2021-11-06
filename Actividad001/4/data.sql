
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, genero, fnac, telefono, email)
VALUES ('29', 'Juan', 'Antonio', 'Hernandez', 'Perez', 'M', '2000-02-19', '3142345435', 'juancho@gmail.com'); 
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, genero, fnac, telefono, email)
VALUES ('30', 'Jhoan', 'Daniel', 'Ramirez', 'Arteaga','M', '2001-02-19', '31523445435', 'jhoan@gmail.com');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, genero, fnac, telefono, email)  
VALUES ('31', 'Luz', 'Maria', 'Estrella', 'Gonzalez', 'F', '2002-02-19', '3152344513', 'luzm@gmail.com');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, genero, fnac, telefono, email)
VALUES ('32', 'Maria', 'Angelica', 'Gomez', 'Avila', 'F', '2000-05-02', '3217654874', 'avila@gmail.com');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, genero, fnac, telefono, email)
VALUES ('33','Katerin', 'Estefani', 'Pereira', 'Lopez', 'F', '2002-04-27', '312756534', 'katerin12@gmail.com');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, genero, fnac, telefono, email)
VALUES ('34', 'Adalia', 'Melissa', 'Mestra', 'Martinez', 'F', '1999-09-09', '316345435', 'mestra@gmail.com');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, genero, fnac, telefono, email)
VALUES ('35', 'Mauricio', 'Andres', 'Altamiranda', 'Alzate', 'M', '1990-09-09', '3231432532', 'alm@gmail.com');

INSERT INTO lugar (idlugar, nombre, capacidad)
VALUES (1, 'Plaza Principal', '50');
INSERT INTO lugar (idlugar, nombre, capacidad)
VALUES (2, 'Centro de Salud', '30');
INSERT INTO lugar (idlugar, nombre, capacidad)
VALUES (3, 'Camo dos Esquinas', '20');
INSERT INTO lugar (idlugar, nombre, capacidad)
VALUES (4, 'Puesto de Salud', '30');


INSERT INTO reuniones (idreuniones, lugar_idlugar, tema, fecha_inicio)
VALUES (1, 1, 'Vacunacion a Primera Infacia', '2020-02-01');
INSERT INTO reuniones (idreuniones, lugar_idlugar, tema, fecha_inicio)
VALUES (2, 2, 'Primeros Auxilios', '2020-03-10');
INSERT INTO reuniones (idreuniones, lugar_idlugar, tema, fecha_inicio)
VALUES (3, 3, 'Pruebas Covid-18', '2020-09-09');
INSERT INTO reuniones (idreuniones, lugar_idlugar, tema, fecha_inicio)
VALUES (4, 4, 'Vacunacion a la tercera edad', '2020-06-09');

INSERT INTO recursos (idrecursos, lugar_idlugar, descripcion)
VALUES (1, 1, '100 Paquetes de inyecciones, 30 Paquetes de Algodon');
INSERT INTO recursos (idrecursos, lugar_idlugar, descripcion)
VALUES (2, 2, '20 Kit de practica primeros auxilios, 20 Maniquies');
INSERT INTO recursos (idrecursos, lugar_idlugar, descripcion)
VALUES (3, 3, '100 Isopos');
INSERT INTO recursos (idrecursos, lugar_idlugar, descripcion)
VALUES (4, 4, '50 Paquetes de inyecciones, 20 Paquetes de Algodon');

INSERT INTO agenda (personas_identificacion, reuniones_idreuniones)
VALUES (29, 1);
INSERT INTO agenda (personas_identificacion, reuniones_idreuniones)
VALUES (30, 1);
INSERT INTO agenda (personas_identificacion, reuniones_idreuniones)
VALUES (31, 2);
INSERT INTO agenda (personas_identificacion, reuniones_idreuniones)
VALUES (32, 2);
INSERT INTO agenda (personas_identificacion, reuniones_idreuniones)
VALUES (33, 3);
INSERT INTO agenda (personas_identificacion, reuniones_idreuniones)
VALUES (34, 3);
INSERT INTO agenda (personas_identificacion, reuniones_idreuniones)
VALUES (35, 4);
