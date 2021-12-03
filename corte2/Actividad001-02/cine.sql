DROP DATABASE IF EXISTS cine;
CREATE DATABASE IF NOT EXISTS cine;
USE cine;

CREATE TABLE cuentas (
    id_cuenta INT UNSIGNED NOT NULL AUTO_INCREMENT,
    saldo REAL UNSIGNED NOT NULL,
    PRIMARY KEY (id_cuenta)
    );

CREATE TABLE entradas (
id_butaca INT UNSIGNED NOT NULL AUTO_INCREMENT,
nif CHAR(9) NOT NULL,
PRIMARY KEY (id_butaca)
);

INSERT INTO cuentas (id_cuenta, saldo) VALUES (1, 20);
INSERT INTO cuentas (id_cuenta, saldo) VALUES (2, 10);