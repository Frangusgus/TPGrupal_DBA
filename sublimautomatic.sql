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
  idCliente INT(4),
  idProducto  INT(4),
  FOREIGN KEY (idProducto) REFERENCES productos(idProducto),
  FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
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


