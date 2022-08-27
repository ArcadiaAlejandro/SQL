
----------------------------------------------------------
--Ejecucion 
DECLARE @Result varchar (5)
exec @Result = ufcDevolverIDProducto 'Pan fino'
PRINT @Result

----------------------------------------------------------
--Funcion 
CREATE FUNCTION ufcDevolverIDProducto
(
	--Parámetros que mandamos
	@nombreProducto varchar(100)
)
returns varchar(5)

as
begin 
	
	declare @Resultado varchar (5)
	select @Resultado = tblProducto.IDProducto 
	from tblProducto
	--unimos el parametro con lo que nos pide
	where proNombre= @nombreProducto
	return @Resultado
end

-------------------------------------------

CREATE FUNCTION ufcDevolverRUC
(
	@NombreProveedor VARCHAR (100)
)
RETURNS VARCHAR (11)

AS
BEGIN 
		DECLARE @Result_RUC VARCHAR (11)
		SELECT @Result_RUC = tblProveedor.RUC 
		FROM tblProveedor
		WHERE tblProveedor.provNombre = @NombreProveedor
		RETURN @Result_RUC
END

----------------------------------------------------
CREATE FUNCTION ufcDevolverCategoria
(
	@NombreCategoria VARCHAR (40)
)
RETURNS VARCHAR (5)

AS
	BEGIN 
		DECLARE @Result_IDCategoria VARCHAR (5)
		SELECT @Result_IDCategoria = IDCategoria
		FROM tblCategoria
		WHERE catNombre = @NombreCategoria
		RETURN @Result_IDCategoria
	END
----------------------------------------------------
CREATE FUNCTION ufcGenerarIDProducto
(

)
RETURNS VARCHAR(5)

AS
	BEGIN
			DECLARE @Nuevo_Codigo VARCHAR(5)
			DECLARE @Conteo INT
			SELECT @Conteo = COUNT(*) 
			FROM tblProducto
			IF(@Conteo = 0)
				SET @Nuevo_Codigo = 'P0001'
			ELSE 
				BEGIN
						SET @Nuevo_Codigo = CONVERT(varchar,@Conteo + 1) ---70 + 1
						SET @Nuevo_Codigo = '000'+ @Nuevo_Codigo		----0071
						SET @Nuevo_Codigo = RIGHT (@Nuevo_Codigo,4)		----CUENTA DESDE LA DERECHA A LA IZQUIERDA LOS ESPACIOS
						SET @Nuevo_Codigo = 'P' + @Nuevo_Codigo			----CONTACTENAR P
				END

			RETURN @Nuevo_Codigo
	END
---------------------------------------------------------------
SELECT * FROM tblProducto
SELECT * FROM tblProveedor
SELECT * FROM tblCategoria

EXEC usp_Registrar_Ingreso 'INKA COLA', 5.00, 24,'Makro Mayorista', 'Bebidas'
EXEC usp_Registrar_Ingreso 'Sirope de regaliz', 20.00, 10,'Makro Mayorista', 'Condimentos'

--------------------------------------------------------------
ALTER PROCEDURE usp_Registrar_Ingreso
(
	@Nombre_Producto VARCHAR (100),
	@Precio DECIMAL(7,2),
	@Stock_Ingresado INT,
	@Nombre_Proveedor VARCHAR (100),
	@Nombre_Categoria VARCHAR (40)
)
AS 
	BEGIN
			DECLARE @Aux_IDPRODUCTO VARCHAR(5)
			EXEC @Aux_IDPRODUCTO = ufcDevolverIDProducto @Nombre_Producto

			IF (@Aux_IDPRODUCTO IS NULL)
			BEGIN
					DECLARE @Aux_Nuevo_codigo varchar (5)
					EXEC @Aux_Nuevo_codigo = ufcGenerarIDProducto

					DECLARE @Aux_RUC varchar (11)
					EXEC @Aux_RUC = ufcDevolverRUC @Nombre_Proveedor

					DECLARE @Aux_Categoria varchar (4)
					EXEC @Aux_Categoria = ufcDevolverCategoria @Nombre_Categoria
					

					INSERT INTO tblProducto
					VALUES (@Aux_Nuevo_codigo, @Nombre_Producto, @Precio, @Stock_Ingresado, @Aux_RUC, @Aux_Categoria)
			END
				ELSE
					BEGIN 
							UPDATE tblProducto
							SET proPrecioVenta = @Precio, 
							proStock = proStock + @Stock_Ingresado
							WHERE IDProducto =	@Aux_IDPRODUCTO
					END
	END

