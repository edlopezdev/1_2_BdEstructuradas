



-- Tabla para historial de estados
CREATE TABLE HistorialEstadoPedidos (
    id_historial INT IDENTITY PRIMARY KEY,
    id_pedido INT,
    estado_anterior NVARCHAR(50),
    estado_nuevo NVARCHAR(50),
    fecha_cambio DATETIME DEFAULT GETDATE()
);

-- Tabla de auditoría para Clientes
CREATE TABLE AuditoriaClientes (
    id_auditoria INT IDENTITY PRIMARY KEY,
    id_cliente INT,
    nombre NVARCHAR(100),
    correo NVARCHAR(100),
    fecha_insercion DATETIME DEFAULT GETDATE()
);

-- Trigger AFTER INSERT
CREATE TRIGGER trg_AuditarInsercionClientes
ON Clientes
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditoriaClientes (id_cliente, nombre, correo)
    SELECT id_cliente, nombre, correo
    FROM inserted;
END;
GO

-- Trigger INSTEAD OF para validar el stock al insertar
CREATE TRIGGER trg_ValidarStockInsert
ON Productos
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE stock < 0)
    BEGIN
        RAISERROR ('No se puede insertar un producto con stock negativo.', 16, 1);
    END
    ELSE
    BEGIN
        INSERT INTO Productos (id_producto, nombre, stock, umbral_stock)
        SELECT id_producto, nombre, stock, umbral_stock FROM inserted;
    END
END;
GO

-- Trigger INSTEAD OF para validar el stock al actualizar
CREATE TRIGGER trg_ValidarStockUpdate
ON Productos
INSTEAD OF UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE stock < 0)
    BEGIN
        RAISERROR ('No se puede actualizar un producto con stock negativo.', 16, 1);
    END
    ELSE
    BEGIN
        UPDATE p
        SET nombre = i.nombre,
            stock = i.stock,
            umbral_stock = i.umbral_stock
        FROM Productos p
        JOIN inserted i ON p.id_producto = i.id_producto;
    END
END;
GO

-- Trigger para cambiar estado del pedido a "Completado" si hay stock suficiente
CREATE TRIGGER trg_CompletarPedidoSiStock
ON DetallePedidos
AFTER INSERT
AS
BEGIN
    DECLARE @id_pedido INT;

    SELECT TOP 1 @id_pedido = id_pedido FROM inserted;

    IF NOT EXISTS (
        SELECT 1
        FROM DetallePedidos dp
        JOIN Productos p ON dp.id_producto = p.id_producto
        WHERE dp.id_pedido = @id_pedido AND p.stock < dp.cantidad
    )
    BEGIN
        UPDATE Pedidos
        SET estado = 'Completado'
        WHERE id_pedido = @id_pedido;
    END
END;
GO

-- Parte 2: TRIGGERS

-- Ejercicio 4: Registrar cambios de estado
CREATE TRIGGER trg_RegistrarCambioEstado
ON Pedidos
AFTER UPDATE
AS
BEGIN
    IF UPDATE(estado)
    BEGIN
        INSERT INTO HistorialEstadoPedidos (id_pedido, estado_anterior, estado_nuevo)
        SELECT i.id_pedido, d.estado, i.estado
        FROM inserted i
        JOIN deleted d ON i.id_pedido = d.id_pedido
        WHERE i.estado <> d.estado;
    END
END;
GO

-- Ejercicio 5: Actualizar stock después de confirmar pedido
CREATE TRIGGER trg_ActualizarStock
ON Pedidos
AFTER UPDATE
AS
BEGIN
    IF UPDATE(estado)
    BEGIN
        -- Solo aplica cuando cambia a "Confirmado"
        UPDATE p
        SET stock = stock - dp.cantidad
        FROM Productos p
        JOIN DetallePedidos dp ON dp.id_producto = p.id_producto
        JOIN inserted i ON i.id_pedido = dp.id_pedido
        JOIN deleted d ON d.id_pedido = i.id_pedido
        WHERE i.estado = 'Confirmado' AND d.estado <> 'Confirmado';
    END
END;
GO

-- Ejercicio 6: Notificación de stock bajo
CREATE TRIGGER trg_AlertaStockBajo
ON Productos
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted i WHERE i.stock < i.umbral_stock)
    BEGIN
        DECLARE @mensaje NVARCHAR(200);
        SELECT TOP 1 @mensaje = '¡ALERTA! Producto con stock bajo: ' + nombre
        FROM inserted WHERE stock < umbral_stock;
        RAISERROR (@mensaje, 16, 1);
    END
END;
GO
