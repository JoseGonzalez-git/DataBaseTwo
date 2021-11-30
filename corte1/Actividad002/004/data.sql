INSERT INTO positions (posnumber, posname) VALUES (1, 'President - CEO');
INSERT INTO positions (posnumber, posname) VALUES (2, 'Vice President of Marketing');
INSERT INTO positions (posnumber, posname) VALUES (3, 'Vice President of Finance - CFO');
INSERT INTO positions (posnumber, posname) VALUES (4, 'Treasurer');
INSERT INTO positions (posnumber, posname) VALUES (5, 'Controller');
INSERT INTO positions (posnumber, posname) VALUES (6, 'Cash Manager');
INSERT INTO positions (posnumber, posname) VALUES (7, 'Credit Manager');
INSERT INTO positions (posnumber, posname) VALUES (8, 'Tax Manager');
INSERT INTO positions (posnumber, posname) VALUES (9, 'Cost Accounting Manager');

INSERT INTO departament (dnumber, dname, mgrstartdate, mgrssn) VALUES (5, 'Finance', '1988-05-22', 333445555);
INSERT INTO departament (dnumber, dname, mgrstartdate, mgrssn) VALUES (4, 'Marketing', '1995-01-01', 987654321);
INSERT INTO departament (dnumber, dname, mgrstartdate, mgrssn) VALUES (1, 'Finance', '1981-06-19', 888665555);

INSERT INTO employe (ssn, superssn, departament_dnumber,fname,lname,bdate,positions_posnumber, address, sex, salary) 
VALUES (888665555, NULL, 1,'James','Borg','1937-10-11',1,'450 Stone, Houston,TX','M',55000);

INSERT INTO employe (ssn, superssn, departament_dnumber,fname,lname,bdate,positions_posnumber, address, sex, salary) 
VALUES (333445555, 888665555, 1,'Franklin','Wong','1955-08-12',3,'638 Voss, Houston,TX','M',40000);

INSERT INTO employe (ssn, superssn, departament_dnumber,fname,lname,bdate,positions_posnumber, address, sex, salary) 
VALUES (123456789, 333445555, 5,'Jhon','Smith','1965-09-11',4,'731 Fondren, Houston,TX','M',30000);

INSERT INTO employe (ssn, superssn, departament_dnumber,fname,lname,bdate,positions_posnumber, address, sex, salary) 
VALUES (987654321, 888665555, 1,'Jennifer','Wallace','1941-06-20',2,'291 Berry, Bellaire,TX','F',43000);

INSERT INTO employe (ssn, superssn, departament_dnumber,fname,lname,bdate,positions_posnumber, address, sex, salary) 
VALUES (999887777, 123456789, 5,'Alicia','Zelaya','1968-07-18',6,'3321 Castle, Spring,TX','F',25000);

INSERT INTO employe (ssn, superssn, departament_dnumber,fname,lname,bdate,positions_posnumber, address, sex, salary) 
VALUES (666884444, 123456789, 5,'Ramesh','Narayan','1962-09-15',7,'975 Fire Oak, Humble,TX','M',38000);

INSERT INTO employe (ssn, superssn, departament_dnumber,fname,lname,bdate,positions_posnumber, address, sex, salary) 
VALUES (453453453, 333445555, 5,'Joyce','English','1972-07-31',5,'5631 Rice, Houston,TX','F',25000);

INSERT INTO employe (ssn, superssn, departament_dnumber,fname,lname,bdate,positions_posnumber, address, sex, salary) 
VALUES (987987987, 987654321, 5,'Ahmad','Jabbar','1969-03-29',8,'980 Dallas, Houston,TX','F',41000);