INSERT INTO insumos (idinsumos, nombre, precio_unidad)
VALUES (1, 'Insumo1', 35000);
INSERT INTO insumos (idinsumos, nombre, precio_unidad)
VALUES (2, 'Insumo2', 54030);
INSERT INTO insumos (idinsumos, nombre, precio_unidad)
VALUES (3, 'Insumo3', 120230);
INSERT INTO insumos (idinsumos, nombre, precio_unidad)
VALUES (4, 'Insumo4', 321543);

INSERT INTO hospitales (idhospital, nombre, direccion)
VALUES (1, 'Central1', 'calle 50-51');
INSERT INTO hospitales (idhospital, nombre, direccion)
VALUES (2, 'Central2','calle 60-61');
INSERT INTO hospitales (idhospital, nombre, direccion)
VALUES (3, 'NORTE1', 'Avenida 2 Calle 100');
INSERT INTO hospitales (idhospital, nombre, direccion)
VALUES (4, 'SUR1', 'carrera 4 calle 10-11');

INSERT INTO especializacion (idespecializacion, nombre)
VALUES (1,'Neuro Cirujano');
INSERT INTO especializacion (idespecializacion, nombre)
VALUES (2,'Especialidad2');
INSERT INTO especializacion (idespecializacion, nombre)
VALUES (3,'Especialidad3');
INSERT INTO especializacion (idespecializacion, nombre)
VALUES (4, 'Especialidad4');


INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, fnac, telefono)
VALUES (24, 'Julieta','Ponce', 'Peña','Posada', '1987-08-26', '312459383');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, fnac, telefono)
VALUES (25, 'Valeria', 'Elvia ', 'Hernández', 'Meneses', '1986-07-16', '321563378');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, fnac, telefono)
VALUES (26, 'Mauricio', 'Andres', 'Jiménez', 'Piedrahíta', '1986-02-13', '312247689');


INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, fnac, telefono)
VALUES (27, 'Martín', 'Elías','Acosta','Muñoz', '1990-08-21', '3143576748');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, fnac, telefono)
VALUES (28, 'Pedro', 'Andres', 'Perez', 'Diaz', '1989-04-27', '3134345564');


INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, fnac, telefono)
VALUES (29, 'Juan', 'Antonio', 'Hernandez', 'Perez', '1974-02-19', '3142345435'); 
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, fnac, telefono)
VALUES (30, 'Jhoan', 'Daniel', 'Ramirez', 'Arteaga', '1985-02-19', '31523445435');

INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, fnac, telefono)  
VALUES (31, 'Luz', 'Maria', 'Estrella', 'Gonzalez', '1978-02-19', '3152344513');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, fnac, telefono)
VALUES (32, 'Maria', 'Angelica', 'Gomez', 'Avila', '1989-05-02', '3217654874');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, fnac, telefono)
VALUES (33,'Katerin', 'Estefani', 'Pereira', 'Lopez', '1980-04-27', '312756534');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2, fnac, telefono)
VALUES (34, 'Adalia', 'Melissa', 'Mestra', 'Martinez', '1970-09-09', '316345435');
INSERT INTO personas (identificacion, nom1, nom2, apll1, apll2,  fnac, telefono)
VALUES (35, 'Mauricio', 'Andres', 'Altamiranda', 'Alzate', '1974-10-09', '3231432532');

INSERT INTO pacientes (idpacientes, personas_identificacion)
VALUES (1,24);
INSERT INTO pacientes (idpacientes, personas_identificacion)
VALUES (2,25);
INSERT INTO pacientes (idpacientes, personas_identificacion)
VALUES (3,26);

INSERT INTO pabellones (idpabellon, hospitales_idhospital, nombre)
VALUES (1,1,'Pabellon1');
INSERT INTO pabellones (idpabellon, hospitales_idhospital, nombre)
VALUES (2,1,'Pabellon2');
INSERT INTO pabellones (idpabellon, hospitales_idhospital, nombre)
VALUES (3,2,'Pabellon3');
INSERT INTO pabellones (idpabellon, hospitales_idhospital, nombre)
VALUES (4,2,'Pabellon4');

INSERT INTO instrumentaria (idinstrumentaria, pabellones_idpabellon, nombre, precio_hora)
VALUES (1, 1,'Instrumento1',123466);
INSERT INTO instrumentaria (idinstrumentaria, pabellones_idpabellon, nombre, precio_hora)
VALUES (2, 2,'Instrumento2', 213532);
INSERT INTO instrumentaria (idinstrumentaria, pabellones_idpabellon, nombre, precio_hora)
VALUES (3, 3,'Instrumento3', 313532);
INSERT INTO instrumentaria (idinstrumentaria, pabellones_idpabellon, nombre, precio_hora)
VALUES (4, 4, 'Instrumento4', 42567);


