-- ============================================
-- SCRIPT DE EJERCICIOS: USUARIOS, PERMISOS Y TRIGGERS
-- ============================================

-- 1. CREACIÓN DE BASE DE DATOS
CREATE DATABASE GestionBiblioteca;
GO

USE GestionBiblioteca;
GO

-- 2. CREACIÓN DE TABLAS
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(100),
    Correo NVARCHAR(100),
    Rol NVARCHAR(50)
);

CREATE TABLE Libros (
    LibroID INT PRIMARY KEY IDENTITY(1,1),
    Titulo NVARCHAR(100),
    Autor NVARCHAR(100),
    Stock INT
);

CREATE TABLE Prestamos (
    PrestamoID INT PRIMARY KEY IDENTITY(1,1),
    UsuarioID INT FOREIGN KEY REFERENCES Usuarios(UsuarioID),
    LibroID INT FOREIGN KEY REFERENCES Libros(LibroID),
    FechaPrestamo DATE,
    FechaDevolucion DATE
);

-- 3. INSERCIÓN DE DATOS
INSERT INTO Usuarios (Nombre, Correo, Rol)
VALUES 
('Ana Torres', 'ana@inacap.cl', 'Administrador'),
('Luis Rojas', 'luis@inacap.cl', 'Bibliotecario'),
('Camila Soto', 'camila@inacap.cl', 'Alumno');

INSERT INTO Libros (Titulo, Autor, Stock)
VALUES 
('Cien años de soledad', 'Gabriel García Márquez', 3),
('El Principito', 'Antoine de Saint-Exupéry', 5),
('1984', 'George Orwell', 2);

-- ============================================
-- ENUNCIADOS DE EJERCICIOS
-- ============================================

-- EJERCICIO 1:
-- Cree un usuario de SQL Server llamado 'usuarioAlumno' con la contraseña 'Inacap2025'.
--1 Crear el Login (usuario + contraseña)
CREATE LOGIN usuarioAlumno WITH PASSWORD='Inacap2025'
--2 crear el usuario (usuario)
CREATE USER usuarioAlumno FOR LOGIN usuarioAlumno
-- Otórguele permiso SOLO de lectura sobre las tablas 'Libros' y 'Usuarios'.
--GRANT + PERMISO + ON + TABLA + TO + USUARIO
GRANT SELECT ON Libros TO usuarioAlumno
GRANT SELECT ON Usuarios TO usuarioAlumno

-- EJERCICIO 2:
-- Cree un usuario de SQL Server llamado 'usuarioBibliotecario' con contraseña 'Inacap2025'.
CREATE LOGIN usuarioBibliotecario WITH PASSWORD='Inacap2025'
--2 crear el usuario (usuario)
CREATE USER usuarioBibliotecario FOR LOGIN usuarioBibliotecario
-- Otórguele permisos de lectura y escritura sobre la tabla 'Prestamos', pero no sobre las otras.
GRANT SELECT ON Prestamos TO usuarioBibliotecario
GRANT INSERT ON Prestamos TO usuarioBibliotecario
GRANT UPDATE ON Prestamos TO usuarioBibliotecario

-- EJERCICIO 3:
-- Cree un trigger que impida realizar un préstamo si el libro no tiene stock disponible.
-- En caso de que sí tenga stock, permita el préstamo y reste 1 al stock del libro correspondiente.
CREATE TRIGGER trg_ValidaPrestamos
ON Prestamos
INSTEAD OF INSERT
AS 
BEGIN 
	DECLARE @LibroID INT
	SELECT @LibroID=LibroID FROM inserted
	
	--IF y else
	IF EXISTS(SELECT * FROM Libros WHERE LibroID=@LibroID AND Stock>0)
	BEGIN
		--insertar el prestamo
		INSERT INTO Prestamos(UsuarioID,LibroID, FechaPrestamo, FechaDevolucion)
		SELECT i.UsuarioID,i.LibroID, i.FechaPrestamo, i.FechaDevolucion
		FROM inserted i;
		--Restar 1 al stock
		UPDATE Libros
		SET Stock=Stock-1
		WHERE @LibroID=LibroID
	END
	ELSE
	BEGIN
		PRINT ('No hay stock del libro')
	END


END



-- EJERCICIO 4:
-- Cree un trigger que audite cada vez que un libro es devuelto (es decir, cuando se actualiza
-- la columna FechaDevolucion). Esta auditoría debe guardar en una nueva tabla 'AuditoriaDevoluciones'
-- el ID del préstamo, la fecha en que se registró la devolución y el nombre del usuario que lo hizo.

-- SUGERENCIA: Cree la tabla AuditoriaDevoluciones con al menos: ID, PrestamoID, FechaRegistro, UsuarioSistema.
CREATE TABLE AuditoriaDevoluciones (
	ID INT PRIMARY KEY IDENTITY(1,1),
	PrestamoID INT, 
	FechaRegistro DATETIME, 
	UsuarioSistema VARCHAR(50)
)

CREATE TRIGGER tgr_AuditaDevolucion
ON Prestamos
AFTER UPDATE
AS
BEGIN
	INSERT INTO AuditoriaDevoluciones (PrestamoID, FechaRegistro, UsuarioSistema)
	SELECT i.PrestamoID, GETDATE(), SYSTEM_USER
	FROM inserted i;
END

-- EJERCICIO 5:
-- Revocar a 'usuarioAlumno' el permiso de lectura sobre la tabla 'Usuarios'.


GRANT => Otorgar
DENY => denegar
REVOKE => quitar cuando ya tenia grant
GRANT SELECT ON Usuarios TO usuarioAlumno

REVOKE SELECT ON Usuarios To usuarioAlumno
