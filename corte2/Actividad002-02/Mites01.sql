-- Database: Mites01

DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos (
  id INTEGER NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50) NOT NULL,
  nota REAL NOT NULL,
  PRIMARY KEY (id)
);


--• Trigger 1: trigger_check_nota_before_insert
-- Se ejecuta sobre la tabla alumnos.
-- Se ejecuta antes de una operación de inserción.
-- Si el nuevo valor de la nota que se quiere insertar es negativo, se guarda como 0.
-- Si el nuevo valor de la nota que se quiere insertar es mayor que 10, se guarda como 10.


DROP TRIGGER if exists trigger_check_nota_before_insert ON alumnos;
create or replace function trigger_check_nota_before_insert()
returns trigger as $body$
begin
if new.nota < 0 then
	 new.nota = 0;
elseif new.nota > 10 then
	 new.nota = 10;
end if;
return new;
end
$body$ language plpgsql;

create trigger trigger_check_nota_before_insert
BEFORE INSERT
ON alumnos FOR EACH ROW
execute procedure trigger_check_nota_before_insert();

INSERT INTO alumnos VALUES (1, 'Jose', 'Gonzales', 'Ortiz', -1);
INSERT INTO alumnos VALUES (2, 'Isaac', 'Arrieta', 'Mercado', 15);
INSERT INTO alumnos VALUES (3, 'Carlos', 'Argüelles', 'Monterroza', 7);

SELECT * FROM alumnos;


--• Trigger2 : trigger_check_nota_before_update
-- Se ejecuta sobre la tabla alumnos.
-- Se ejecuta antes de una operación de actualización.
-- Si el nuevo valor de la nota que se quiere actualizar es negativo, se guarda como 0.
-- Si el nuevo valor de la nota que se quiere actualizar es mayor que 10, se guarda como 10.

DROP TRIGGER if exists trigger_check_nota_before_update ON alumnos;
create or replace function trigger_check_nota_before_update()
returns trigger as $body$
begin
if new.nota < 0 then
	 new.nota = 0;
elseif new.nota > 10 then
	 new.nota = 10;
end if;
return new;
end
$body$ language plpgsql;

create trigger trigger_check_nota_before_update
BEFORE UPDATE
ON alumnos FOR EACH ROW
execute procedure trigger_check_nota_before_update();


UPDATE alumnos SET nota = -4 WHERE id = 3;
UPDATE alumnos SET nota = 14 WHERE id = 2;
UPDATE alumnos SET nota = 9.5 WHERE id = 1;

SELECT * FROM alumnos;