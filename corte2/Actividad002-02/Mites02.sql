-- Database: Mites02
DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos (
  id INTEGER NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) NOT NULL,
  email VARCHAR(255),
  PRIMARY KEY (id)
);

create or replace procedure crear_email(
  in nombre VARCHAR(30),
  in apellido1 VARCHAR(50),
  in apellido2 VARCHAR(50),
  in dominio VARCHAR(50),
  inout email VARCHAR(255)
)
language plpgsql    
as $$
begin
  email = CONCAT(
    substring(nombre,1,1),
    substring(apellido1,1,3),
    substring(apellido2,1,3),
    '@',
    dominio
    );
  
  email = lower(email);
end;
$$ ;

create or replace function trigger_crear_email_before_insert()
returns trigger as $body$
DECLARE email VARCHAR(150);
DECLARE dominio VARCHAR(50);
begin
	dominio = 'sierranevada.org';
    if new.email is NULL THEN
      call crear_email(
        new.nombre,
        new.apellido1,
        new.apellido2,
        dominio,
        email
      );
      new.email = email;
    END IF;
	return new;
end
$body$ language plpgsql;

create trigger trigger_crear_email_before_insert
BEFORE INSERT
ON alumnos FOR EACH ROW
execute procedure trigger_crear_email_before_insert();

INSERT INTO alumnos VALUES (1,'Isaac', 'Arrieta', 'Mercado', NULL);
INSERT INTO alumnos VALUES (2,'Jose', 'Gonzales', 'Ortiz', 'jgonort@sierranevada.org');

SELECT * FROM alumnos;