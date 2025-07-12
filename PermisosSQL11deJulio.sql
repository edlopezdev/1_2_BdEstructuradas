-- ========================================
-- PARTE 1: Preparación del entorno de pruebas
-- ========================================

-- Crear una base de datos de prueba (si no existe)
IF DB_ID('BD_Permisos') IS NULL
    CREATE DATABASE BD_Permisos;
GO

-- Usar la base de datos creada
USE BD_Permisos;
GO

-- Crear una tabla simple para pruebas
IF OBJECT_ID('dbo.Productos') IS NOT NULL
    DROP TABLE dbo.Productos;

CREATE TABLE dbo.Productos (
    id INT PRIMARY KEY,
    nombre NVARCHAR(50),
    precio DECIMAL(10,2)
);

INSERT INTO dbo.Productos VALUES (1, 'Manzana', 1000), (2, 'Pera', 900);
GO

-- ========================================
-- PARTE 2: Crear login y usuario
-- ========================================

-- Eliminar si ya existen
IF EXISTS (SELECT * FROM sys.sql_logins WHERE name = 'usuario_demo')
    DROP LOGIN usuario_demo;
GO

CREATE LOGIN usuario_demo WITH PASSWORD = 'Clase123*';
GO

-- Crear el usuario en la base de datos asociada al login
CREATE USER usuario_demo FOR LOGIN usuario_demo;
GO

-- ========================================
-- PARTE 3: Asignar roles predefinidos
-- ========================================

-- Darle solo permiso de lectura (db_datareader)
EXEC sp_addrolemember 'db_datareader', 'usuario_demo';
GO

-- PROBAR: iniciar sesión con usuario_demo y hacer SELECT sobre dbo.Productos

-- ========================================
-- PARTE 4: Probar permisos explícitos
-- ========================================

-- Quitar de roles (opcional, para trabajar con permisos específicos)
EXEC sp_droprolemember 'db_datareader', 'usuario_demo';
GO

-- Denegar SELECT temporalmente
DENY SELECT ON dbo.Productos TO usuario_demo;
GO

-- Otorgar permiso SELECT y INSERT
GRANT SELECT, INSERT ON dbo.Productos TO usuario_demo;
GO

-- Intentar ejecutar SELECT e INSERT (como usuario_demo)

-- Denegar DELETE
DENY DELETE ON dbo.Productos TO usuario_demo;
GO

-- ========================================
-- PARTE 5: Verificar permisos
-- ========================================

-- Ver roles
EXEC sp_helprolemember 'db_datareader';

-- Ver permisos de usuario
SELECT *
FROM fn_my_permissions('dbo.Productos', 'OBJECT')
WHERE grantee_principal = 'usuario_demo';
GO

-- ========================================
-- PARTE 6: Ejercicios para estudiantes
-- ========================================

-- EJERCICIO 1:
-- Crear un nuevo login llamado 'usuario_ventas' con clave 'Ventas123*'
-- Crear un usuario en la base de datos asociado a ese login
-- Otorgarle permisos para: INSERT y SELECT sobre la tabla dbo.Productos

-- EJERCICIO 2:
-- Crear un usuario llamado 'auditor' (con login 'auditor', clave 'Audit2025*')
-- Otorgarle solo permisos de SELECT sobre todas las tablas existentes
-- (Tip: puedes usar el rol 'db_datareader')

-- EJERCICIO 3:
-- Crear un usuario 'admin_local' (sin login, solo a nivel de base de datos)
-- Darle permisos de DELETE sobre la tabla Productos

-- EJERCICIO 4:
-- Quitar el permiso DELETE al usuario 'admin_local' usando REVOKE
