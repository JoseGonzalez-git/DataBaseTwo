------ 
--- SIN OPTIMIZAR
select nombre, direccion, email from persona p, vehiculos v
where p.cedula = v.codigoCliente and v.valorFiscal>100;