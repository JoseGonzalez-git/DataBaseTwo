CREATE TABLE tipo_habitacion (
  idtipo_habitacion INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  tipo VARCHAR(45)  NOT NULL  ,
  precio DECIMAL  NOT NULL    ,
PRIMARY KEY(idtipo_habitacion));



CREATE TABLE temporada (
  idtemporada INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  temporada VARCHAR(45)  NOT NULL  ,
  precio DECIMAL  NOT NULL    ,
PRIMARY KEY(idtemporada));



CREATE TABLE cliente (
  nid INTEGER UNSIGNED  NOT NULL  ,
  nom1 VARCHAR(20)  NOT NULL  ,
  nom2 VARCHAR(20)  NOT NULL  ,
  apll1 VARCHAR(35)  NOT NULL  ,
  apll2 VARCHAR(35)  NOT NULL  ,
  telefono VARCHAR(45)  NOT NULL    ,
PRIMARY KEY(nid));



CREATE TABLE estado_habitacion (
  idestado_habitacion INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  estado VARCHAR(45)  NOT NULL    ,
PRIMARY KEY(idestado_habitacion));



CREATE TABLE habitacion (
  n_habitacion INTEGER UNSIGNED  NOT NULL  ,
  temporada_idtemporada INTEGER UNSIGNED  NOT NULL  ,
  estado_habitacion_idestado_habitacion INTEGER UNSIGNED  NOT NULL  ,
  tipo_habitacion_idtipo_habitacion INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(n_habitacion)  ,
INDEX habitacion_FKIndex1(tipo_habitacion_idtipo_habitacion)  ,
INDEX habitacion_FKIndex2(estado_habitacion_idestado_habitacion)  ,
INDEX habitacion_FKIndex3(temporada_idtemporada),
  FOREIGN KEY(tipo_habitacion_idtipo_habitacion)
    REFERENCES tipo_habitacion(idtipo_habitacion)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(estado_habitacion_idestado_habitacion)
    REFERENCES estado_habitacion(idestado_habitacion)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(temporada_idtemporada)
    REFERENCES temporada(idtemporada)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE gastos_extras (
  idgastos_extras INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  habitacion_n_habitacion INTEGER UNSIGNED  NOT NULL  ,
  concepto VARCHAR(50)  NOT NULL  ,
  precio DECIMAL  NOT NULL    ,
PRIMARY KEY(idgastos_extras)  ,
INDEX gastos_extras_FKIndex1(habitacion_n_habitacion),
  FOREIGN KEY(habitacion_n_habitacion)
    REFERENCES habitacion(n_habitacion)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE reserva (
  idreserva INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  cliente_nid INTEGER UNSIGNED  NOT NULL  ,
  habitacion_n_habitacion INTEGER UNSIGNED  NOT NULL  ,
  creada_en DATE  NOT NULL    ,
PRIMARY KEY(idreserva)  ,
INDEX reserva_FKIndex1(cliente_nid)  ,
INDEX reserva_FKIndex2(habitacion_n_habitacion),
  FOREIGN KEY(cliente_nid)
    REFERENCES cliente(nid)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(habitacion_n_habitacion)
    REFERENCES habitacion(n_habitacion)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE factura (
  idfactura INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  cliente_nid INTEGER UNSIGNED  NOT NULL  ,
  reserva_idreserva INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idfactura)  ,
INDEX factura_FKIndex1(cliente_nid)  ,
INDEX factura_FKIndex2(reserva_idreserva),
  FOREIGN KEY(cliente_nid)
    REFERENCES cliente(nid)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(reserva_idreserva)
    REFERENCES reserva(idreserva)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




