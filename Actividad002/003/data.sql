INSERT INTO proveedor (snum,snombre,estado,ciudadproveedor) VALUES ('S1','Salazar',20,'londres');
INSERT INTO proveedor (snum,snombre,estado,ciudadproveedor) VALUES ('S2','Jaimes',10,'Paris');
INSERT INTO proveedor (snum,snombre,estado,ciudadproveedor) VALUES ('S3','Bernal',30,'Paris');
INSERT INTO proveedor (snum,snombre,estado,ciudadproveedor) VALUES ('S4','Corona',40,'Londres');
INSERT INTO proveedor (snum,snombre,estado,ciudadproveedor) VALUES ('S5','Aldana',30,'Atenas');

INSERT INTO pieza (pnum,pnombre,color,peso,ciudadpieza) VALUES ('P1','Tuerca','verde',12,'Paris');
INSERT INTO pieza (pnum,pnombre,color,peso,ciudadpieza) VALUES ('P2','Perno','rojo',17,'Londres');
INSERT INTO pieza (pnum,pnombre,color,peso,ciudadpieza) VALUES ('P3','Birlo','azul',17,'Roma');
INSERT INTO pieza (pnum,pnombre,color,peso,ciudadpieza) VALUES ('P4','Birlo','rojo',14,'Londres');
INSERT INTO pieza (pnum,pnombre,color,peso,ciudadpieza) VALUES ('P5','Leva','azul',12,'Paris');
INSERT INTO pieza (pnum,pnombre,color,peso,ciudadpieza) VALUES ('P6','Engrane','rojo',19,'Paris');

INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S1','P1',300);
INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S1','P2',200);
INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S1','P3',400);
INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S1','P4',200);
INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S1','P5',100);
INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S1','P6',100);
INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S2','P1',300);
INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S2','P2',400);
INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S3','P2',200);
INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S4','P2',200);
INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S4','P4',200);
INSERT INTO envio (proveedor_snum, pieza_pnum,cant) VALUES ('S4','P5',400);