USE master
GO 
 
CREATE DATABASE DB_PRODUCTO2 
GO 
 
USE DB_PRODUCTO2
 
CREATE TABLE TBL_CARRERA(
Carrera_Codigo VARCHAR (50) PRIMARY KEY,
Nombre_Codigo VARCHAR(100) NOT NULL,
Duracion_Codigo TIME NOT NULL
)

CREATE TABLE TBL_Cursos(
Codigo_Cursos VARCHAR (50) PRIMARY KEY,
Nombre_Cursos VARCHAR (100) NOT NULL,
Electivo_Cursos VARCHAR(80) NOT NULL,
Obligatorio_Cursos VARCHAR (80) NOT NULL,
Cant_Creditos_Cursos INT,
)

CREATE TABLE TBL_Especialidad(
Codigo_Especialidad VARCHAR (50) PRIMARY KEY,
Nombre_Especialidad VARCHAR (100) NOT NULL,
)

CREATE TABLE TBL_Profesor(
DNI_Profesor VARCHAR (50) PRIMARY KEY,
AP_Materno_Profesor VARCHAR (100) NOT NULL,
AP_Paterno_Profesor VARCHAR (100) NOT NULL,
Email_Profesor VARCHAR (100) NOT NULL ,
Teléfono_Profesor VARCHAR (100) NOT NULL ,
Codigo_Especialidad VARCHAR (50) NOT NULL ,
FOREIGN KEY(Codigo_Especialidad) REFERENCES TBL_Especialidad(Codigo_Especialidad),
)

CREATE TABLE TBL_Secciones(
Codigo_Secciones VARCHAR (50) PRIMARY KEY,
Nombre_Secciones VARCHAR (50) NOT NULL,
Codigo_Cursos VARCHAR (50) NOT NULL,
DNI_Profesor VARCHAR (50)  NOT NULL,
FOREIGN KEY(Codigo_Cursos) REFERENCES TBL_Cursos(Codigo_Cursos),
FOREIGN KEY(DNI_Profesor) REFERENCES TBL_Profesor(DNI_Profesor),
)

CREATE TABLE TBL_Alumno(
Codigo_Alumno VARCHAR (50) PRIMARY KEY,
AP_Materno_Alumno VARCHAR (50) NOT NULL,
AP_Paterno_Alumno VARCHAR (50) NOT NULL,
Sexo_Alumno VARCHAR (50) NOT NULL,
Fecha_Nacimiento_Alumno DATE NOT NULL,
Email_Alumno VARCHAR (100) NOT NULL,
Teléfono_Alumno VARCHAR (20) NOT NULL,
Carrera_Codigo VARCHAR (50) NOT NULL,
FOREIGN KEY(Carrera_Codigo) REFERENCES TBL_CARRERA(Carrera_Codigo),
)

CREATE TABLE TBL_Matricula(
Nota_1 INT NOT NULL,
Nota_2 INT NOT NULL,
Codigo_Alumno VARCHAR (50) NOT NULL,
Codigo_Secciones  VARCHAR (50) NOT NULL,
FOREIGN KEY(Codigo_Alumno) REFERENCES TBL_Alumno(Codigo_Alumno),
FOREIGN KEY(Codigo_Secciones) REFERENCES TBL_Secciones(Codigo_Secciones),
)



