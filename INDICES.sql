/*CREAMOS UN INDICE NO AGRUPADO*/
    CREATE NONCLUSTERED INDEX Orders_Customers_link --Con NOMBRE: Orders_Customers_link
    ON Orders(CustomerID) --En la tabla Orders, en la columna CustomerID
    WITH FILLFACTOR = 75 --Con un valor de 75 
    GO 
/*NOTA
	FILLFACTOR = ajusta el rendimiento y el almacenamiento de datos de 
	índice reservando el resto en cada página como espacio libre para el crecimiento futuro
*/

/*Crear índices agrupados y no agrupados para todas las referencias de clave
foránea a la tabla Products en la columna CategoryID & SupplierID */

    CREATE CLUSTERED INDEX Products_CategoryID_link ON Products(CategoryID) --Creamos un INDICE Agrupado
    CREATE NONCLUSTERED INDEX Products_SupplierID_link ON Products(SupplierID) --Creamos un INDICE NO Agrupado
GO
/*COMRPOBAMOS SU CREACION MEDIANTE COMANDOS*/
PRINT 'CREATED INDEXES:' --Mostramos los INDICES Creados
SELECT name 
FROM sysindexes
WHERE name IN ('Products_CategoryID_link', 'Products_SupplierID_link') --Ponemos los nombres de los indices
GO
