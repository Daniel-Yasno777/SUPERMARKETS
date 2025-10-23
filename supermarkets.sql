CREATE DATABASE IF NOT EXISTS supermarkets;
USE supermarkets;

CREATE TABLE IF NOT EXISTS usuarios(
Id_usuario INT PRIMARY KEY,
nombre_usuario VARCHAR(50) NOT NULL,
segundo_nombre VARCHAR(50) NULL,
primer_apellido VARCHAR(50) NOT NULL,
segundo_apellido VARCHAR(50) NULL
);

CREATE TABLE IF NOT EXISTS productos(
Id_producto INT PRIMARY KEY,
nombre_producto VARCHAR(50) NOT NULL,
marca VARCHAR(50) NOT NULL,
precio DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS facturas(
Id_factura INT AUTO_INCREMENT PRIMARY KEY,
Id_usuario INT NOT NULL,
Id_producto INT NOT NULL,
valor_total DECIMAL(10,2) NOT NULL,
CONSTRAINT fk_factura_usuario FOREIGN KEY (Id_usuario) REFERENCES usuarios(Id_usuario),
CONSTRAINT fk_factura_producto FOREIGN KEY (Id_producto) REFERENCES productos(Id_producto)
);