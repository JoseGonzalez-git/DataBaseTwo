DROP TABLE IF EXISTS alumnos cascade;
DROP TABLE IF EXISTS log_cambios_email cascade;

CREATE TABLE alumnos (
  id INTEGER   NOT NULL ,
  nombre VARCHAR(30)   NOT NULL ,
  apellido1 VARCHAR(50)   NOT NULL ,
  apellido2 VARCHAR(50)   NOT NULL ,
  email VARCHAR(255)      ,
PRIMARY KEY(id));


CREATE TABLE log_cambios_email (
  id SERIAL  NOT NULL ,
  alumnos_id INTEGER   NOT NULL ,
  fecha_hora TIMESTAMP    ,
  old_email VARCHAR(255)    ,
  new_email VARCHAR(255)      ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(alumnos_id)
    REFERENCES alumnos(id));


CREATE INDEX log_cambios_email_FKIndex1 ON log_cambios_email (alumnos_id);
CREATE INDEX IFK_Rel_01 ON log_cambios_email (alumnos_id);

CREATE or REPLACE function trigger_guardar_email_after_update()
returns trigger as $body$
BEGIN
    if old.email <> new.email THEN
    INSERT INTO log_cambios_email (alumnos_id, fecha_hora, old_email, new_email)
    VALUES (old.id, now(), old.email, new.email);
    END IF;
return new;
END
$body$ language plpgsql;

create trigger trigger_guardar_email_after_update
AFTER UPDATE
ON alumnos FOR EACH ROW
execute procedure trigger_guardar_email_after_update();

INSERT INTO alumnos VALUES (1, 'Isaac', 'Arrieta', 'Mercado', 'isaacv4071@sierranevada.org');

UPDATE alumnos SET email = 'isaacv4071@gmail.com' WHERE id = 1;

SELECT * FROM alumnos;
SELECT * FROM log_cambios_email;