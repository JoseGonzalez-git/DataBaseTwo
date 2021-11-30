DROP DATABASE IF EXISTS universidad;
CREATE DATABASE universidad CHARACTER SET utf8mb4;
USE universidad;
 
CREATE TABLE departamento (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE persona (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    tipo ENUM('profesor', 'alumno') NOT NULL
);
 
CREATE TABLE profesor (
    id_profesor INT UNSIGNED PRIMARY KEY,
    id_departamento INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES persona(id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);
 
 CREATE TABLE grado (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
 
CREATE TABLE asignatura (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT UNSIGNED NOT NULL,
    tipo ENUM('básica', 'obligatoria', 'optativa') NOT NULL,
    curso TINYINT UNSIGNED NOT NULL,
    cuatrimestre TINYINT UNSIGNED NOT NULL,
    id_profesor INT UNSIGNED,
    id_grado INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY(id_grado) REFERENCES grado(id)
);
 
CREATE TABLE curso_escolar (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    anio_inicio YEAR NOT NULL,
    anio_fin YEAR NOT NULL
);

CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT UNSIGNED NOT NULL,
    id_asignatura INT UNSIGNED NOT NULL,
    id_curso_escolar INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES persona(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);
 

/* Departamento */
INSERT INTO departamento VALUES (1, 'Informatica');
INSERT INTO departamento VALUES (2, 'Química y Física');
INSERT INTO departamento VALUES (3, 'Filología');
INSERT INTO departamento VALUES (4, 'Matematica');
INSERT INTO departamento VALUES (5, 'Biología y Geología');

/* Persona */
INSERT INTO persona VALUES (1, '79221403L', 'Camila', 'Hernandez', 'Espitia', 'Monteria', 'C/ Quinto pino', NULL, '1980/10/31', 'M', 'profesor');
INSERT INTO persona VALUES (2, '10485008K', 'Antonio', 'Mendez', 'Araujo', 'Ceretè', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 'profesor');
INSERT INTO persona VALUES (3, '64753215G', 'Jakelin', 'Ramirez', 'Martínez', 'Monteria', 'C/ Zapillo', '628452384', '1996/03/12', 'M', 'alumno');
INSERT INTO persona VALUES (4, '85135690V', 'Sonia', 'Pereira', 'Ruiz', 'Lorica', 'C/ Mercurio', '678812017', '1995/04/13', 'M', 'alumno');
INSERT INTO persona VALUES (5, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Lorica', 'C/ Los pinos', '678652431', '1998/01/01', 'H', 'alumno');
INSERT INTO persona VALUES (6, '80502866Z', 'Alejandro', 'Gomez', 'Caicedo', 'Monteria', 'C/ Tajo', '668726354', '1980/03/14', 'H', 'profesor');
/* Profesor */
INSERT INTO profesor VALUES (1, 1);
INSERT INTO profesor VALUES (2, 2);

/* Grado */
INSERT INTO grado VALUES (1, 'Grado en Ingeniería Informática (Plan 2015)');
INSERT INTO grado VALUES (2, 'Grado en Biotecnología (Plan 2015)');
INSERT INTO grado VALUES (3, 'Grado en Matemáticas (Plan 2010)');
INSERT INTO grado VALUES (4, 'Grado en Química (Plan 2009)');
INSERT INTO grado VALUES (5, 'Grado en Ingeniería Química Industrial (Plan 2010)');

/* Asignatura */
INSERT INTO asignatura VALUES (1, 'Tecnologías de acceso a red', 3, 'optativa', 3, 2, NULL, 1);
INSERT INTO asignatura VALUES (2, 'Lógica y algorítmica', 2, 'básica', 1, 2, 1, 5);
INSERT INTO asignatura VALUES (3, 'Biología vegetal y animal', 2, 'básica', 1, 2, NULL, 2);
INSERT INTO asignatura VALUES (4, 'Ingeniería del Software', 4, 'obligatoria', 2, 1, 2, 1);
INSERT INTO asignatura VALUES (5, 'Química orgánica', 3, 'básica', 1, 1, NULL, 2);


/* Curso escolar */
INSERT INTO curso_escolar VALUES (1, 2014, 2015);
INSERT INTO curso_escolar VALUES (2, 2015, 2016);
INSERT INTO curso_escolar VALUES (3, 2016, 2017);
INSERT INTO curso_escolar VALUES (4, 2017, 2018);
INSERT INTO curso_escolar VALUES (5, 2018, 2019);

/* Alumno se matricula en asignatura */
INSERT INTO alumno_se_matricula_asignatura VALUES (3, 1, 3);
INSERT INTO alumno_se_matricula_asignatura VALUES (3, 2, 2);
INSERT INTO alumno_se_matricula_asignatura VALUES (3, 4, 1);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 5, 4);
INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 5);
INSERT INTO alumno_se_matricula_asignatura VALUES (5, 5, 5);


