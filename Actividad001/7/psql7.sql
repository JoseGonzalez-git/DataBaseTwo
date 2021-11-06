CREATE TABLE tipo_habitacion (
  idtipo_habitacion SERIAL  NOT NULL ,
  tipo VARCHAR(45)   NOT NULL ,
  precio DECIMAL   NOT NULL   ,
PRIMARY KEY(idtipo_habitacion));




CREATE TABLE temporada (
  idtemporada SERIAL  NOT NULL ,
  temporada VARCHAR(45)   NOT NULL ,
  precio DECIMAL   NOT NULL   ,
PRIMARY KEY(idtemporada));




CREATE TABLE cliente (
  nid INTEGER   NOT NULL ,
  nom1 VARCHAR(20)   NOT NULL ,
  nom2 VARCHAR(20)   NOT NULL ,
  apll1 VARCHAR(35)   NOT NULL ,
  apll2 VARCHAR(35)   NOT NULL ,
  telefono VARCHAR(45)   NOT NULL   ,
PRIMARY KEY(nid));




CREATE TABLE estado_habitacion (
  idestado_habitacion SERIAL  NOT NULL ,
  estado VARCHAR(45)   NOT NULL   ,
PRIMARY KEY(idestado_habitacion));




CREATE TABLE habitacion (
  n_habitacion INTEGER   NOT NULL ,
  temporada_idtemporada INTEGER   NOT NULL ,
  estado_habitacion_idestado_habitacion INTEGER   NOT NULL ,
  tipo_habitacion_idtipo_habitacion INTEGER   NOT NULL   ,
PRIMARY KEY(n_habitacion)      ,
  FOREIGN KEY(tipo_habitacion_idtipo_habitacion)
    REFERENCES tipo_habitacion(idtipo_habitacion),
  FOREIGN KEY(estado_habitacion_idestado_habitacion)
    REFERENCES estado_habitacion(idestado_habitacion),
  FOREIGN KEY(temporada_idtemporada)
    REFERENCES temporada(idtemporada));


CREATE INDEX habitacion_FKIndex1 ON habitacion (tipo_habitacion_idtipo_habitacion);
CREATE INDEX habitacion_FKIndex2 ON habitacion (estado_habitacion_idestado_habitacion);
CREATE INDEX habitacion_FKIndex3 ON habitacion (temporada_idtemporada);


CREATE INDEX IFK_Rel_01 ON habitacion (tipo_habitacion_idtipo_habitacion);
CREATE INDEX IFK_Rel_02 ON habitacion (estado_habitacion_idestado_habitacion);
CREATE INDEX IFK_Rel_10 ON habitacion (temporada_idtemporada);


CREATE TABLE gastos_extras (
  idgastos_extras SERIAL  NOT NULL ,
  habitacion_n_habitacion INTEGER   NOT NULL ,
  concepto VARCHAR(50)   NOT NULL ,
  precio DECIMAL   NOT NULL   ,
PRIMARY KEY(idgastos_extras)  ,
  FOREIGN KEY(habitacion_n_habitacion)
    REFERENCES habitacion(n_habitacion));


CREATE INDEX gastos_extras_FKIndex1 ON gastos_extras (habitacion_n_habitacion);


CREATE INDEX IFK_Rel_06 ON gastos_extras (habitacion_n_habitacion);


CREATE TABLE reserva (
  idreserva SERIAL  NOT NULL ,
  cliente_nid INTEGER   NOT NULL ,
  habitacion_n_habitacion INTEGER   NOT NULL ,
  creada_en DATE   NOT NULL   ,
PRIMARY KEY(idreserva)    ,
  FOREIGN KEY(cliente_nid)
    REFERENCES cliente(nid),
  FOREIGN KEY(habitacion_n_habitacion)
    REFERENCES habitacion(n_habitacion));


CREATE INDEX reserva_FKIndex1 ON reserva (cliente_nid);
CREATE INDEX reserva_FKIndex2 ON reserva (habitacion_n_habitacion);


CREATE INDEX IFK_Rel_03 ON reserva (cliente_nid);
CREATE INDEX IFK_Rel_04 ON reserva (habitacion_n_habitacion);


CREATE TABLE factura (
  idfactura SERIAL  NOT NULL ,
  cliente_nid INTEGER   NOT NULL ,
  reserva_idreserva INTEGER   NOT NULL   ,
PRIMARY KEY(idfactura)    ,
  FOREIGN KEY(cliente_nid)
    REFERENCES cliente(nid),
  FOREIGN KEY(reserva_idreserva)
    REFERENCES reserva(idreserva));


CREATE INDEX factura_FKIndex1 ON factura (cliente_nid);
CREATE INDEX factura_FKIndex2 ON factura (reserva_idreserva);


CREATE INDEX IFK_Rel_08 ON factura (cliente_nid);
CREATE INDEX IFK_Rel_09 ON factura (reserva_idreserva);



