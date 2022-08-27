CREATE DATABASE BDEmpleados
GO

USE BDEmpleados
GO

CREATE TABLE tblCategoria(
	IDCategoria VARCHAR(1) PRIMARY KEY,
	catNombre VARCHAR(50) NOT NULL,
	catSueldo DECIMAL(9, 2) NOT NULL)

CREATE TABLE tblOficina(
	IDOficina VARCHAR(3) PRIMARY KEY,
	ofiNombre VARCHAR(50) NOT NULL)

CREATE TABLE tblEmpleado(
	IDEmpleado VARCHAR(4) PRIMARY KEY,
	empApPaterno VARCHAR(50) NULL,
	empApMaterno VARCHAR(50) NULL,
	empNombres VARCHAR(50) NULL,
	empSexo BIT NULL,
	empEstadoCivil NCHAR(1) NULL,
	empFechaIngreso SMALLDATETIME NULL,
	empHorasSemanales INT NULL,
	IDOficina VARCHAR(3) NULL,
	IDCategoria VARCHAR(1) NULL,
	FOREIGN KEY (IDOficina) REFERENCES tblOficina(IDOficina),
	FOREIGN KEY (IDCategoria) REFERENCES tblCategoria(IDCategoria))

INSERT INTO tblCategoria VALUES
('A','Jefe',5000)
INSERT INTO tblCategoria VALUES
('B','Profesional',3000)
INSERT INTO tblCategoria VALUES
('C','Técnico',1500)
INSERT INTO tblCategoria VALUES
('D','Asistente',1000)
INSERT INTO tblCategoria VALUES
('E','Auxiliar',900)

INSERT INTO tblOficina VALUES
('D01', 'Gerencia General')
INSERT INTO tblOficina VALUES
('D02', 'Oficina de Contabilidad y Finanzas')
INSERT INTO tblOficina VALUES
('D03', 'Oficina de Logística')
INSERT INTO tblOficina VALUES
('D04', 'Oficina de Planeamiento Corporativo')

INSERT INTO tblEmpleado VALUES
('E170','ZANABRIA','PERALTA','EDITH',0,'S','2013-04-27',20,'D02','A')
INSERT INTO tblEmpleado VALUES
('E171','CANDIOTI','POVES','CARLOS',1,'C','2013-01-25',24,'D03','D')
INSERT INTO tblEmpleado VALUES
('E172','BARDALES','ZAMUDIO','ANA',0,'C','2012-10-08',40,'D04','B')
INSERT INTO tblEmpleado VALUES
('E173','CORDOVA','ACOSTA','ALEX',1,'C','2011-10-23',48,'D01','A')
INSERT INTO tblEmpleado VALUES
('E174','PEREZ','APOLINARIO','LUIS',1,'V','2013-10-09',24,'D02','B')
INSERT INTO tblEmpleado VALUES
('E175','CASAS','SALVA','MONICA',0,'C','2013-09-23',48,'D04','C')
INSERT INTO tblEmpleado VALUES
('E176','AVILA','MARTÍNEZ','ROBERTO',1,'C','2013-08-25',40,'D02','D')
INSERT INTO tblEmpleado VALUES
('E177','DONAYRE','GAMARRA','ELVIRA',0,'S','2012-06-28',20,'D02','A')
INSERT INTO tblEmpleado VALUES
('E178','REVILLA','BELTRÁN','DELIA',0,'V','2012-02-22',24,'D01','B')
INSERT INTO tblEmpleado VALUES
('E179','MORALES','GUILLÉN','SUSAN',0,'S','2012-04-12',48,'D03','B')
INSERT INTO tblEmpleado VALUES
('E180','JAUREGUI','BASTIDAS','LUIS',1,'S','2012-08-11',24,'D02','C')
INSERT INTO tblEmpleado VALUES
('E181','SOVERO','VALERA','CARMEN',0,'C','2013-02-11',20,'D01','C')
INSERT INTO tblEmpleado VALUES
('E182','POMA','VICTORIA','ANGEL',1,'V','2011-10-23',40,'D04','D')
INSERT INTO tblEmpleado VALUES
('E183','CORDOVA','GUTARRA','VALERY',0,'S','2013-09-14',24,'D03','A')
INSERT INTO tblEmpleado VALUES
('E184','SANTIAGO','SANCHEZ','MARIA',0,'C','2012-07-11',40,'D03','A')
INSERT INTO tblEmpleado VALUES
('E185','RAMIREZ','QUINTANILLA','MIGUEL',1,'V','2011-10-08',20,'D04','D')
