CREATE DATABASE SublimAutomatic;
USE SublimAutomatic;

-- Creación de la tabla clientes
CREATE TABLE clientes (
  idCliente INT(3) AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(25),
  apellido  VARCHAR(25),
  telefono INT(14),
  direccion VARCHAR(50)
);

-- Creación de la tabla pedidos
CREATE TABLE pedidos (
  idPedido INT(3) AUTO_INCREMENT PRIMARY KEY,
  idCliente INT(3),
  fechaEntrega DATE,
  estado VARCHAR (30),
  FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
);

-- Creación de la tabla productos
CREATE TABLE productos (
  idProducto INT(3) AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(25),
  precioVenta DECIMAL(8,2),
  descripcion VARCHAR(70),
  cantidad INT(3)
);

-- Creación de la tabla proveedores
CREATE TABLE proveedores (
  idProveedor INT(3) AUTO_INCREMENT PRIMARY KEY,
  nombreProveedor VARCHAR(25),
  telefono INT(14),
  mail VARCHAR(30),
  direccion VARCHAR(25)
);

-- Creación de la tabla insumos
CREATE TABLE insumos (
  idInsumo INT(3) AUTO_INCREMENT PRIMARY KEY,
  idProveedor INT(3),
  nombreinsumo VARCHAR(40),
  cantidad INT(3),
  precioUnitario DECIMAL(8,2),
  FOREIGN KEY (idProveedor) REFERENCES proveedores(idProveedor)
);

-- Insertar datos de clientes a la tabla clientes
INSERT INTO clientes (idCliente, nombre, apellido, telefono, direccion) VALUES 
(1, 'Facundo', 'Palmariciotti', '1523025534', 'Av. Entre Rios 745 6A'),
(2, 'Leandro Javier', 'Fernández', '1522224444', 'Av Cordoba 2886 PB'),
(3, 'Rosana', 'Sosa', '1534042502', 'Vélez Sársfield 680 (Avellaneda)'),
(4, 'Iván', 'Bona', '1534042502', 'Deán Funes 2225 (Merlo)'),
(5, 'Kenneth', 'Loreto', '154893707', 'Av. Las Heras 2840'),
(6, 'Gian', 'Malaspina', '153592088', 'Lavalle 540 2C'),
(7, 'Maria Paz', 'Short', '135039237', 'Islas Malvinas 2681 Timbre 2 (San Andrés)'),
(8, 'Mauro', 'Di Gallo', '1523690874', 'Av Brasil 1021 PB')
;

-- Insertar datos de productos a la tabla productos
INSERT INTO productos (idProducto, nombre, precioVenta, descripcion, cantidad) VALUES
(1, 'Remera Rosana', 5500, 'Remera Gris con foto de perrito', 1 ),
(2, 'Taza Boca Juniors', 3500, 'Taza de plástico con logo de Boca Juniors', 10),
(3, 'Stickers Facundo', 7000, 'Stickers con ilustraciones de Facundo', 50),
(4, 'Remera Back to the Future', 7500, 'Remera blanca con motivo película Back to the Future', 5),
(5, 'Taza Cumple Bona', 8000, 'Taza para cumpleaños de cliente', 5),
(6, 'Buzo River Campeón', 5000, 'Buzo negro con vinilo de River campeón', 2)
;

-- Insertar datos de pedidos a la tabla pedidos
INSERT INTO pedidos (idPedido, idCliente, fechaEntrega, estado) VALUES
(6, 5, '2025-06-27', 'En preparación'),
(4, 7, '2025-06-24', 'Vendido'),
(1, 3, '2025-07-07', 'En preparación'),
(3, 1, '2025-06-29', 'En preparación'),
(5, 4, '2025-05-15', 'Vendido'),
(2, 6, '2025-07-08', 'En preparación')
;

-- Insertar datos de proveedores a la tabla proveedores
INSERT INTO proveedores (idProveedor, nombreProveedor, telefono, mail, direccion) VALUES
(1, 'DANITEX', '1123991098', 'daniteximportador@gmail.com', 'Tucumán 2980'),
(2, 'DeTintas', '1139512690', 'impo@detintas.com.ar', 'Tucumán 2086'),
(3, 'Once Tex', '1168201924', 'oncetex@gmail.com', 'Junín 495')
;

-- Insertar datos de insumos a la tabla insumos
INSERT INTO insumos (idInsumo, idProveedor, nombreInsumo, cantidad, precioUnitario) VALUES
(1, 2, 'Tinta', 2, 5000),
(2, 2, 'Resma A4 Sublimable', 4, 3500),
(3, 3, 'Rollo Vinilo Rojo', 3, 7000),
(4, 3, 'Rollo Vinilo Blanco', 3, 7500),
(5, 3, 'Tazas Sublimables Plástico', 12, 2500),
(6, 1, 'Remeras Sublimables Gris', 15, 5000),
(7, 1, 'Remeras Sublimables Blancas', 15, 5500),
(8, 1, 'Buzo Sublimable Negro', 10, 4000)
;


-- Crear una tabla de vista con información del cliente
CREATE VIEW nombredeCliente AS
SELECT nombre, apellido, telefono, direccion FROM clientes;
  

-- Crear una tabla de vista con información de proveedores
CREATE VIEW datosProveedor AS
SELECT nombreProveedor, telefono, mail, direccion FROM proveedores;

-- Crear una tabla de vista para ver los teléfonos en limpio

CREATE VIEW vistatelefonosLimpios AS
SELECT 
'Cliente' AS tipo,
idCliente AS id,
CONCAT(nombre, ' ', apellido) AS nombre,
REPLACE(CAST(telefono AS CHAR), ',', '') AS telefono
FROM clientes

UNION

SELECT 
'Proveedor' AS tipo,
idProveedor AS id,
nombreProveedor AS nombre,
REPLACE(CAST(telefono AS CHAR), ',', '') AS telefono
FROM proveedores;

-- Seleccionar las distintas tablas para ver sus valores
SELECT * FROM insumos;
SELECT * FROM pedidos;
SELECT * FROM proveedores;
SELECT * FROM productos;
SELECT * FROM clientes;

-- Mirar vistas

SELECT * FROM nombredeCliente;
SELECT * FROM datosProveedor;
SELECT * FROM vistatelefonosLimpios;


-- Obtener el nombre del cliente que realizó el pedido con idPedido = 3:

SELECT nombre AS Nombre_Cliente
FROM clientes
INNER JOIN pedidos ON pedidos.idCliente = clientes.idCliente
WHERE pedidos.idPedido = 3;

-- Obtener el total de pedidos de cada cliente:

SELECT nombre, apellido, COUNT(pedidos.idPedido) AS 'Total de Pedidos' 
FROM clientes 
RIGHT JOIN pedidos ON clientes.idCliente = pedidos.idCliente GROUP BY clientes.idCliente;

-- Obtener todos los productos que sean 10 o más en cantidad

SELECT nombre, cantidad FROM productos WHERE cantidad >= 10; 
