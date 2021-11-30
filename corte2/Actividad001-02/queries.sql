/* delimiter //
 create procedure hola_mundo()
 begin
 select 'Hola mundo';
 end//
 delimiter ;
 
 call hola_mundo(); */

DROP PROCEDURE IF EXISTS mensaje_tipo();
DELIMITER //
CREATE PROCEDURE mensaje_tipo(IN numero NUMERIC, OUT mensaje VARCHAR(40))
BEGIN
    IF numero > 0 THEN
        SET mensaje = 'Positivo';
    ELSEIF numero < 0 THEN
        SET mensaje = 'Negativo';
    ELSE
        SET mensaje = 'Cero';
    END IF;
END//
DELIMITER ;
CALL mensaje_tipo(1, @mensaje);