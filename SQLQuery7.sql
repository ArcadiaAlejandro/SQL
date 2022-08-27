USE MASTER
GO

CREATE DATABASE DB_Producto_Academico
GO

USE DB_Producto_Academico

CREATE TABLE TBL_Bus(
Placa VARCHAR(6) PRIMARY KEY, 
bus_Modelo VARCHAR(30) NOT NULL,
bus_NroPisos INT NOT NULL, 
bus_Capacidad INT NOT NULL)

CREATE TABLE TBL_Chofer(
DNI VARCHAR(10) PRIMARY KEY, 
chofer_Nombre VARCHAR(50) NOT NULL, 
chofer_AP_Paterno VARCHAR(35) NOT NULL, 
chofer_AM_Materno VARCHAR(35), 
chofer_Fecha_Nacimiento DATE NOT NULL, 
chofer_Telefono Varchar(15), 
chofer_Email VARCHAR(100)
)

CREATE TABLE TBL_Agencia (
ID_Agencia VARCHAR(4) PRIMARY KEY,
Nombre_Agencia VARCHAR(30) NOT NULL,
Direccion_Agencia VARCHAR(180) NOT NULL,
Distrito_Agencia VARCHAR(50) NOT NULL, 
Provincia_Agencia VARCHAR(50) NOT NULL, 
Pais_Agencia VARCHAR(50) NOT NULL
)

CREATE TABLE TBL_Supervisor (
Codigo_Supervisor VARCHAR(4) PRIMARY KEY,
Nombre_Supervisor VARCHAR(30) NOT NULL,
Supervisor_AP_Paterno VARCHAR(35) NOT NULL, 
Supervisor_AM_Materno VARCHAR(35), 
Telefono_Supervisor VARCHAR(50) NOT NULL

)


CREATE TABLE TBL_Ruta(
ID_Ruta VARCHAR(6) PRIMARY KEY,
Distancia_Ruta INT NOT NULL ,
ID_Ruta_Agencia_O VARCHAR(4) NOT NULL , 
ID_Ruta_Agencia_D VARCHAR(4) NOT NULL,
FOREIGN KEY(ID_Ruta_Agencia_O) REFERENCES TBL_Agencia(ID_Agencia), 
FOREIGN KEY(ID_Ruta_Agencia_D) REFERENCES TBL_Agencia(ID_Agencia)
)

CREATE TABLE TBL_Viaje(
ID_Viaje VARCHAR(8) PRIMARY KEY,
Fecha_Viaje DATE NOT NULL, 
Hora_Salida_Viaje TIME NOT NULL,
Hora_LLegada_Viaje TIME NOT NULL, 
Placa VARCHAR(6) NOT NULL, 
ID_Ruta VARCHAR(6) NOT NULL,
ID_Agencia VARCHAR(4) NOT NULL,
Codigo_Supervisor VARCHAR(4) NOT NULL,
FOREIGN KEY(Placa) REFERENCES TBL_Bus(Placa),
FOREIGN KEY(ID_Ruta) REFERENCES TBL_Ruta(ID_Ruta),
FOREIGN KEY(ID_Agencia) REFERENCES TBL_Agencia(ID_Agencia),
FOREIGN KEY(Codigo_Supervisor) REFERENCES TBL_Supervisor(Codigo_Supervisor)
)

CREATE TABLE TBL_Conduce(
DNI VARCHAR(10) NOT NULL, 
ID_Viaje VARCHAR(8) NOT NULL, 
Conduce_Rol VARCHAR(30) NOT NULL,
FOREIGN KEY(DNI) REFERENCES TBL_Chofer(DNI),
FOREIGN KEY(ID_Viaje) REFERENCES TBL_Viaje(ID_Viaje)
)
