/*
LA EMPRESA INKAROKA necesita crear un procedimiento de almacenado 
que permita registrar una venta, este procedimiento
debe validar si el codigo del producto ingresado existe, 
sino se encuentra debera notificarlo, asi mismo, si el stock es 
mayor a la cantidad existente, debera notificarlo, pero en caso de que sea menor 
o igual debera actualizar el stock del producto
*/

ALTER FUNCTION ufnGenerarIDNuevaVenta
(

)
RETURNS VARCHAR(12)
AS
	BEGIN
		DECLARE @nuevo_ID VARCHAR(12)
		DECLARE @conteo INT
		SELECT @conteo= COUNT(*)
		FROM tblVentas
		IF(@conteo=0)
			SET @nuevo_ID='VNT-001'
		ELSE
			BEGIN
					SET @nuevo_ID = CONVERT(varchar, @conteo+1)
					SET @nuevo_ID = '00' + @nuevo_ID
					SET @nuevo_ID = 'VNT-'+ RIGHT(@nuevo_ID,3)
			END
		RETURN @nuevo_ID
	END

DECLARE @Aux_Nuevo_codigo varchar (12)
EXEC @Aux_Nuevo_codigo = ufnGenerarIDNuevaVenta
print @Aux_Nuevo_codigo

SELECT * FROM tblVentas


/*
LA EMPRESA INKAROKA necesita crear un procedimiento de almacenado 
que permita registrar una venta, este procedimiento
debe validar si el codigo del producto ingresado existe, 
sino se encuentra debera notificarlo, asi mismo, si el stock es 
mayor a la cantidad existente, debera notificarlo, pero en caso de que sea menor 
o igual debera actualizar el stock del producto
*/

ALTER PROCEDURE usp_Insertar_pedido
@id_pedido  varchar(12),
@id_producto varchar(12),
@cantidad int

AS
BEGIN
		DECLARE  @CONTAR int --Cuenta los resultados
		DECLARE @EXISTEN int --Existencia
		DECLARE @RESTA_CANTIDAD int --Resta la cantidad 

		SELECT @CONTAR = COUNT(tblVentas.IDVentas) 
		FROM tblVentas
		WHERE IDVentas = @id_pedido
		IF(@CONTAR<=0) --NO HAY RESULTADOS
				BEGIN
						SELECT @CONTAR = COUNT(tblProducto.IDProducto)
						FROM tblProducto
						WHERE IDProducto = @id_producto
						IF(@CONTAR>=1)--EXISTEN RESULTADOS
							BEGIN
								SELECT @EXISTEN= pdtStock 
								FROM tblProducto 
								WHERE IDProducto = @id_producto
								SET @RESTA_CANTIDAD = @EXISTEN - @cantidad --OBTENEMOS NUEVA CANTIDAD
										IF(@RESTA_CANTIDAD>=0) --STOCK SUFICIENTE
											BEGIN
													
													DECLARE @Aux_Nuevo_codigo varchar (12)
													EXEC @Aux_Nuevo_codigo = ufnGenerarIDNuevaVenta

													INSERT INTO tblVentas VALUES (@Aux_Nuevo_codigo, @id_pedido, @cantidad)
													UPDATE tblProducto set pdtStock=(@RESTA_CANTIDAD)
													WHERE IDProducto= @id_producto
											END
										ELSE
											BEGIN
													PRINT ('STOCK DEL PRODUCTO ES INSUFICIENTE PARA LA OPERACION')
											END
							END

							ELSE
								BEGIN
										PRINT('ESTE PRODUCTO NO EXISTE')
								END
				END

		ELSE
			BEGIN
					PRINT('YA EXISTE UN PEDIDO CON ESTE CODIGO')
			END

END

select * from tblProducto
select * from tblVentas
exec usp_Insertar_pedido 'Ped-00001','PROD-000001','15'
select * from tblVentas
select * from tblProducto

select * from tblPedido


Delete from tblVentas 
Where IDVentas= 'VNT-007'