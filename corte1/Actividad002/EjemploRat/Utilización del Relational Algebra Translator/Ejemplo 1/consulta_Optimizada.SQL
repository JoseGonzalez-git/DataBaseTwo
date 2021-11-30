
--- Ejemplo 1
--- OPTIMIZADA 

SELECT nombre,direccion,email FROM (SELECT cedula,nombre,direccion,email FROM Persona)alias1 , (SELECT codigoCliente FROM Vehiculos WHERE valorFiscal > '100')alias2  WHERE cedula = codigoCliente;