INSERT INTO familias (idfamilia,nombre_familia,tiempo_familia) VALUES (1, 'Family osos', '2005-08-15');
INSERT INTO familias (idfamilia,nombre_familia,tiempo_familia) VALUES (2, 'Family leopardo', '2008-03-02');
INSERT INTO familias (idfamilia,nombre_familia,tiempo_familia) VALUES (3, 'Family calamar', '1995-08-15');
INSERT INTO familias (idfamilia,nombre_familia,tiempo_familia) VALUES (4, 'Family loros', '2003-09-20');

INSERT INTO miembros (idmiembro,familias_idfamilia,nom1,nom2,apll1,apll2) VALUES (1, 1, 'ADRIANA', 'CAROLINA', 'HERNANDEZ', 'MONTERROZA');
INSERT INTO miembros (idmiembro,familias_idfamilia,nom1,nom2,apll1,apll2) VALUES (2, 2, 'ANGIE', 'TATIANA', 'FERNÁNDEZ', 'MARTÍNEZ');
INSERT INTO miembros (idmiembro,familias_idfamilia,nom1,nom2,apll1,apll2) VALUES (3, 3, 'JORGE', 'MARIO', 'OROZCO', 'DUSSÁN');
INSERT INTO miembros (idmiembro,familias_idfamilia,nom1,nom2,apll1,apll2) VALUES (4, 4, 'SEBASTIAN', 'RICARDO', 'VEGA', 'ZAMBRANO');

INSERT INTO bienes_familia (idbienes_familia,familias_idfamilia,descripcion) VALUES (1, 1, 'Choza al lado del rio');
INSERT INTO bienes_familia (idbienes_familia,familias_idfamilia,descripcion) VALUES (2, 2, 'Choza en el centro, fogon');
INSERT INTO bienes_familia (idbienes_familia,familias_idfamilia,descripcion) VALUES (3, 3, 'fogon, Choza a las afueras del poblado');
INSERT INTO bienes_familia (idbienes_familia,familias_idfamilia,descripcion) VALUES (4, 4, 'Choza a las afueras del poblado');

INSERT INTO edades (idedades,miembros_idmiembro,categoria_edad) VALUES (1,1, 'Niño');
INSERT INTO edades (idedades,miembros_idmiembro,categoria_edad) VALUES (2,2, 'Adolecente');
INSERT INTO edades (idedades,miembros_idmiembro,categoria_edad) VALUES (3,3, 'Anciano');
INSERT INTO edades (idedades,miembros_idmiembro,categoria_edad) VALUES (4,4, 'Anciano');

INSERT INTO bienes_actividad (idbienes_actividad, descripcion) VALUES (1, 'Pala, azada, pico');
INSERT INTO bienes_actividad (idbienes_actividad, descripcion) VALUES (2, 'Caña de pescar, red de pescar');
INSERT INTO bienes_actividad (idbienes_actividad, descripcion) VALUES (3, 'Cesto de recolección');
INSERT INTO bienes_actividad (idbienes_actividad, descripcion) VALUES (4, 'Lanza, arco y flechas');

INSERT INTO actividades (idactividad, bienes_actividad_idbienes_actividad, nombre_actividad) VALUES (1, 1, 'Agricultura');
INSERT INTO actividades (idactividad, bienes_actividad_idbienes_actividad, nombre_actividad) VALUES (2, 2, 'Pesca');
INSERT INTO actividades (idactividad, bienes_actividad_idbienes_actividad, nombre_actividad) VALUES (3, 3, 'Recolector');
INSERT INTO actividades (idactividad, bienes_actividad_idbienes_actividad, nombre_actividad) VALUES (4, 4, 'Cazador');

INSERT INTO estados (idestado, edades_idedades, actividades_idactividad, nombre_estado) VALUES (1, 1, 1, 'Aprendiendo');
INSERT INTO estados (idestado, edades_idedades, actividades_idactividad, nombre_estado) VALUES (2, 2, 2, 'Activo');
INSERT INTO estados (idestado, edades_idedades, actividades_idactividad, nombre_estado) VALUES (3, 3, 3, 'Activo');
INSERT INTO estados (idestado, edades_idedades, actividades_idactividad, nombre_estado) VALUES (4, 4, 4, 'Retirado');