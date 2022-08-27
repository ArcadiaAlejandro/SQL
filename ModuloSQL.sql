ALTER PROCEDURE PROD_Seleccionar_Cliente --Se crea 1 sola vez 
 --ALTER (Nos ayuda a modificar)
--Aqui van los parametros de entrada
@sexo varchar (9),
@distrito varchar (50)

as
BEGIN --Inicio del encapsulamiento {

SELECT DNI, cliApellidoPaterno,cliApellidoMaterno, tblCliente.cliNombres, cliDistrito, cliSexo
FROM tblCliente
Where cliSexo = @sexo and
cliDistrito = @distrito
END /*fin del encapsulamiento }*/


-------------------------------------
 --Ejecuta el procedimiento
 EXEC PROD_Seleccionar_Cliente 'Masculino','Chilca'
---------Continuar con otro codigo 

CREATE PROCEDURE PROCEDIMIENTO_ActualizarDireccion

@DNI VARCHAR(8),
@NuevaDireccion VARCHAR(180)

AS

BEGIN
		SELECT DNI, cliApellidoPaterno,cliApellidoMaterno,cliNombres, cliDireccion
		from tblCliente
		where DNI= @DNI

		UPDATE tblCliente
		set cliDireccion =@NuevaDireccion
		where DNI = @DNI	

		SELECT DNI, cliApellidoPaterno,cliApellidoMaterno,cliNombres, cliDireccion
		from tblCliente
		where DNI= @DNI

END


exec PROCEDIMIENTO_ActualizarDireccion '09935776','Av Esperanza Eterna N° 159'














