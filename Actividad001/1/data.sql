INSERT INTO persona (nid, tipoid, nom1, nom2, apll1, apll2, fnac)
VALUES (
        132545,
        'C.C',
        'Juan',
        'Antonio',
        'Hernandez',
        'Perez',
        '2000-01-01'
    ),
    (
        2144645,
        'C.C',
        'Jhoan',
        'Daniel',
        'Ramirez',
        'Arteaga',
        '2002-03-04'
    ),
    (
        514356,
        'C.C',
        'Luz',
        'Maria',
        'Estrella',
        'Gonzalez',
        '2001-08-20'
    ),
    (
        614356,
        'C.C',
        'Maria',
        'Camila',
        'Pereira',
        'Lopez',
        '2003-08-20'
    ),
    (
        714356,
        'C.C',
        'Adalia',
        'Melissa',
        'Mestra',
        'Martinez',
        '2000-08-20'
    ),
    (
        3215346,
        'C.C',
        'Luisa',
        'Maria',
        'Velazquez',
        'Espitia',
        '2002-05-20'
    ),
    (
        675443,
        'C.C',
        'Juan',
        'Carlos',
        'Henriquez',
        'Peñanieto',
    );
INSERT INTO paises (idpais, nombre_pais)
VALUES (1, 'Mexico'),
    (2, 'Colombia'),
    (3, 'Venezuela'),
    (4, 'Peru');
INSERT INTO series (
        idseries,
        nombre_serie,
        fecha_estreno,
        emicion,
        duracion_episodio,
        descripcion,
        mezcla_sonido,
        formato_relacion_aspecto
    )
VALUES (
        1,
        'The Walking Dead',
        '2010-10-31',
        TRUE,
        '00:45:00',
        'Una serie de ciencia ficción que narra la historia de una población de una región del norte de América, que se enfrenta a una pandemia que amenaza con la supervivencia de la humanidad.',
        'TensionSong',
        '16:9'
    ),
    (
        2,
        'The Big Bang Theory',
        '2007-09-24',
        FALSE,
        '00:30:00',
        'Una serie de televisión que narra la vida de una familia de quienes trabajan en una empresa de informática, donde la mayoría de sus miembros son estudiantes universitarios.',
        'AccionSong',
        '16:9'
    ),
    (
        3,
        'Los Simpsons',
        '1989-12-17',
        TRUE,
        '00:30:00',
        'Son una familia normal estadounidense que vive en Springfield, una ciudad ficticia de la America Media.',
        'IntroSong',
        '3:4'
    ),
    (
        4,
        'Arcane',
        '2021-09-12',
        FALSE,
        '00:30:00',
        'Arcane está ambientado en el universo del exitoso MOBA de Riot Games, y cuenta la historia de dos de las hermanas más populares de su universo: Jinx y Vi.',
        'EpicSong',
        '16:9'
    );
INSERT INTO categorias (idcategorias, nombre_categoria)
VALUES (1, 'Accion'),
    (2, 'Comedia'),
    (3, 'Drama'),
    (4, 'Terror'),
    (5, 'Fantasia'),
    (6, 'Anime');
INSERT INTO usuario (
        idusuario,
        persona_nid,
        nombre_usuario,
        correo_electronico,
        contrasena
    )
VALUES (
        1,
        132545,
        'juan',
        'juachito@gmail.com',
        'Craken'
    ),
    (
        2,
        2144645,
        'jhoan',
        'eljoalo@gmail.com',
        'surucutanga'
    ),
    (
        3,
        514356,
        'luz',
        'labebecita@gmail.com',
        'bebelin'
    ),
    (
        4,
        614356,
        'maria',
        'mariela@gmail.com',
        'deusamadeus'
    );
INSERT INTO premios_serie (
        idpremios,
        series_idseries,
        nombre_premio,
        fecha_premio,
        gano
    )
VALUES (
        1,
        1,
        'Mejor serie de accion',
        '2010-10-31',
        TRUE
    ),
    (
        2,
        2,
        'Mejor serie de terror',
        '2010-10-31',
        TRUE
    ),
    (
        3,
        3,
        'Mejor serie de fantasia',
        '2010-10-31',
        TRUE
    ),
    (
        4,
        4,
        'Mejor serie de anime',
        '2010-10-31',
        TRUE
    );
INSERT INTO ciudades (idciudad, paises_idpais, nombre_ciudad)
VALUES 
    (1,2,'Barranquilla'),
    (2, 2, 'Coveñas'),
    (3, 1, 'Popotla'),
    (4,1,'Ciudad de Mexico');
