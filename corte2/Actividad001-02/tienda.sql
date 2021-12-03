DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda;
USE tienda;


CREATE TABLE fabricante (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE productos (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL,
  fabricante_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (fabricante_id) REFERENCES fabricante(id)
);

INSERT INTO fabricante (nombre) VALUES ('Apple');
INSERT INTO fabricante (nombre) VALUES ('Samsung');
INSERT INTO fabricante (nombre) VALUES ('Sony');
INSERT INTO fabricante (nombre) VALUES ('LG');
INSERT INTO fabricante (nombre) VALUES ('Motorola');
INSERT INTO fabricante (nombre) VALUES ('Huawei');
INSERT INTO fabricante (nombre) VALUES ('Xiaomi');

INSERT INTO productos ( nombre, precio, stock, fabricante_id) VALUES ('iPhone X', 932.99, 10, 1);
INSERT INTO productos ( nombre, precio, stock, fabricante_id) VALUES ('iPhone XS', 343.99, 10, 1);
INSERT INTO productos ( nombre, precio, stock, fabricante_id) VALUES ('Samsung Galaxy S10', 514.99, 10, 2);
INSERT INTO productos ( nombre, precio, stock, fabricante_id) VALUES ('Sony Xperia XZ', 543.99, 10, 3);
INSERT INTO productos ( nombre, precio, stock, fabricante_id) VALUES ('LG G6', 856.99, 10, 4);
INSERT INTO productos ( nombre, precio, stock, fabricante_id) VALUES ('Motorola G8', 875.99, 10, 5);
INSERT INTO productos ( nombre, precio, stock, fabricante_id) VALUES ('Huawei Mate 20', 943.99, 10, 6);
INSERT INTO productos ( nombre, precio, stock, fabricante_id) VALUES ('Xiaomi Mi 9', 968.99, 10, 7);