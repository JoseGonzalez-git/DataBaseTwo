DROP TABLE IF EXISTS alumnos cascade;
DROP TABLE IF EXISTS log_alumnos_eliminados cascade;

CREATE TABLE alumnos (
  id INTEGER   NOT NULL ,
  nombre VARCHAR(45)    ,
  apellido1 VARCHAR(45)    ,
  apellido2 VARCHAR(45)    ,
  email VARCHAR(255)      ,
PRIMARY KEY(id));

CREATE TABLE log_alumnos_eliminados (
  id SERIAL  NOT NULL ,
  alumnos_id INTEGER   NOT NULL ,
  fecha_hora TIMESTAMP    ,
  nombre VARCHAR(45)   NOT NULL ,
  apellido1 VARCHAR(45)   NOT NULL ,
  apellido2 VARCHAR(45)   NOT NULL ,
  email VARCHAR(255)      ,
PRIMARY KEY(id));


CREATE or REPLACE function trigger_guardar_alumnos_eliminados()
returns trigger as $body$
BEGIN
    INSERT INTO log_alumnos_eliminados (alumnos_id, fecha_hora, nombre, apellido1, apellido2, email)
    VALUES (old.id, now(), old.nombre, old.apellido1, old.apellido2, old.email);
return new;
END
$body$ language plpgsql;

create trigger trigger_guardar_alumnos_eliminados
AFTER DELETE
ON alumnos FOR EACH ROW
execute procedure trigger_guardar_alumnos_eliminados();


INSERT INTO alumnos VALUES (1, 'Isaac', 'Arrieta', 'Mercado', 'isaacv4071@sierranevada.org');
INSERT INTO alumnos VALUES (2,'Jose', 'Gonzales', 'Ortiz', 'jgonort@sierranevada.org');

DELETE FROM alumnos WHERE id = 1;

SELECT * FROM alumnos;
SELECT * FROM log_alumnos_eliminados;