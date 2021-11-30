INSERT INTO cliente (nid,nom1,nom2,apll1,apll2,telefono) VALUES (13265,'Juan','Perez','Perez','Perez','123456789');
INSERT INTO cliente (nid,nom1,nom2,apll1,apll2,telefono) VALUES (13266,'Pedro','Juan','saens','Perez','1472583692');
INSERT INTO cliente (nid,nom1,nom2,apll1,apll2,telefono) VALUES (13267,'Yan','Fran','Arias','Bohorques','963852741');
INSERT INTO cliente (nid,nom1,nom2,apll1,apll2,telefono) VALUES (13268,'Jose','Alejandro','Antonio','Arias','456123789');

INSERT INTO tipo_habitacion (idtipo_habitacion, tipo, precio) VALUES (1, 'Individual', 100);
INSERT INTO tipo_habitacion (idtipo_habitacion, tipo, precio) VALUES (2, 'Doble', 200);
INSERT INTO tipo_habitacion (idtipo_habitacion, tipo, precio) VALUES (3, 'Matrimonial', 300);

INSERT INTO temporada (idtemporada, temporada, precio) VALUES (1, 'Baja', 100);
INSERT INTO temporada (idtemporada, temporada, precio) VALUES (2, 'Alta', 200);
INSERT INTO temporada (idtemporada, temporada, precio) VALUES (3, 'Normal', 300);

INSERT INTO estado_habitacion (idestado_habitacion, estado) VALUES (1, 'Disponible');
INSERT INTO estado_habitacion (idestado_habitacion, estado) VALUES (2, 'Ocupada');
INSERT INTO estado_habitacion (idestado_habitacion, estado) VALUES (3, 'Reservada');

INSERT INTO habitacion (n_habitacion, temporada_idtemporada, estado_habitacion_idestado_habitacion, tipo_habitacion_idtipo_habitacion) VALUES (1, 2, 1, 3);
INSERT INTO habitacion (n_habitacion, temporada_idtemporada, estado_habitacion_idestado_habitacion, tipo_habitacion_idtipo_habitacion) VALUES (2, 1, 2, 1);
INSERT INTO habitacion (n_habitacion, temporada_idtemporada, estado_habitacion_idestado_habitacion, tipo_habitacion_idtipo_habitacion) VALUES (3, 3, 3, 2);
INSERT INTO habitacion (n_habitacion, temporada_idtemporada, estado_habitacion_idestado_habitacion, tipo_habitacion_idtipo_habitacion) VALUES (4, 2, 1, 2);

INSERT INTO gastos_extras (idgastos_extras, habitacion_n_habitacion, concepto, precio) VALUES (1, 1, 'Cocina', 100);
INSERT INTO gastos_extras (idgastos_extras, habitacion_n_habitacion, concepto, precio) VALUES (2, 2, 'Aire acondicionado', 200);
INSERT INTO gastos_extras (idgastos_extras, habitacion_n_habitacion, concepto, precio) VALUES (3, 3, 'Caja fuerte', 300);
INSERT INTO gastos_extras (idgastos_extras, habitacion_n_habitacion, concepto, precio) VALUES (4, 4, 'Lavado de ropa', 400);

INSERT INTO reserva (idreserva, cliente_nid, habitacion_n_habitacion, creada_en) VALUES (1, 13265, 1, '2021-01-01');
INSERT INTO reserva (idreserva, cliente_nid, habitacion_n_habitacion, creada_en) VALUES (2, 13266, 2, '2021-05-11');
INSERT INTO reserva (idreserva, cliente_nid, habitacion_n_habitacion, creada_en) VALUES (3, 13267, 4, '2021-01-06');
INSERT INTO reserva (idreserva, cliente_nid, habitacion_n_habitacion, creada_en) VALUES (4, 13268, 1, '2021-10-13');

INSERT INTO factura (idfactura, cliente_nid, reserva_idreserva) VALUES (1, 13265, 1);
INSERT INTO factura (idfactura, cliente_nid, reserva_idreserva) VALUES (2, 13266, 2);
INSERT INTO factura (idfactura, cliente_nid, reserva_idreserva) VALUES (3, 13267, 3);
INSERT INTO factura (idfactura, cliente_nid, reserva_idreserva) VALUES (4, 13268, 4);