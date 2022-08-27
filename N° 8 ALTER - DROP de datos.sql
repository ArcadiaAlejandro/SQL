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

ALTER TABLE TBL_Estudiante --altera la tabla "TBL_Estudiante"
ADD Estudiante VARCHAR (120) --agregando en la tabla "Estudiante"


ALTER TABLE TBL_Estudiante
ADD Estudiante_Direccion VARCHAR (20)

ALTER TABLE TBL_Estudiante 
ALTER COLUMN Estudiante_Direccion VARCHAR(200) --altera la columna ya creada

ALTER TABLE TBL_Estudiante
ALTER COLUMN Estudiante_Telefono INT

ALTER TABLE TBL_Estudiante
DROP COLUMN Estudiante_Telefono --elimina la columna "Estudiante_Telefono" de la tabla "TBL_Estudiante"

ALTER TABLE TBL_Estudiante
DROP COLUMN Estudiante  --elimina la columna "Estudiante" de la tabla "TBL_Estudiante"

DROP TABLE TBL_Estudiante  --elimina la tabla "TBL_Estudiante"

USE MASTER
GO
DROP DATABASE DB_Practica  --elimina la database "DB_Practica"
GO
