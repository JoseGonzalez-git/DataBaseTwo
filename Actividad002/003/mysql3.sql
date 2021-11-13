CREATE TABLE proveedor (
  snum VARCHAR(2)  NOT NULL  ,
  snombre VARCHAR(20)  NULL  ,
  estado INTEGER UNSIGNED  NULL  ,
  ciudadproveedor VARCHAR(20)  NULL    ,
PRIMARY KEY(snum));



CREATE TABLE pieza (
  pnum INTEGER UNSIGNED  NOT NULL  ,
  pnombre VARCHAR(20)  NULL  ,
  color VARCHAR(10)  NULL  ,
  peso INTEGER UNSIGNED  NULL  ,
  ciudadpieza VARCHAR(20)  NULL    ,
PRIMARY KEY(pnum));



CREATE TABLE envio (
  proveedor_snum VARCHAR(2)  NOT NULL  ,
  pieza_pnum INTEGER UNSIGNED  NOT NULL  ,
  cant INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(proveedor_snum, pieza_pnum)  ,
INDEX proveedor_has_pieza_FKIndex1(proveedor_snum)  ,
INDEX proveedor_has_pieza_FKIndex2(pieza_pnum),
  FOREIGN KEY(proveedor_snum)
    REFERENCES proveedor(snum)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(pieza_pnum)
    REFERENCES pieza(pnum)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




