RESTORE DATABASE base_de_datos --restaura base de datos
   FROM DISK = 'c:\base_de_datos.BAK'
   WITH MOVE 'Northwind' TO 'c:\test\testdb.mdf',
   MOVE 'Northwind_log' TO 'c:\test\testdb.ldf'
GO


ALTER DATABASE Farmacia	
MODIFY FILE  
  (NAME = Farmacia_OLTP,   --nombre logico del archivo
   SIZE = 100,    --tamaño
   MAXSIZE = 100)  --limite del tamaño


ALTER DATABASE Farmacia  --modifica el tamaño de la base de datos
MODIFY FILE  
  (NAME = Farmacia_OLTP_log,  --nombre logico del archivo
   SIZE = 100,  
   MAXSIZE = 100)  
   
-- Agrega un segundo archivo de base de datos para la BD

ALTER DATABASE Farmacia  
ADD FILE  
( NAME = Farmacia1,  
  FILENAME = 'C:\backup\Primario\Farmacia1.ndf', --en la ruta
  SIZE = 2,  
  MAXSIZE = 10,  
  FILEGROWTH = 2) --iremento de crecimiento automático del archivo 

--Reduce a base de datos, para ahorrar espacio en disco
  DBCC SHRINKDATABASE (Farmacia)  
  
--Separa la base de datos ial. Apuntando a la base de datos master
EXEC sp_detach_db 'Farmacia'  
