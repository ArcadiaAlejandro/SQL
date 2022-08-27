USE master --base de
GO

CREATE DATABASE DB_Practica

Go
USE DB_Practica

CREATE TABLE TBL_Estudiante(
ID_Estudiante VARCHAR(8) PRIMARY KEY,
Estudiante_nombre VARCHAR(50) NOT NULL,
Estudiante_AP_Materno VARCHAR(40) NOT NULL,
Estudiante_AP_Paterno VARCHAR(40),
Estudiante_Telefono VARCHAR(15) NOT NULL,
)

ALTER TABLE TBL_Estudiante
ADD Estudiante VARCHAR (120)


ALTER TABLE TBL_Estudiante
ADD Estudiante_Direccion VARCHAR (20)

ALTER TABLE TBL_Estudiante
ALTER COLUMN Estudiante_Direccion VARCHAR(200)

ALTER TABLE TBL_Estudiante
ALTER COLUMN Estudiante_Telefono INT

ALTER TABLE TBL_Estudiante
DROP COLUMN Estudiante_Telefono

ALTER TABLE TBL_Estudiante
DROP COLUMN Estudiante

DROP TABLE TBL_Estudiante

USE MASTER
GO
DROP DATABASE DB_Practica
GO
