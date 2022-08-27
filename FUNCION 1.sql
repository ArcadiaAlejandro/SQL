--Funcion 
CREATE FUNCTION ufcDevuelveMontoTotal
(
	--Parámetros
	@Codigoventa varchar(9)
)
returns decimal(7,2)

as
begin 

	declare @Resultado decimal (7,2)
	select @Resultado = SUM(tblDetalleVenta.dvenCantidad * tblProducto.proPrecioVenta)
	from tblDetalleVenta
	INNER JOIN tblProducto on tblProducto.IDProducto= tblDetalleVenta.IDProducto
	where IDVenta = @Codigoventa
	return @Resultado
end
----------------------------------------------------------
--Ejecucion
DECLARE @Result DECIMAL (7,2)
exec @Result = ufcDevuelveMontoTotal '001-00997'
PRINT @Result