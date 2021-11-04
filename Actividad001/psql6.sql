CREATE TABLE insumos (
  idinsumos SERIAL  NOT NULL ,
  nombre VARCHAR(45)   NOT NULL ,
  precio_unidad DOUBLE   NOT NULL   ,
PRIMARY KEY(idinsumos));




CREATE TABLE hospitales (
  idhospital SERIAL  NOT NULL ,
  nombre VARCHAR(45)   NOT NULL ,
  direccion VARCHAR(45)   NOT NULL   ,
PRIMARY KEY(idhospital));




CREATE TABLE especializacion (
  idespecializacion SERIAL  NOT NULL ,
  nombre VARCHAR(45)      ,
PRIMARY KEY(idespecializacion));




CREATE TABLE personas (
  identificacion SERIAL  NOT NULL ,
  nom1 VARCHAR(20)   NOT NULL ,
  nom2 VARCHAR(20)   NOT NULL ,
  apll1 VARCHAR(35)   NOT NULL ,
  apll2 VARCHAR(35)   NOT NULL ,
  fnac DATE   NOT NULL ,
  telefono VARCHAR(20)   NOT NULL   ,
PRIMARY KEY(identificacion));




CREATE TABLE pacientes (
  idpacientes SERIAL  NOT NULL ,
  personas_identificacion INTEGER   NOT NULL   ,
PRIMARY KEY(idpacientes)  ,
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX pacientes_FKIndex1 ON pacientes (personas_identificacion);


CREATE INDEX IFK_puede ser ON pacientes (personas_identificacion);


CREATE TABLE pabellones (
  idpabellon SERIAL  NOT NULL ,
  hospitales_idhospital INTEGER   NOT NULL ,
  nombre VARCHAR(45)      ,
PRIMARY KEY(idpabellon)  ,
  FOREIGN KEY(hospitales_idhospital)
    REFERENCES hospitales(idhospital)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX pabellones_FKIndex1 ON pabellones (hospitales_idhospital);


CREATE INDEX IFK_posee ON pabellones (hospitales_idhospital);


CREATE TABLE instrumentaria (
  idinstrumentaria SERIAL  NOT NULL ,
  pabellones_idpabellon INTEGER   NOT NULL ,
  nombre VARCHAR(45)   NOT NULL ,
  precio_hora DOUBLE   NOT NULL   ,
PRIMARY KEY(idinstrumentaria)  ,
  FOREIGN KEY(pabellones_idpabellon)
    REFERENCES pabellones(idpabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX instrumentaria_FKIndex1 ON instrumentaria (pabellones_idpabellon);


CREATE INDEX IFK_utiliza ON instrumentaria (pabellones_idpabellon);


CREATE TABLE cirujano (
  idmedicos SERIAL  NOT NULL ,
  personas_identificacion INTEGER   NOT NULL   ,
PRIMARY KEY(idmedicos)  ,
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX medicos_FKIndex1 ON cirujano (personas_identificacion);


CREATE INDEX IFK_aplica como ON cirujano (personas_identificacion);


CREATE TABLE arsenalero (
  idarsenalero SERIAL  NOT NULL ,
  personas_identificacion INTEGER   NOT NULL   ,
PRIMARY KEY(idarsenalero)  ,
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX arsenalero_FKIndex1 ON arsenalero (personas_identificacion);


CREATE INDEX IFK_trabaja como ON arsenalero (personas_identificacion);


CREATE TABLE anestesista (
  idanestesista SERIAL  NOT NULL ,
  personas_identificacion INTEGER   NOT NULL   ,
PRIMARY KEY(idanestesista)  ,
  FOREIGN KEY(personas_identificacion)
    REFERENCES personas(identificacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX anestesista_FKIndex1 ON anestesista (personas_identificacion);


CREATE INDEX IFK_se emplea como ON anestesista (personas_identificacion);


CREATE TABLE especializacion_has_medicos (
  especializacion_idespecializacion INTEGER   NOT NULL ,
  cirujano_idmedicos INTEGER   NOT NULL   ,
PRIMARY KEY(especializacion_idespecializacion, cirujano_idmedicos)    ,
  FOREIGN KEY(especializacion_idespecializacion)
    REFERENCES especializacion(idespecializacion)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(cirujano_idmedicos)
    REFERENCES cirujano(idmedicos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX especializacion_has_medicos_FKIndex1 ON especializacion_has_medicos (especializacion_idespecializacion);
CREATE INDEX especializacion_has_medicos_FKIndex2 ON especializacion_has_medicos (cirujano_idmedicos);


CREATE INDEX IFK_tiene ON especializacion_has_medicos (especializacion_idespecializacion);
CREATE INDEX IFK_posee ON especializacion_has_medicos (cirujano_idmedicos);


CREATE TABLE equipo_medico (
  idequipo_medico SERIAL  NOT NULL ,
  anestesista_idanestesista INTEGER   NOT NULL ,
  arsenalero_idarsenalero INTEGER   NOT NULL ,
  cirujano_idmedicos INTEGER   NOT NULL   ,
PRIMARY KEY(idequipo_medico)      ,
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


CREATE INDEX equipo_medico_FKIndex1 ON equipo_medico (cirujano_idmedicos);
CREATE INDEX equipo_medico_FKIndex2 ON equipo_medico (arsenalero_idarsenalero);
CREATE INDEX equipo_medico_FKIndex3 ON equipo_medico (anestesista_idanestesista);


CREATE INDEX IFK_participa ON equipo_medico (cirujano_idmedicos);
CREATE INDEX IFK_participa ON equipo_medico (arsenalero_idarsenalero);
CREATE INDEX IFK_participa ON equipo_medico (anestesista_idanestesista);


CREATE TABLE horarios (
  idhorario SERIAL  NOT NULL ,
  pabellones_idpabellon INTEGER   NOT NULL ,
  horario TIME   NOT NULL   ,
PRIMARY KEY(idhorario)  ,
  FOREIGN KEY(pabellones_idpabellon)
    REFERENCES pabellones(idpabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX horarios_FKIndex1 ON horarios (pabellones_idpabellon);


CREATE INDEX IFK_tienen ON horarios (pabellones_idpabellon);


CREATE TABLE cirugias (
  idcirugias SERIAL  NOT NULL ,
  equipo_medico_idequipo_medico INTEGER   NOT NULL ,
  pabellones_idpabellon INTEGER   NOT NULL ,
  hora_entrada TIME   NOT NULL ,
  hora_salida TIME   NOT NULL ,
  tiempo estimado  TIME   NOT NULL ,
  fecha DATE   NOT NULL   ,
PRIMARY KEY(idcirugias)    ,
  FOREIGN KEY(pabellones_idpabellon)
    REFERENCES pabellones(idpabellon)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(equipo_medico_idequipo_medico)
    REFERENCES equipo_medico(idequipo_medico)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX cirugias_FKIndex1 ON cirugias (pabellones_idpabellon);
CREATE INDEX cirugias_FKIndex2 ON cirugias (equipo_medico_idequipo_medico);


CREATE INDEX IFK_se realizan ON cirugias (pabellones_idpabellon);
CREATE INDEX IFK_se encarga ON cirugias (equipo_medico_idequipo_medico);


CREATE TABLE instrumentaria_ejemplar (
  instrumentaria_idinstrumentaria INTEGER   NOT NULL ,
  cirugias_idcirugias INTEGER   NOT NULL ,
  id_ejemplar SERIAL  NOT NULL   ,
PRIMARY KEY(instrumentaria_idinstrumentaria, cirugias_idcirugias, id_ejemplar)    ,
  FOREIGN KEY(instrumentaria_idinstrumentaria)
    REFERENCES instrumentaria(idinstrumentaria)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(cirugias_idcirugias)
    REFERENCES cirugias(idcirugias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX instrumentaria_has_cirugias_FKIndex1 ON instrumentaria_ejemplar (instrumentaria_idinstrumentaria);
CREATE INDEX instrumentaria_has_cirugias_FKIndex2 ON instrumentaria_ejemplar (cirugias_idcirugias);


CREATE INDEX IFK_tiene ON instrumentaria_ejemplar (instrumentaria_idinstrumentaria);
CREATE INDEX IFK_usan ON instrumentaria_ejemplar (cirugias_idcirugias);


CREATE TABLE cirugias_has_pacientes (
  cirugias_idcirugias INTEGER   NOT NULL ,
  pacientes_idpacientes INTEGER   NOT NULL   ,
PRIMARY KEY(cirugias_idcirugias, pacientes_idpacientes)    ,
  FOREIGN KEY(cirugias_idcirugias)
    REFERENCES cirugias(idcirugias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(pacientes_idpacientes)
    REFERENCES pacientes(idpacientes)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX cirugias_has_pacientes_FKIndex1 ON cirugias_has_pacientes (cirugias_idcirugias);
CREATE INDEX cirugias_has_pacientes_FKIndex2 ON cirugias_has_pacientes (pacientes_idpacientes);


CREATE INDEX IFK_es ON cirugias_has_pacientes (cirugias_idcirugias);
CREATE INDEX IFK_tiene ON cirugias_has_pacientes (pacientes_idpacientes);


CREATE TABLE estado_cirugia (
  cirugias_idcirugias INTEGER   NOT NULL ,
  estado VARCHAR(45)   NOT NULL   ,
  FOREIGN KEY(cirugias_idcirugias)
    REFERENCES cirugias(idcirugias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX estado_cirugia_FKIndex1 ON estado_cirugia (cirugias_idcirugias);


CREATE INDEX IFK_se encuentra ON estado_cirugia (cirugias_idcirugias);


CREATE TABLE insumos_ejemplares (
  insumos_idinsumos INTEGER   NOT NULL ,
  cirugias_idcirugias INTEGER   NOT NULL ,
  idejemplar SERIAL  NOT NULL   ,
PRIMARY KEY(insumos_idinsumos, cirugias_idcirugias, idejemplar)    ,
  FOREIGN KEY(insumos_idinsumos)
    REFERENCES insumos(idinsumos)
      ON DELETE RESTRICT
      ON UPDATE CASCADE,
  FOREIGN KEY(cirugias_idcirugias)
    REFERENCES cirugias(idcirugias)
      ON DELETE RESTRICT
      ON UPDATE CASCADE);


CREATE INDEX insumos_has_cirugias_FKIndex1 ON insumos_ejemplares (insumos_idinsumos);
CREATE INDEX insumos_has_cirugias_FKIndex2 ON insumos_ejemplares (cirugias_idcirugias);


CREATE INDEX IFK_tiene ON insumos_ejemplares (insumos_idinsumos);
CREATE INDEX IFK_usan ON insumos_ejemplares (cirugias_idcirugias);



