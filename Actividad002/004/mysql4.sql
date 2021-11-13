CREATE TABLE positions (
  posnumber INTEGER UNSIGNED  NOT NULL  ,
  posname VARCHAR(100)  NULL    ,
PRIMARY KEY(posnumber));



CREATE TABLE departament (
  dnumber INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  dname VARCHAR(20)  NULL  ,
  mgrstartdate DATE  NULL  ,
  mgrssn INTEGER(50) UNSIGNED  NULL    ,
PRIMARY KEY(dnumber));



CREATE TABLE employe (
  ssn INTEGER(50) UNSIGNED  NOT NULL  ,
  superssn INTEGER(50) UNSIGNED  NULL  ,
  departament_dnumber INTEGER UNSIGNED  NOT NULL  ,
  fname VARCHAR(20)  NULL  ,
  lname VARCHAR(35)  NULL  ,
  bdate DATE  NULL  ,
  positions_posnumber INTEGER UNSIGNED  NOT NULL  ,
  address VARCHAR(100)  NULL  ,
  sex VARCHAR(2)  NULL  ,
  salary DECIMAL  NULL    ,
PRIMARY KEY(ssn)  ,
INDEX employe_FKIndex1(departament_dnumber)  ,
INDEX employe_FKIndex2(positions_posnumber),
  FOREIGN KEY(departament_dnumber)
    REFERENCES departament(dnumber)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(positions_posnumber)
    REFERENCES positions(posnumber)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




