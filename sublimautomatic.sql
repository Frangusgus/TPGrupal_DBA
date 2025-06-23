CREATE DATABASE SublimAutomatic;
USE SublimAutomatic;

-- Creación de la tabla clientes
CREATE TABLE clientes (
  idCliente INT(4) AUTO_INCREMENT PRIMARY KEY,
  nombreCliente VARCHAR(50),
  apellidoCliente  VARCHAR (50),
  telefonoCliente  VARCHAR(10),
  redsocialCliente VARCHAR(8)	
);


-- Creación de la tabla productos
CREATE TABLE productos (
  idProducto INT(4) AUTO_INCREMENT PRIMARY KEY,
  tipoProducto VARCHAR(50),
  talleProducto INT(4),
  cantidadProducto INT(4),
  costoProducto FLOAT(10),
  diseñoProducto VARCHAR(50),
  estadoProducto VARCHAR(50)
);

-- Creación de la tabla pedidos
CREATE TABLE pedidos (
  idPedido INT(4) AUTO_INCREMENT PRIMARY KEY,
  idCliente INT(4),
  idProducto  INT(4),
  FOREIGN KEY (idProducto) REFERENCES productos(idProducto),
  FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
);

-- Creación de la tabla insumos
CREATE TABLE insumos (
  idInsumo INT(4) AUTO_INCREMENT PRIMARY KEY,
  nombreInsumo VARCHAR(50),
  tipoInsumo VARCHAR(50),
  precioInsumo FLOAT(10),
  cantidadInsumo INT(4)
);



-- Creación de la tabla proveedores
CREATE TABLE proveedores (
  idProveedor INT(1) AUTO_INCREMENT PRIMARY KEY,
  nombreProveedor VARCHAR(50),
  contactoProveedor VARCHAR(20),
  direccionProveedor VARCHAR(20),
  cantidadCompra INT(3)
);

-- Insertar datos de clientes a la tabla clientes
INSERT INTO clientes (idCliente, nombreCliente, apellidoCliente, telefonoCliente, redsocialCliente) VALUES
(1, 'Facundo', 'Palmariciotti', 1523025534, 'Instagram'),
('Leandro Javier', 'Fernández', 1522224444, 'Facebook'),
('Rosana', 'Sosa', 1534042502, 'Instagram'),
('Iván', 'Bona', 1534042502, 'Instagram'),
('Kenneth', 'Loreto', 154893707, 'TikTok'),
('Mauro', 'Di Gallo', 153592088, 'Facebook'),
('Maria Paz', 'Short', 135039237, 'Instagram')
;

-- Insertar datos de productos a la tabla productos
INSERT INTO productos (idProducto, tipoProducto, talleProducto, materialProducto, cantidadProducto, costoProducto, diseñoProducto, estadoProducto) VALUES
(1, 'Remera Negra Perro Rosana', 'Indumentaria', 5000, '2'),
('Taza Boca Juniors', 'Tazas', 3500, '5'),
('Stickers Facundo', 'Stickers', 7000, '3'),
('Remera Blanca Back to the Future', 'Indumentaria', 7500, '1'),
('Taza Cumple Bona', 'Tazas', 8000, '12'),
('Buzo River Campeón', 'Indumentaria', 5000, '5')
;

-- Insertar datos de pedidos a la tabla pedidos
INSERT INTO pedidos (idPedido, idCliente, idProducto) VALUES
(1, 'Pedido Kenko', 'Remera', 5000, '2'),
('Pedido Maria', 'Remera', 3500, '5'),
('Pedido Ro', 'Remera', 7000, '3'),
('Pedido Facu', 'Stickers', 7500, '1'),
('Pedido Lean', 'Gorras', 8000, '12')
;

-- Insertar datos de proveedores a la tabla proveedores
INSERT INTO proveedores (idProveedor, nombreProveedor, contactoProveedor, direccionProveedor, cantidadCompra) VALUES
(1, 'DANITEX', '5491124720585', 'Tucumán 2980, CABA', '5'),
('DeTintas', '1139512690', 'Tucumán 2086', '10'),
('Once Tex', '1168201924', 'Junín 495', '3'),
('Sublimer Argentina', 'Azcuénaga 603', '1125049446', '2')
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
