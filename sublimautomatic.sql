CREATE DATABASE SublimAutomatic;
USE SublimAutomatic;

-- Creación de la tabla clientes
CREATE TABLE clientes (
  idCliente INT(3) AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(25),
  apellido  VARCHAR(25),
  telefono INT(7),
  direccion VARCHAR(25)	
);

-- Creación de la tabla pedidos
CREATE TABLE pedidos (
  idPedido INT(3) AUTO_INCREMENT PRIMARY KEY,
  idCliente INT(3) AUTO_INCREMENT,
  fechaEntrega DATE,
  estado VARCHAR (10),
  FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
);

-- Creación de la tabla productos
CREATE TABLE productos (
  idProducto INT(3) AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(25),
  precioVenta INT(4),
  descripcion VARCHAR(30),
  cantidad INT(3)
);


-- Creación de la tabla insumos
CREATE TABLE insumos (
  idInsumo INT(3) AUTO_INCREMENT PRIMARY KEY,
  idProveedor INT(3),
  nombreinsumo VARCHAR(20),
  cantidad INT(3),
  precioUnitario FLAOT(4),
  FOREIGN KEY (idProveedor) REFERENCES proveedores(idProveedor)
);


-- Creación de la tabla proveedores
CREATE TABLE proveedores (
  idProveedor INT(3) AUTO_INCREMENT PRIMARY KEY,
  nombreProveedor VARCHAR(25),
  telefono INT(7),
  mail VARCHAR(30),
  direccion VARCHAR(25)
);



-- Insertar datos de clientes a la tabla clientes
INSERT INTO clientes (idCliente, nombre, apellido, telefono, direccion) VALUES 
(1, 'Facundo', 'Palmariciotti', 1523025534, 'Av. Entre Rios 745 6A'),
('Leandro Javier', 'Fernández', 1522224444, 'Av Cordoba 2886 PB'),
('Rosana', 'Sosa', 1534042502, 'Vélez Sársfield 680 (Avellaneda)'),
('Iván', 'Bona', 1534042502, 'Deán Funes 2225 (Merlo)'),
('Kenneth', 'Loreto', 154893707, 'Av. Las Heras 2840'),
('Gian', 'Malaspina', 153592088, 'Lavalle 540 2C'),
('Maria Paz', 'Short', 135039237, 'Islas Malvinas 2681 Timbre 2 (San Andrés)'),
('Mauro', 'Di Gallo', 1523690874, 'Av Brasil 1021 PB')
;

-- Insertar datos de productos a la tabla productos
INSERT INTO productos (idProducto, nombre, precioVenta, descripcion, cantidad) VALUES
(1, 'Remera Rosana', 5500, 'Remera Gris con foto de perrito', 1 ),
('Taza Boca Juniors', 3500, 'Taza de plástico con logo de Boca Juniors', 10),
('Stickers Facundo', 7000, 'Stickers con ilustraciones de Facundo', 50),
('Remera Back to the Future', 7500, 'Remera blanca con motivo película Back to the Future', 5),
('Taza Cumple Bona', 8000, 'Taza para cumpleaños de cliente', 5),
('Buzo River Campeón', 5000, 'Buzo negro con vinilo de River campeón', 2)
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
('DeTintas', '1139512690', 'impo@detintas.com.ar', 'Tucumán 2086'),
('Once Tex', '1168201924', 'oncetex@gmail.com', 'Junín 495')
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


-- Crear una tabla de vista que oculte información del cliente
CREATE VIEW nombredeCliente AS
SELECT nombre, apellido, telefono, direccion FROM clientes
  

-- Crear una tabla de vista que oculte información de proveedores
CREATE VIEW datosProveedor AS
SELECT nombreProveedor, telefono, mail, direccion FROM proveedores

-- Obtener el nombre del cliente que realizó la venta con idVenta = 2:

SELECT nombreCliente
FROM ventas
INNER JOIN clientes ON ventas.idCliente = clientes.idCliente WHERE ventas.idVenta = 2;

-- Obtener el total de ventas de cada cliente:

SELECT nombreCliente, apellidoCliente, COUNT(ventas.idVenta) AS 'Total de Ventas' 
FROM clientes RIGHT JOIN ventas ON clientes.idCliente = ventas.idCliente GROUP BY clientes.idCliente;

-- Obtener todos los productos de la categoría electrónica con su nombre de categoría

SELECT nombreProducto, nombreCategoria
FROM productos
INNER JOIN categorias ON productos.idCategoria = categorias.idCategoria WHERE categorias.idCategoria = 1;

-- Obtener el nombre y la dirección de todos los clientes que han realizado ventas:

SELECT nombreCliente, direccionCliente
FROM clientes
INNER JOIN ventas ON clientes.idCliente = ventas.idCliente GROUP BY clientes.idCliente;

-- Obtener los detalles de ventas de la venta con idVenta = 1, incluyendo el nombre del producto y su precio de venta:

SELECT nombreProducto, precioVenta
FROM productos INNER JOIN ventas_detalle ON productos.idProducto = ventas_detalle.idProducto
JOIN ventas ON ventas_detalle.idVenta = ventas.idVenta WHERE ventas.idVenta = 1;


-- Obtener el total de ventas realizadas por cada cliente, mostrando el nombre del cliente y la cantidad total de ventas (es igual que la cuarta profe)

SELECT nombreCliente, COUNT(ventas.idVenta) AS 'Total de Ventas'
FROM clientes RIGHT JOIN ventas ON clientes.idCliente = ventas.idCliente GROUP BY clientes.idCliente;

-- Obtener los nombres de las categorías y la cantidad de productos vendidos en cada categoría

SELECT nombreCategoria, SUM(ventas_detalle.cantidad) AS 'Productos vendidos en cada Categoría'
FROM categorias 
JOIN productos ON categorias.idCategoria = productos.idCategoria
JOIN ventas_detalle ON productos.idProducto = ventas_detalle.idProducto GROUP BY categorias.idCategoria;

-- Obtener el nombre de cada cliente y el total gastado en compras por cada cliente, incluyendo aquellos clientes que no han realizado compras:

SELECT nombreCliente,  SUM(productos.precioCompra) AS 'Total gastado en compra'
FROM clientes 
JOIN ventas ON ventas.idCliente = clientes.idCliente
JOIN ventas_detalle ON ventas.idVenta = ventas_detalle.idVenta
JOIN productos ON ventas_detalle.idProducto = productos.idProducto GROUP BY clientes.nombreCliente;
