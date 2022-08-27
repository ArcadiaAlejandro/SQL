--Funciones sql

-- PROCEDIMIENTOS											FUNCIONES
--														Nos retorna un unico valor


--Funcion 
CREATE FUNCTION ufcDevolverIDProducto
(
	--Parámetros
	@nombreProducto varchar(100)
)
returns varchar(5)

as
begin 

	declare @Resultado varchar (5)
	select @Resultado = tblProducto.IDProducto 
	from tblProducto
	where proNombre= @nombreProducto
	return @Resultado
end

----------------------------------------------------------
--Ejecucion 
DECLARE @Result varchar (5)
exec @Result = ufcDevolverIDProducto 'Pan fino'
PRINT @Result



