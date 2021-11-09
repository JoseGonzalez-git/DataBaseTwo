

--- Ejemplo 2
--- OPTIMIZADA 

SELECT nombre,email FROM (SELECT cedula FROM (SELECT factura FROM (SELECT codigoBarras FROM (SELECT Proveedor.codigo FROM Proveedor WHERE Proveedor.pais <> 506)provedor, (SELECT Producto.codigoBarras,Producto.proveedor FROM Producto WHERE Producto.descripcion = 'electronico')alias1  WHERE codigo = proveedor)tablaTemporal1, (SELECT factura,lineaDetalle.producto FROM lineaDetalle WHERE cantidad >= 2 AND cantidad * precioUnitario >= 50000)alias2  WHERE codigoBarras = producto)alias3 , (SELECT consecutivo,cedula FROM (SELECT Factura.consecutivo,Factura.zona,Factura.cedula FROM Factura)alias4 , (SELECT Zona.codigo FROM Zona WHERE Zona.nombre = 'Heredia')alias5  WHERE zona = codigo)alias6  WHERE factura = consecutivo)alias7 , (SELECT Cliente.cedulaCliente,Cliente.nombre,Cliente.email FROM Cliente)alias8  WHERE cedula = cedulaCliente