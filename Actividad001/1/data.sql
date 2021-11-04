INSERT INTO persona (nid, nom1, nom2, apell1, apell2, fnac)
VALUES (
        132545,
        'Juan',
        'Antonio',
        'Hernandez',
        'Perez',
        '2000-01-01'
    ),
(
        2144645,
        'Jhoan',
        'Daniel',
        'Ramirez',
        'Arteaga',
        '2002-03-04'
),
(
        514356,
        'Luz',
        null,
        'Estrella',
        'Gonzalez',
        '2001-08-20'
),
(
        614356,
        'Maria',
        'Camila',
        'Pereira',
        'Lopez',
        '2003-08-20'
);

INSERT INTO paises (idpais, nombre_pais)
VALUES (
        1,
        'Mexico'
    ),
(
        2,
        'Colombia'
    ),
(
        3,
        'Venezuela'
    ),
(
        4,
        'Peru'
    );

INSERT INTO series (id_series, nombre_serie, fecha_estreno, emicion, duracion_episodio, descripcion, mezcla_sonido, formato_relacion_aspecto)
VALUES (
        1,
        'The Walking Dead',
        '2010-10-31',
        TRUE,
        00:45:00,
        'Una serie de ciencia ficción que narra la historia de una población de una región del norte de América, que se enfrenta a una pandemia que amenaza con la supervivencia de la humanidad.',
        'TensionSong',
        '16:9'
),
(
        2,
        'The Big Bang Theory',
        '2007-09-24',
        FALSE,
        00:30:00,
        'Una serie de televisión que narra la vida de una familia de quienes trabajan en una empresa de informática, donde la mayoría de sus miembros son estudiantes universitarios.',
        'AccionSong',
        '16:9'
),
(
        3,
        'Los Simpsons',
        '1989-12-17',
        TRUE,
        00:30:00,
        'Son una familia normal estadounidense que vive en Springfield, una ciudad ficticia de la America Media.'
        'IntroSong',
        '3:4'
),(
        4,
        'Arcane',
        '2021-09-12',
        FALSE,
        00:30:00,
        'Arcane está ambientado en el universo del exitoso MOBA de Riot Games, y cuenta la historia de dos de las hermanas más populares de su universo: Jinx y Vi.'
        'EpicSong',
        '16:9'
);

INSERT INTO categorias (idcategorias, nombre_categoria)
VALUES (
        1,
        'Accion'
    ),
(
        2,
        'Comedia'
    ),
(
        3,
        'Drama'
    ),
(
        4,
        'Terror'
    ),
(
        5,
        'Fantasia'
    ),
(
        6,
        'Anime'
    );

INSERT INTO usuario (idusuario, persona_nid, nombre_usuario, correo_electronico, contrasena)
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