INSERT INTO cirujano (idmedicos, personas_identificacion)
VALUES (1, 27);
INSERT INTO cirujano (idmedicos, personas_identificacion)
VALUES (2, 28);

INSERT INTO arsenalero (idarsenalero, personas_identificacion)
VALUES (1, 29);
INSERT INTO arsenalero (idarsenalero, personas_identificacion)
VALUES (2, 30);

INSERT INTO anestesista (idanestesista, personas_identificacion)
VALUES (1, 31);
INSERT INTO anestesista (idanestesista, personas_identificacion)
VALUES (2, 32);

INSERT INTO especializacion_has_medicos (especializacion_idespecializacion, cirujano_idmedicos)
VALUES (1, 1);
INSERT INTO especializacion_has_medicos (especializacion_idespecializacion, cirujano_idmedicos)
VALUES (2, 2);

INSERT INTO equipo_medico (idequipo_medico, anestesista_idanestesista, arsenalero_idarsenalero, cirujano_idmedicos)
VALUES (1,1,1,2);
INSERT INTO equipo_medico (idequipo_medico, anestesista_idanestesista, arsenalero_idarsenalero, cirujano_idmedicos)
VALUES (2,1,2,2);
INSERT INTO equipo_medico (idequipo_medico, anestesista_idanestesista, arsenalero_idarsenalero, cirujano_idmedicos)
VALUES (3,2,1,1);

INSERT INTO horarios (idhorario, pabellones_idpabellon, horario)
VALUES (1, 2, '13:00:00');
INSERT INTO horarios (idhorario, pabellones_idpabellon, horario)
VALUES (2, 1, '19:00:00');
INSERT INTO horarios (idhorario, pabellones_idpabellon, horario)
VALUES (3, 4, '8:00:00');
INSERT INTO horarios (idhorario, pabellones_idpabellon, horario)
VALUES (4, 3, '15:00:00');


INSERT INTO cirugias (idcirugias, equipo_medico_idequipo_medico, pabellones_idpabellon, hora_entrada, hora_salida, tiempo_estimado, fecha)
VALUES (1, 1, 2, '15:00:00', '18:00:00', '3:00:00', '2020-02-14');
INSERT INTO cirugias (idcirugias, equipo_medico_idequipo_medico, pabellones_idpabellon, hora_entrada, hora_salida, tiempo_estimado, fecha)
VALUES (2, 2, 1, '19:00:00', '22:00:00', '3:30:00', '2020-08-22');
INSERT INTO cirugias (idcirugias, equipo_medico_idequipo_medico, pabellones_idpabellon, hora_entrada, hora_salida, tiempo_estimado, fecha)
VALUES (3, 3, 2, '10:00:00', '15:00:00', '4:30:00', '2020-04-11');

INSERT INTO instrumentaria_ejemplar (instrumentaria_idinstrumentaria, cirugias_idcirugias, id_ejemplar)
VALUES (1, 2, 1);
INSERT INTO instrumentaria_ejemplar (instrumentaria_idinstrumentaria, cirugias_idcirugias, id_ejemplar)
VALUES (2, 3, 2);
INSERT INTO instrumentaria_ejemplar (instrumentaria_idinstrumentaria, cirugias_idcirugias, id_ejemplar)
VALUES (3, 1, 3);
INSERT INTO instrumentaria_ejemplar (instrumentaria_idinstrumentaria, cirugias_idcirugias, id_ejemplar)
VALUES (4, 1, 4);

INSERT INTO cirugias_has_pacientes (cirugias_idcirugias, pacientes_idpacientes)
VALUES (1, 1);
INSERT INTO cirugias_has_pacientes (cirugias_idcirugias, pacientes_idpacientes)
VALUES (2, 3);
INSERT INTO cirugias_has_pacientes (cirugias_idcirugias, pacientes_idpacientes)
VALUES (3, 1);
INSERT INTO cirugias_has_pacientes (cirugias_idcirugias, pacientes_idpacientes)
VALUES (3, 2);

INSERT INTO estado_cirugia (cirugias_idcirugias, estado)
VALUES (1, 'Aplazada');
INSERT INTO estado_cirugia (cirugias_idcirugias, estado)
VALUES (2, 'Activa');
INSERT INTO estado_cirugia (cirugias_idcirugias, estado)
VALUES (3, 'Cancelado');

INSERT INTO insumos_ejemplares (insumos_idinsumos, cirugias_idcirugias, idejemplar)
VALUES (2, 3, 1);
INSERT INTO insumos_ejemplares (insumos_idinsumos, cirugias_idcirugias, idejemplar)
VALUES (1, 2, 2);
INSERT INTO insumos_ejemplares (insumos_idinsumos, cirugias_idcirugias, idejemplar)
VALUES (4, 1, 3);
INSERT INTO insumos_ejemplares (insumos_idinsumos, cirugias_idcirugias, idejemplar)
VALUES (3, 2, 4);
