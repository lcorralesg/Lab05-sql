CREATE PROCEDURE USP_InsertarEmpleado
@Apellidos nvarchar(50),
@Nombre nvarchar(50),
@cargo nvarchar(50),
@tratamiento nvarchar(50),
@fechaNacimiento date,
@fechaContratacion date,
@direccion nvarchar(50),
@ciudad nvarchar(50),
@region nvarchar(50),
@codigoPostal nvarchar(50),
@pais nvarchar(50),
@telefono nvarchar(50),
@extension nvarchar(50),
@notas ntext,
@jefe int,
@sueldoBasico decimal(18)
AS
BEGIN
INSERT INTO Empleados
VALUES ((SELECT MAX(IdEmpleado) + 1 FROM Empleados),
    @Apellidos,
    @Nombre,
    @cargo,
    @tratamiento,
    @fechaNacimiento,
    @fechaContratacion,
    @direccion,
    @ciudad,
    @region,
    @codigoPostal,
    @pais,
    @telefono,
    @extension,
    @notas,
    @jefe,
    @sueldoBasico);
END


CREATE PROCEDURE USP_ActualizarEmpleado
@idEmpleado int,
@Apellidos nvarchar(50),
@Nombre nvarchar(50),
@cargo nvarchar(50),
@tratamiento nvarchar(50),
@fechaNacimiento date,
@fechaContratacion date,
@direccion nvarchar(50),
@ciudad nvarchar(50),
@region nvarchar(50),
@codigoPostal nvarchar(50),
@pais nvarchar(50),
@telefono nvarchar(50),
@extension nvarchar(50),
@notas ntext,
@jefe int,
@sueldoBasico decimal(18)
AS
BEGIN
UPDATE Empleados
SET Apellidos = @Apellidos,
    Nombre = @Nombre,
    cargo = @cargo,
    Tratamiento = @tratamiento,
    FechaNacimiento = @fechaNacimiento,
    FechaContratacion = @fechaContratacion,
    direccion = @direccion,
    ciudad = @ciudad,
    region = @region,
    codPostal = @codigoPostal,
    pais = @pais,
    TelDomicilio = @telefono,
    Extension = @extension,
    notas = @notas,
    Jefe = @jefe,
    sueldoBasico = @sueldoBasico
    WHERE IdEmpleado = @idEmpleado;
END


CREATE PROCEDURE USP_EliminarEmpleado
@idEmpleado int
AS
BEGIN
DELETE FROM Empleados
WHERE IdEmpleado = @idEmpleado;
END;


CREATE PROCEDURE USP_ListarEmpleados
AS
BEGIN
SELECT
Apellidos,
Nombre,
Cargo,
Ciudad,
Region
FROM Empleados
END