CREATE TABLE insumos (
  idinsumos INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre VARCHAR(45)  NOT NULL  ,
  precio_unidad DOUBLE  NOT NULL    ,
PRIMARY KEY(idinsumos));



CREATE TABLE hospitales (
  idhospital INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre VARCHAR(45)  NOT NULL  ,
  direccion VARCHAR(45)  NOT NULL    ,
PRIMARY KEY(idhospital));



CREATE TABLE especializacion (
  idespecializacion INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nombre VARCHAR(45)  NULL    ,
PRIMARY KEY(idespecializacion));



CREATE TABLE personas (
  identificacion INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nom1 VARCHAR(20)  NOT NULL  ,
  nom2 VARCHAR(20)  NOT NULL  ,
  apll1 VARCHAR(35)  NOT NULL  ,
  apll2 VARCHAR(35)  NOT NULL  ,
  fnac DATE  NOT NULL  ,
  telefono VARCHAR(20)  NOT NULL    ,
PRIMARY KEY(identificacion));



CREATE TABLE pacientes (
  idpacientes INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  personas_identificacion INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idpacientes)  ,
INDEX pacientes_FKIndex1(personas_identificacion),
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE pabellones (
  idpabellon INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  hospitales_idhospital INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(45)  NULL    ,
PRIMARY KEY(idpabellon)  ,
INDEX pabellones_FKIndex1(hospitales_idhospital),
  FOREIGN KEY(hospitales_idhospital)
    REFERENCES hospitales(idhospital)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE instrumentaria (
  idinstrumentaria INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  pabellones_idpabellon INTEGER UNSIGNED  NOT NULL  ,
  nombre VARCHAR(45)  NOT NULL  ,
  precio_hora DOUBLE  NOT NULL    ,
PRIMARY KEY(idinstrumentaria)  ,
INDEX instrumentaria_FKIndex1(pabellones_idpabellon),
  FOREIGN KEY(pabellones_idpabellon)
    REFERENCES pabellones(idpabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE cirujano (
  idmedicos INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  personas_identificacion INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idmedicos)  ,
INDEX medicos_FKIndex1(personas_identificacion),
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE arsenalero (
  idarsenalero INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  personas_identificacion INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idarsenalero)  ,
INDEX arsenalero_FKIndex1(personas_identificacion),
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE anestesista (
  idanestesista INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  personas_identificacion INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idanestesista)  ,
INDEX anestesista_FKIndex1(personas_identificacion),
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE especializacion_has_medicos (
  especializacion_idespecializacion INTEGER UNSIGNED  NOT NULL  ,
  cirujano_idmedicos INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(especializacion_idespecializacion, cirujano_idmedicos)  ,
INDEX especializacion_has_medicos_FKIndex1(especializacion_idespecializacion)  ,
INDEX especializacion_has_medicos_FKIndex2(cirujano_idmedicos),
  FOREIGN KEY(especializacion_idespecializacion)
    REFERENCES especializacion(idespecializacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(cirujano_idmedicos)
    REFERENCES cirujano(idmedicos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE equipo_medico (
  idequipo_medico INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  anestesista_idanestesista INTEGER UNSIGNED  NOT NULL  ,
  arsenalero_idarsenalero INTEGER UNSIGNED  NOT NULL  ,
  cirujano_idmedicos INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(idequipo_medico)  ,
INDEX equipo_medico_FKIndex1(cirujano_idmedicos)  ,
INDEX equipo_medico_FKIndex2(arsenalero_idarsenalero)  ,
INDEX equipo_medico_FKIndex3(anestesista_idanestesista),
  FOREIGN KEY(cirujano_idmedicos)
    REFERENCES cirujano(idmedicos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(arsenalero_idarsenalero)
    REFERENCES arsenalero(idarsenalero)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(anestesista_idanestesista)
    REFERENCES anestesista(idanestesista)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE horarios (
  idhorario INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  pabellones_idpabellon INTEGER UNSIGNED  NOT NULL  ,
  horario TIME  NOT NULL    ,
PRIMARY KEY(idhorario)  ,
INDEX horarios_FKIndex1(pabellones_idpabellon),
  FOREIGN KEY(pabellones_idpabellon)
    REFERENCES pabellones(idpabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE cirugias (
  idcirugias INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  equipo_medico_idequipo_medico INTEGER UNSIGNED  NOT NULL  ,
  pabellones_idpabellon INTEGER UNSIGNED  NOT NULL  ,
  hora_entrada TIME  NOT NULL  ,
  hora_salida TIME  NOT NULL  ,
  tiempo estimado  TIME  NOT NULL  ,
  fecha DATE  NOT NULL    ,
PRIMARY KEY(idcirugias)  ,
INDEX cirugias_FKIndex1(pabellones_idpabellon)  ,
INDEX cirugias_FKIndex2(equipo_medico_idequipo_medico),
  FOREIGN KEY(pabellones_idpabellon)
    REFERENCES pabellones(idpabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(equipo_medico_idequipo_medico)
    REFERENCES equipo_medico(idequipo_medico)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE instrumentaria_ejemplar (
  instrumentaria_idinstrumentaria INTEGER UNSIGNED  NOT NULL  ,
  cirugias_idcirugias INTEGER UNSIGNED  NOT NULL  ,
  id_ejemplar INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT  ,
PRIMARY KEY(instrumentaria_idinstrumentaria, cirugias_idcirugias, id_ejemplar)  ,
INDEX instrumentaria_has_cirugias_FKIndex1(instrumentaria_idinstrumentaria)  ,
INDEX instrumentaria_has_cirugias_FKIndex2(cirugias_idcirugias),
  FOREIGN KEY(instrumentaria_idinstrumentaria)
    REFERENCES instrumentaria(idinstrumentaria)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(cirugias_idcirugias)
    REFERENCES cirugias(idcirugias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE cirugias_has_pacientes (
  cirugias_idcirugias INTEGER UNSIGNED  NOT NULL  ,
  pacientes_idpacientes INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(cirugias_idcirugias, pacientes_idpacientes)  ,
INDEX cirugias_has_pacientes_FKIndex1(cirugias_idcirugias)  ,
INDEX cirugias_has_pacientes_FKIndex2(pacientes_idpacientes),
  FOREIGN KEY(cirugias_idcirugias)
    REFERENCES cirugias(idcirugias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(pacientes_idpacientes)
    REFERENCES pacientes(idpacientes)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE estado_cirugia (
  cirugias_idcirugias INTEGER UNSIGNED  NOT NULL  ,
  estado VARCHAR(45)  NOT NULL    ,
INDEX estado_cirugia_FKIndex1(cirugias_idcirugias),
  FOREIGN KEY(cirugias_idcirugias)
    REFERENCES cirugias(idcirugias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);



CREATE TABLE insumos_ejemplares (
  insumos_idinsumos INTEGER UNSIGNED  NOT NULL  ,
  cirugias_idcirugias INTEGER UNSIGNED  NOT NULL  ,
  idejemplar INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT  ,
PRIMARY KEY(insumos_idinsumos, cirugias_idcirugias, idejemplar)  ,
INDEX insumos_has_cirugias_FKIndex1(insumos_idinsumos)  ,
INDEX insumos_has_cirugias_FKIndex2(cirugias_idcirugias),
  FOREIGN KEY(insumos_idinsumos)
    REFERENCES insumos(idinsumos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(cirugias_idcirugias)
    REFERENCES cirugias(idcirugias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);




