CREATE DATABASE SublimAutomatic;
USE SublimAutomatic;

-- Creación de la tabla clientes
CREATE TABLE clientes (
  idCliente INT(4) AUTO_INCREMENT PRIMARY KEY,
  nombreCliente VARCHAR(10),
  apellidoCliente  VARCHAR (10),
  telefonoCliente  VARCHAR(13),
  redsocialCliente VARCHAR(8)	
);


-- Creación de la tabla productos
CREATE TABLE productos (
  idProducto INT(4) AUTO_INCREMENT PRIMARY KEY,
  tipoProducto VARCHAR(10),
  talleProducto INT(4),
  materialProducto VARCHAR(13),
  cantidadProducto INT(4),
  costoProducto FLOAT(10),
  diseñoProducto VARCHAR(13),
  estadoProducto VARCHAR(6)
);

-- Creación de la tabla pedidos
CREATE TABLE pedido (
  idPedido INT(4) AUTO_INCREMENT PRIMARY KEY,
  fechaPedido DATE,
  fechaEntrega DATE,
  idCliente INT(4),
  idProducto  INT(4),
  FOREIGN KEY (idProducto) REFERENCES productos(idProducto),
  FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
);
-- Creación de la tabla diseño
CREATE TABLE diseño (
  idDiseño INT(4) AUTO_INCREMENT PRIMARY KEY,
  descripción VARCHAR (10),
  archivoDiseño VARCHAR (10),
  estado VARCHAR (10),
  );

-- Creación de la tabla insumos
CREATE TABLE insumos (
  idInsumo INT(4) AUTO_INCREMENT PRIMARY KEY,
  nombreInsumo VARCHAR(10),
  tipoInsumo VARCHAR(10),
  precioInsumo FLOAT(10),
  cantidadInsumo INT(4)
);


-- Creación de la tabla proveedores
CREATE TABLE proveedores (
  idProveedor INT(4) AUTO_INCREMENT PRIMARY KEY,
  nombreProveedor VARCHAR(10),
  contactoProveedor VARCHAR(13),
  direccionProveedor VARCHAR(10),
  cantidadCompra INT(4)
);

-- Creación de la tabla compras
CREATE TABLE compra (
  idCompra INT(4) AUTO_INCREMENT PRIMARY KEY,
  fecha DATE,
  idProveedor INT (10),
  idProducto INT (10),
  cantidad INT (10),
  precioUnitario DECIMAL 
  nombreCompra VARCHAR(10),
  contactoProveedor VARCHAR(13),
  direccionProveedor VARCHAR(10),
  cantidadCompra INT(4)
);

-- Creación de la tabla costo
CREATE TABLE compra (
  idCosto INT(4) AUTO_INCREMENT PRIMARY KEY,
  tipoInsumo 
  cantidadUsada INT (3),
  costoUnitario INT (3),
 
);

-- Creación de la tabla compras
CREATE TABLE stock (
  idStock INT(4) AUTO_INCREMENT PRIMARY KEY,
  cantidadDisponible INT (4)
  );


-- Insertar datos de clientes a la tabla clientes
INSERT INTO clientes (idCliente, nombreCliente, apellidoCliente, telefonoCliente, redsocialCliente) VALUES
(1, 'Facundo', 'Palmariciotti', 1523025534, 'Instagram'),
('Leandro Javier', 'Fernández', 1522224444, 'Facebook'),
('Rosana', 'Sosa', 1534042502, 'Instagram'),
('Iván', 'Bona', 1534042502, 'Instagram'),
('Kenneth', 'Loreto', 154893707, 'TikTok'),
('Mauro', 'Di Gallo', 153592088, 'Facebook),
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
