
------ 
--- SIN OPTIMIZAR
/*
Π{Cliente.nombre,Cliente.cedulaCliente,email}(σ{Zona.nombre = 'Heredia' ∧ LineaDetalle.cantidad ≥ 2 ∧ Producto.descripcion = 'electronico' ∧ (LineaDetalle.precioUnitario * LineaDetalle.cantidad) ≥ 50000 ∧ Factura.zona = Zona.codigo ∧ Proveedor.pais ≠ 506 ∧ Proveedor.codigo = Producto.proveedor ∧ Factura.cedula = Cliente.cedulaCliente}(Cliente × Factura × Zona × LineaDetalle × Producto × Proveedor))
*/

SELECT Cliente.nombre,Cliente.cedulaCliente,email FROM Cliente, Factura, Zona, LineaDetalle, Producto, Proveedor WHERE Zona.nombre = 'Heredia' AND LineaDetalle.cantidad >= 2 AND Producto.descripcion = 'electronico' AND (LineaDetalle.precioUnitario * LineaDetalle.cantidad) >= 50000 AND Factura.zona = Zona.codigo AND Proveedor.pais <> 506 AND Proveedor.codigo = Producto.proveedor AND Factura.cedula = Cliente.cedulaCliente;

SELECT Cliente.nombre,email FROM Cliente, Factura, Zona, LineaDetalle, Producto, Proveedor WHERE Factura.cedula = Cliente.cedulaCliente AND Zona.nombre = 'Heredia' AND LineaDetalle.cantidad >= 2 AND Producto.descripcion = 'electronico' AND (LineaDetalle.precioUnitario * LineaDetalle.cantidad) >= 50000 AND Factura.zona = Zona.codigo AND  Proveedor.pais <> 506 AND Proveedor.codigo = Producto.proveedor;

