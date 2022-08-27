/* consultas */

SELECT tblEmpleado.IDEmpleado, tblEmpleado.empNombres
FROM tblEmpleado
WHERE tblEmpleado.empNombres LIKE 'M%' OR tblEmpleado.empNombres LIKE 'A%'
