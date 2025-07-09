-- Parte 1: CREACIÓN DE BASE DE DATOS Y TABLAS

CREATE DATABASE EmpresaPedidosDB;
GO
USE EmpresaPedidosDB;
GO

-- Tabla de productos
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre NVARCHAR(100),
    stock INT,
    umbral_stock INT
);

-- Tabla de clientes
CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY,
    nombre NVARCHAR(100),
    correo NVARCHAR(100)
);

-- Tabla de pedidos
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha DATETIME,
    estado NVARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- Tabla de detalles del pedido
CREATE TABLE DetallePedidos (
    id_detalle INT PRIMARY KEY,
    id_pedido INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);

-- Inserciones de prueba
INSERT INTO Clientes VALUES (1, 'Juan Pérez', 'juan@ejemplo.com');
INSERT INTO Clientes VALUES (2, 'María López', 'maria@ejemplo.com');

INSERT INTO Productos VALUES (1, 'Teclado', 20, 5);
INSERT INTO Productos VALUES (2, 'Mouse', 50, 10);
INSERT INTO Productos VALUES (3, 'Monitor', 10, 2);

INSERT INTO Pedidos VALUES (1, 1, GETDATE(), 'Pendiente');
INSERT INTO Pedidos VALUES (2, 2, GETDATE(), 'Pendiente');

INSERT INTO DetallePedidos VALUES (1, 1, 1, 2);
INSERT INTO DetallePedidos VALUES (2, 1, 2, 1);
INSERT INTO DetallePedidos VALUES (3, 2, 3, 1);
