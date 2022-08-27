
/*consultas*/

SELECT tblProducto.IDProducto, tblProducto.proNombre, tblProducto.proStock,  tblProducto.proPrecioVenta,  tblProducto.IDCategoria,  tblCategoria.catNombre, tblProveedor.provNombre
from tblProducto 
INNER JOIN tblCategoria
ON tblProducto.IDCategoria = tblCategoria.IDCategoria
INNER JOIN tblProveedor
ON tblProducto.RUC = tblProveedor.RUC
where tblProducto.proStock < 15


-----------------------------------------------------------------------

SELECT DNI, cliNombres +', '+ cliApellidoPaterno + ''+ cliApellidoMaterno as nombrecompletocliente
from tblCliente

/* se desea visualizar el estado de ventas con los respectivos clientes */


DECLARE @Venta varchar(9)
SET @Venta = '001-00879'

SELECT  tblVenta.IDVenta, tblVenta.venFecha, tblCliente.DNI, 
tblCliente.cliNombres +', '+ tblCliente.cliApellidoMaterno +' '+ tblCliente.cliApellidoPaterno as NombreCliente,
tblEmpleado.empNombres +',' + tblEmpleado.empApellidoMaterno +''+  tblEmpleado.empApellidoPaterno AS Vendedor,
tblProducto.proNombre, tblDetalleVenta.dvenCantidad, tblProducto.proPrecioVenta,
tblProducto.proPrecioVenta * tblDetalleVenta.dvenCantidad as SubTotal

FROM tblVenta
INNER JOIN tblCliente on tblVenta.DNI = tblCliente.DNI
INNER JOIN  tblEmpleado on tblVenta.IDEmpleado = tblEmpleado.IDEmpleado
INNER JOIN tblDetalleVenta on tblVenta.IDVenta = tblDetalleVenta.IDVenta
INNER JOIN tblProducto on tblDetalleVenta.IDProducto = tblProducto.IDProducto
where tblVenta.IDVenta = @Venta