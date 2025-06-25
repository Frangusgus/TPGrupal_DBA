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
  tipo VARCHAR(20),
  precioVenta INT(4),
  descripcion VARCHAR(30),
  cantidad INT(3)
);


-- Creación de la tabla insumos
CREATE TABLE insumos (
  idInsumo INT(3) AUTO_INCREMENT PRIMARY KEY,
  idProveedor INT(3),
  nombreinsumo VARCHAR(30),
  cantidad INT(3),
  precioUnitario (3),
  FOREIGN KEY (idProveedor) REFERENCES proveedores(idProveedor)
);


-- Creación de la tabla proveedores
CREATE TABLE proveedores (
  idProveedor INT(3) AUTO_INCREMENT PRIMARY KEY,
  nombreProveedor VARCHAR(25),
  telefono INT(7),
  mail VARCHAR(10),
  direccion VARCHAR(25)
);



-- Insertar datos de clientes a la tabla clientes
INSERT INTO clientes (idCliente, nombreCliente, apellidoCliente, telefonoCliente, redsocialCliente) VALUES -- En vez de que tipo de red social, hagamos de cuenta que sòlo usamos Instagram, y el dato de redsocial es el nombre de usuario
(1, 'Facundo', 'Palmariciotti', 1523025534, 'elpalma'),
('Leandro Javier', 'Fernández', 1522224444, 'leanfernandez'),
('Rosana', 'Sosa', 1534042502, 'rososalamasgrosa'),
('Iván', 'Bona', 1534042502, 'bonax_'),
('Kenneth', 'Loreto', 154893707, 'kenkoformidable'),
('Gian', 'Malaspina', 153592088, 'gianelmaskpo'),
('Maria Paz', 'Short', 135039237, 'mapazshort')
;

-- Insertar datos de productos a la tabla productos
INSERT INTO productos (idProducto, nombreProducto, tipoProducto, talleProducto, costoProducto, estadoProducto) VALUES
(1, 'Remera Gris Perro Rosana', 'Indumentaria', 'L', 5000, 'Vendido'),
('Taza Boca Juniors', 'Tazas', NULL, 3500, 'En preparación'),
('Stickers Facundo', 'Stickers', NULL, 7000, 'Vendido'),
('Remera Blanca Back to the Future', 'Indumentaria', 'XXL' 7500, 'Vendido'),
('Taza Cumple Bona', 'Tazas', NULL, 8000, 'Vendido'),
('Buzo River Campeón', 'Indumentaria', 'XL', 5000, 'En preparación')
;

-- Insertar datos de pedidos a la tabla pedidos
INSERT INTO pedidos (idPedido, idCliente, idProducto) VALUES
(1, 'Pedido Kenko', 5, 6),
('Pedido Maria', 7, 4),
('Pedido Ro', 3, 1),
('Pedido Facu', 1,  3),
('Pedido Bona', 2, 5),
('Pedido Gian', 6, 2)
;

-- Insertar datos de pedidos a la tabla stock
INSERT INTO stock (idStock, tipoStock, cantidadStock) VALUES
(1, 'Remera blanca', 40),
('Taza Plástico', 20),
('Gorra verde y blanca', 10),
('Hoppy', 5),
('Termo autocebable', 15),
('Buzo gris', 20),
('Remera gris', 20)
;

-- Insertar datos de proveedores a la tabla proveedores
INSERT INTO proveedores (idProveedor, nombreProveedor, contactoProveedor, direccionProveedor, cantidadCompra) VALUES
(1, 'DANITEX', '5491124720585', 'Tucumán 2980', '5'),
('DeTintas', '1139512690', 'Tucumán 2086', '10'),
('Once Tex', '1168201924', 'Junín 495', '3'),
('Sublimer Argentina', '1125049446', 'Azcuénaga 603', '2')
;

-- Insertar datos de insumos a la tabla insumos
INSERT INTO insumos (idInsumo, nombreInsumo, tipoInsumo, precioInsumo, cantidadInsumo) VALUES
(1, 'Tinta', 'Impresión', 5000, '2'),
('Resma A4 Sublimable', 'Impresión', 3500, '5'),
('Rollo Vinilo Rojo', 'Sublimable', 7000, '3'),
('Rollo Vinilo Amarillo', 'Sublimable', 7500, '1'),
('Tazas Sublimables Plástico', 'Plástico', 8000, '12'),
('Remeras Sublimables Gris', 'Textil', 5000, '5'),
('Remeras Sublimables Blancas', 'Textil', 5500, '7'),
('Gorro Sublimable', 'Textil', 4000, '24')
;


-- Crear una tabla de vista que oculte el nombre, apellido, telefono y redes de clientes en nombreCliente
CREATE VIEW nombredeCliente AS
SELECT nombreCliente, apellidoCliente, telefonoCliente, redsocialCliente FROM clientes

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