INSERT INTO actores (idactores, persona_nid)
VALUES (1, 614356),
    (2, 2144645);
INSERT INTO temporadas (n_temporada, series_idseries)
VALUES (1, 2),
    (2, 3),
    (3, 1),
    (4, 1);
INSERT INTO director (iddirector, persona_nid)
VALUES (1, 2144645),
    (2, 514356);
INSERT INTO valoracion_escrita_serie (
        idvaloracion_escrita,
        usuario_idusuario,
        series_idseries,
        comentario
    )
VALUES (1, 1, 1, 'Epico'),
    (2, 2, 1, 'Lo mejor de lo mejor'),
    (3, 3, 1, 'Esta bien'),
    (4, 4, 1, 'nada agradable');
    INSERT INTO valoracion_numerica_serie (
        idvaloracion_num,
        usuario_idusuario,
        series_idseries,
        valoracion
    )
VALUES (1, 1, 1, 5),
    (2, 2, 1, 4),
    (3, 3, 1, 3),
    (4, 4, 1, 2);
INSERT INTO episodios (
        n_episodios,
        director_iddirector,
        temporadas_n_temporada,
        nombre_episodio,
        descripcion,
        fecha_publicacion
    )
VALUES (
        1,
        1,
        1,
        1,
        'Mosca',
        'El primer episodio de la serie',
        '2020-10-31'
    ),
    (
        2,
        2,
        1,
        1,
        'Ozymandias',
        'El primer episodio de la segunda temporada de la serie',
        '2020-11-31'
    ),
    (
        3,
        3,
        2,
        1,
        'Estrellas en la noche',
        'El primer episodio de la serie',
        '2010-10-20'
    ),
    (
        4,
        4,
        2,
        1,
        'El rey leon',
        'El primer episodio de la serie',
        '2020-01-31'
    );
INSERT INTO categorias_has_series (categorias_idcategorias, series_idseries)
VALUES (1, 1),
    (2, 2),
    (3, 1),
    (4, 4),
    (2, 2);
INSERT INTO productores (idproductores, episodio_id_episodio, persona_nid)
VALUES(1, 1, 675443),
    (2, 2, 675443),
    (3, 3, 3215346),
    (4, 4, 3215346);
INSERT INTO personajes (
        idpersonajes,
        episodio_id_episodio,
        actores_idactores,
        nombre_personaje
    )
VALUES(1, 1, 2, 'Jack Bauer'),
    (2, 2, 1, 'Criss Smith'),
    (3, 3, 2, 'Lisa Simpson'),
    (4, 4, 1, 'Lee Sin');

INSERT INTO lugar_rodaje (idlugar_rodaje, episodio_id_episodio, ciudades_idciudad, nombre_lugar)
VALUES(1, 1, 1, 'Monumento Ventana al Mundo'),
    (2, 2, 2, 'Frente al Mar'),
    (3, 3, 1, 'Plaza de la Paz'),
    (4, 4, 2, 'Base Militar');

INSERT INTO premios_actores (idpremios_actores, actores_idactores, nombre_premio, fecha_entrega, gano)
VALUES(1, 1, 'Mejor actor', '2021-10-31', TRUE),
    (2, 2, 'Mejor actor', '2020-10-31', TRUE),
    (3, 3, 'Mejor actor', '2022-10-31', FALSE),
    (4, 4, 'Mejor actor', '2021-10-31', FALSE);

INSERT INTO valoracion_numerica_episodio (
        idvaloracion_numerica_episodio,
        episodio_id_episodio,
        usuario_idusuario,
        valoracion
    )
VALUES(1, 1, 1, 5),
    (2, 2, 2, 4),
    (3, 3, 3, 3),
    (4, 4, 4, 2);

INSERT INTO valoracion_escrita_episodio (
        idvaloracion_escrita_episodio,
        episodio_id_episodio,
        usuario_idusuario,
        comentario
    )
VALUES(1, 1, 1, 'Epico'),
    (2, 2, 2, 'Ta bien'),
    (3, 3, 3, 'mmm me'),
    (4, 4, 4, 'Mucho relleno');

INSERT INTO guionistas (idguionistas, episodio_id_episodio, persona_nid)
VALUES(1, 1, 675443),
    (2, 2, 675443),
    (3, 3, 3215346),
    (4, 4, 3215346);
