DROP DATABASE IF EXISTS libreriaOnline;
CREATE DATABASE libreriaOnline CHARACTER SET utf8mb4;
USE libreriaOnline;

CREATE TABLE provincia (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE localidad (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    id_provincia INT UNSIGNED,
    FOREIGN KEY (id_provincia) REFERENCES provincia(id)
);

CREATE TABLE direccion (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    calle VARCHAR(100) NOT NULL,
    colonia VARCHAR(60) NOT NULL, 
    codigo_postal INT NOT NULL,
    id_localidad INT UNSIGNED,
    FOREIGN KEY (id_localidad) REFERENCES localidad(id)
);

CREATE TABLE almacen (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    telefono INT UNSIGNED NOT NULL,
    id_direccion INT UNSIGNED,
    FOREIGN KEY (id_direccion) REFERENCES direccion(id)
);

CREATE TABLE editorial (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    url_web VARCHAR(255),
    telefono INT UNSIGNED NOT NULL,
    id_direccion INT UNSIGNED,
    FOREIGN KEY (id_direccion) REFERENCES direccion(id)
);

CREATE TABLE persona (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    apellido1 VARCHAR(60) NOT NULL,
    apellido2 VARCHAR(60),
    id_direccion INT UNSIGNED,
    FOREIGN KEY (id_direccion) REFERENCES direccion(id)
);

CREATE TABLE autor (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    url_web VARCHAR(255),
    id_persona INT UNSIGNED,
    FOREIGN KEY (id_persona) REFERENCES persona(id)
);

CREATE TABLE cliente (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefono INT UNSIGNED,
    id_persona INT UNSIGNED,
    FOREIGN KEY (id_persona) REFERENCES persona(id)
);

CREATE TABLE libro (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    isbn VARCHAR(255) NOT NULL,
    year_publicacion YEAR NOT NULL,
    tipo ENUM('papel', 'ebook', 'papel/ebook') NOT NULL,
    id_editorial INT UNSIGNED,
    FOREIGN KEY (id_editorial) REFERENCES editorial(id)
);

CREATE TABLE carrito (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    fecha_compra DATETIME NOT NULL,
    id_cliente INT UNSIGNED,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

CREATE TABLE papel (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    lugar_impresion VARCHAR(255) NOT NULL,
    fecha_impresion DATE NOT NULL,
    precio FLOAT NOT NULL,
    id_libro INT UNSIGNED,
    FOREIGN KEY (id_libro) REFERENCES libro(id)
);

CREATE TABLE ebook (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tamaño_archivo FLOAT NOT NULL,
    precio FLOAT NOT NULL,
    id_libro INT UNSIGNED,
    FOREIGN KEY (id_libro) REFERENCES libro(id)
);

CREATE TABLE almacen_papel (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    stock INT UNSIGNED NOT NULL,
    id_almacen INT UNSIGNED,
    id_papel INT UNSIGNED,
    FOREIGN KEY (id_almacen) REFERENCES almacen (id),
    FOREIGN KEY (id_papel) REFERENCES papel (id)
);

CREATE TABLE autor_libro (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_autor INT UNSIGNED,
    id_libro INT UNSIGNED,
    FOREIGN KEY (id_autor) REFERENCES autor(id),
    FOREIGN KEY (id_libro) REFERENCES libro(id)
);

CREATE TABLE carrito_libro (
    id INT  UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    id_carrito INT UNSIGNED,
    id_libro INT UNSIGNED,
    cantidad INT UNSIGNED,
    FOREIGN KEY (id_carrito) REFERENCES carrito(id),
    FOREIGN KEY (id_libro) REFERENCES libro(id)

);