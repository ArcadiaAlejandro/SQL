USE MASTER
GO

CREATE DATABASE DB_Aerolinea1
GO

USE DB_Aerolinea1

CREATE TABLE TBL_Tripulantes(
Dni_Tripulantes VARCHAR(15) PRIMARY KEY,
Nombre_Tripulantes VARCHAR(40) NOT NULL,
AP_MATERNO_Tripulantes VARCHAR(40) ,
AP_PATERNO_Tripulantes VARCHAR(40) NOT NULL,
Telefono_Tripulantes VARCHAR(40) NOT NULL,
Email_Tripulantes VARCHAR(100) NOT NULL,
Tipo_Sangre_Tripulantes VARCHAR(5) NOT NULL,
)

CREATE TABLE TBL_Pasajero(
Codigo_Pasajero VARCHAR(15) PRIMARY KEY,
Nombre_Pasajero VARCHAR(40) NOT NULL,
AP_MATERNO_Pasajero VARCHAR(40) ,
AP_PATERNO_Pasajero VARCHAR(40) NOT NULL,
Telefono_Pasajero VARCHAR(40) NOT NULL,
Email_Pasajero VARCHAR(100) NOT NULL,
Nacionalidad_Pasajero VARCHAR(100) NOT NULL,
)


CREATE TABLE TBL_Aeropuertos(
Codigo_Aeropuertos VARCHAR(15) PRIMARY KEY,
Nombre_Aeropuertos VARCHAR(40) NOT NULL,
lugar_Aeropuertos VARCHAR(40) NOT NULL,
)

CREATE TABLE TBL_Aviones(
Matricula_Aviones VARCHAR(15) PRIMARY KEY,
Marca_Aviones VARCHAR(40) NOT NULL,
Modelo_Aviones VARCHAR(40) NOT NULL,
Cantidad_pasajeros_Aviones INT NOT NULL,
)


CREATE TABLE TBL_Vuelos (
Codigo_Vuelos varchar(15) PRIMARY KEY,
Precio_Vuelos MONEY NOT NULL,
Fecha_Vuelos DATE NOT NULL,
Hora_Vuelos  TIME NOT NULL,
ID_Vuelo_Agencia_O VARCHAR(15) NOT NULL,
ID_Vuelo_Agencia_L VARCHAR(15) NOT NULL,
Matricula_Aviones VARCHAR(15) NOT NULL,
FOREIGN KEY(ID_Vuelo_Agencia_O) REFERENCES TBL_Aeropuertos(Codigo_Aeropuertos),
FOREIGN KEY(ID_Vuelo_Agencia_L) REFERENCES TBL_Aeropuertos(Codigo_Aeropuertos),
FOREIGN KEY(Matricula_Aviones) REFERENCES TBL_Aviones(Matricula_Aviones)
)

CREATE TABLE TBL_ASIGNA(
Puesto_Tripulante_Asigna VARCHAR(50) NOT NULL,
Dni_Tripulantes VARCHAR(15) NOT NULL,
Codigo_Vuelos varchar(15) NOT NULL
FOREIGN KEY(Dni_Tripulantes) REFERENCES TBL_Tripulantes(Dni_Tripulantes),
FOREIGN KEY(Codigo_Vuelos) REFERENCES TBL_Vuelos(Codigo_Vuelos)
)

CREATE TABLE TBL_Viaja(
Asiento_Viaja VARCHAR(50) NOT NULL,
Peso_Equipaje_Viaja VARCHAR(15) NOT NULL,
Codigo_Pasajero VARCHAR(15) NOT NULL,
Codigo_Vuelos varchar(15) NOT NULL,
FOREIGN KEY(Codigo_Pasajero) REFERENCES TBL_Pasajero(Codigo_Pasajero),
FOREIGN KEY(Codigo_Vuelos) REFERENCES TBL_Vuelos(Codigo_Vuelos)
)
