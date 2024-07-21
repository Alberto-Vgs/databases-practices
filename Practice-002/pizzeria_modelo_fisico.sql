DROP DATABASE IF EXISTS pizza;
CREATE DATABASE pizza CHARACTER SET utf8mb4;
USE pizza;

CREATE TABLE provincias(
    id_provincia INT PRIMARY KEY AUTO_INCREMENT,
    nombre_provincia VARCHAR (60) NOT NULL
);

CREATE TABLE localidades(
    id_localidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre_localidad VARCHAR (60) NOT NULL,
    id_provincia INT NOT NULL,
    FOREIGN KEY(id_provincia) REFERENCES provincias(id_provincia)
);

CREATE TABLE clientes(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR (60) NOT NULL,
    apellido_cliente int (10) NOT NULL,
    codigo_postal_cliente INT NOT NULL,
    direccion_cliente VARCHAR (60) NOT NULL,
    id_localidad INT NOT NULL,
    FOREIGN KEY(id_localidad) REFERENCES localidades(id_localidad)
);

CREATE TABLE tiendas(
    id_tienda INT PRIMARY KEY AUTO_INCREMENT,
    codigo_postal_tienda INT NOT NULL,
    direccion_tienda VARCHAR (60) NOT NULL,
    id_localidad INT NOT NULL,
    FOREIGN KEY(id_localidad) REFERENCES localidades(id_localidad)
);

CREATE TABLE pedidos(
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    precio_total INT NOT NULL,
    cantidad_producto INT NOT NULL,
    reparto ENUM("DOMICILIO","TIENDA") NOT NULL,
    id_cliente INT NOT NULL,
    id_tienda INT NOT NULL,
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY(id_tienda) REFERENCES tiendas(id_tienda)
);

CREATE TABLE productos(
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR (60) NOT NULL,
    precio INT NOT NULL,
    imagen VARCHAR (60) NOT NULL,
    descripcion text,
    f_h TIMESTAMP,
    reparto ENUM("BEVIDAS","PIZZAS","HAMBURGESAS") NOT NULL
);

CREATE TABLE categorias(
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    direccion_categoria VARCHAR (60) NOT NULL,
    id_producto INT NOT NULL,
    FOREIGN KEY(id_producto) REFERENCES productos(id_producto)
);