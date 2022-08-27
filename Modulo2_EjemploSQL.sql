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