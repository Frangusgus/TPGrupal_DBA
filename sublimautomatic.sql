CREATE DATABASE Sublimautomatic;
USE Sublimautomatic;

-- Tabla Cliente
CREATE TABLE Cliente (
  idCliente INT(3) PRIMARY KEY,
  nombre VARCHAR(25) NOT NULL,
  apellido VARCHAR(25) NOT NULL,
  direccion VARCHAR(50),
  telefono INT(14)
);

-- Tabla Pedidos
CREATE TABLE Pedidos (
  idPedido INT(3) PRIMARY KEY,
  idCliente INT(3) NOT NULL,
  fechaEntrega DATE NOT NULL,
  estado ENUM('pendiente', 'aceptado', 'entregado') NOT NULL,
  FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabla Producto
CREATE TABLE Producto (
  idProducto INT(3) PRIMARY KEY,
  nombre VARCHAR(25) NOT NULL,
  precioVenta DECIMAL(8,2),
  descripcion VARCHAR(70),
  cantidad INT(3)
);

-- Tabla Insumo
CREATE TABLE Insumo (
  idInsumo INT(3) PRIMARY KEY,
  nombreInsumo VARCHAR(20) NOT NULL,
  cantidad INT(3),
  precioUnitario DECIMAL(8,2)
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
  idProveedor INT(3) PRIMARY KEY,
  nombreProveedor VARCHAR(25) NOT NULL,
  telefono INT(14),
  direccion VARCHAR(50),
  email VARCHAR(30)
);

-- Tabla intermedia PedidoProducto
CREATE TABLE PedidoProducto (
  idPedido INT(3) NOT NULL,
  idProducto INT(3) NOT NULL,
  cantidad INT(3) NOT NULL,
  PRIMARY KEY (idPedido, idProducto),
  FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido),
  FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);

-- Tabla intermedia ProductoInsumo
CREATE TABLE ProductoInsumo (
  idProducto INT(3) NOT NULL,
  idInsumo INT(3) NOT NULL,
  cantidad INT(3) NOT NULL,
  PRIMARY KEY (idProducto, idInsumo),
  FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
  FOREIGN KEY (idInsumo) REFERENCES Insumo(idInsumo)
);

-- Tabla intermedia InsumoProveedor
CREATE TABLE InsumoProveedor (
  idInsumo INT(3) NOT NULL,
  idProveedor INT(3) NOT NULL,
  cantidad INT(3) NOT NULL,
  PRIMARY KEY (idInsumo, idProveedor),
  FOREIGN KEY (idInsumo) REFERENCES Insumo(idInsumo),
  FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)
);

-- Insertar datos de clientes a la tabla clientes
INSERT INTO Cliente (idCliente, nombre, apellido, telefono, direccion) VALUES 
(1, 'Facundo', 'Palmariciotti', '1523025534', 'Av. Entre Rios 745 6A'),
(2, 'Leandro Javier', 'Fernández', '1522224444', 'Av Cordoba 2886 PB'),
(3, 'Rosana', 'Sosa', '1534042502', 'Vélez Sársfield 680 (Avellaneda)'),
(4, 'Iván', 'Bonanata', '1534042502', 'Deán Funes 2225 (Merlo)'),
(5, 'Kenneth', 'Loreto', '154893707', 'Av. Las Heras 2840'),
(6, 'Gian', 'Malaspina', '153592088', 'Lavalle 540 2C'),
(7, 'Maria Paz', 'Short', '135039237', 'Islas Malvinas 2681 Timbre 2 (San Andrés)'),
(8, 'Mauro', 'Di Gallo', '1523690874', 'Av Brasil 1021 PB')
;

-- Insertar datos de productos a la tabla productos
INSERT INTO Producto (idProducto, nombre, precioVenta, descripcion, cantidad) VALUES
(1, 'Remera Rosana', 5500, 'Remera Gris con foto de perrito', 1 ),
(2, 'Taza Boca Juniors', 3500, 'Taza de plástico con logo de Boca Juniors', 10),
(3, 'Stickers Facundo', 7000, 'Stickers con ilustraciones de Facundo', 50),
(4, 'Remera Back to the Future', 7500, 'Remera blanca con motivo película Back to the Future', 5),
(5, 'Taza Cumple Bona', 8000, 'Taza para cumpleaños de cliente', 5),
(6, 'Buzo River Campeón', 5000, 'Buzo negro con vinilo de River campeón', 2)
;

-- Insertar datos de pedidos a la tabla pedidos
INSERT INTO Pedidos (idPedido, idCliente, fechaEntrega, estado) VALUES
(6, 5, '2025-06-27', 'En preparación'),
(4, 7, '2025-06-24', 'Vendido'),
(1, 3, '2025-07-07', 'En preparación'),
(3, 1, '2025-06-29', 'En preparación'),
(5, 4, '2025-05-15', 'Vendido'),
(2, 6, '2025-07-08', 'En preparación')
;

-- Insertar datos de proveedores a la tabla proveedores
INSERT INTO Proveedor (idProveedor, nombreProveedor, telefono, email, direccion) VALUES
(1, 'DANITEX', '1123991098', 'daniteximportador@gmail.com', 'Tucumán 2980'),
(2, 'DeTintas', '1139512690', 'impo@detintas.com.ar', 'Tucumán 2086'),
(3, 'Once Tex', '1168201924', 'oncetex@gmail.com', 'Junín 495')
;

-- Insertar datos de insumos a la tabla insumos
INSERT INTO Insumo (idInsumo, nombreInsumo, cantidad, precioUnitario) VALUES
(1, 'Tinta', 2, 5000),
(2, 'Resma A4 Sublimable', 4, 3500),
(3, 'Rollo Vinilo Rojo', 3, 7000),
(4, 'Rollo Vinilo Blanco', 3, 7500),
(5, 'Tazas Sublimables Plástico', 12, 2500),
(6, 'Remeras Sublimables Gris', 15, 5000),
(7, 'Remeras Sublimables Blancas', 15, 5500),
(8,  'Buzo Sublimable Negro', 10, 4000)
;


-- Crear una tabla de vista con información del cliente
CREATE VIEW nombredeCliente AS
SELECT nombre, apellido, telefono, direccion FROM Cliente;
  

-- Crear una tabla de vista con información de proveedores
CREATE VIEW datosProveedor AS
SELECT nombreProveedor, telefono, email, direccion FROM Proveedor;

-- Seleccionar las distintas tablas para ver sus valores
SELECT * FROM Insumo;
SELECT * FROM Proveedor;
SELECT * FROM Pedidos;
SELECT * FROM Producto;
SELECT * FROM Cliente;

-- Mirar vistas

SELECT * FROM nombredeCliente;
SELECT * FROM datosProveedor;


-- Obtener el nombre del cliente que realizó el pedido con idPedido = 3:

SELECT nombre AS Nombre_Cliente
FROM Cliente
INNER JOIN pedidos ON pedidos.idCliente = cliente.idCliente
WHERE pedidos.idPedido = 3;

-- Obtener el total de pedidos de cada cliente:

SELECT nombre, apellido, COUNT(pedidos.idPedido) AS 'Total de Pedidos' 
FROM cliente
RIGHT JOIN pedidos ON cliente.idCliente = pedidos.idCliente GROUP BY cliente.idCliente;

-- Obtener todos los productos que sean 10 o más en cantidad

SELECT nombre, cantidad FROM producto WHERE cantidad >= 10; 
