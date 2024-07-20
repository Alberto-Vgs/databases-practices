DROP DATABASE IF EXISTS Empresa;
CREATE DATABASE Empresa CHARACTER SET utf8mb4;
USE Empresa;

CREATE TABLE Marcas(
    id_marca INT PRIMARY KEY AUTO_INCREMENT,
    nombre_marca VARCHAR (60) NOT NULL
);

CREATE TABLE Modelos(
    id_modelo INT PRIMARY KEY AUTO_INCREMENT,
    nombre_modelo VARCHAR (60) NOT NULL,
    id_marca INT,
    FOREIGN KEY(id_marca) REFERENCES Marcas(id_marca)
);

CREATE TABLE Coches_usados(
    id_coche_usado INT PRIMARY KEY AUTO_INCREMENT,
    matricula_coche_usado VARCHAR (10) UNIQUE NOT NULL,
    precio_tasacion INT NOT NULL,
    id_modelo INT,
    FOREIGN KEY(id_modelo) REFERENCES Modelos(id_modelo)
);

CREATE TABLE Versiones(
    id_version INT PRIMARY KEY AUTO_INCREMENT,
    nombre_version VARCHAR (60) NOT NULL,
    potencia VARCHAR (60) NOT NULL,
    precio_base INT NOT NULL,
    tipo_combustible ENUM ("Gasolina","Dicel") NOT NULL,
    id_modelo INT,
    FOREIGN KEY(id_modelo) REFERENCES Modelos(id_modelo)
);

CREATE TABLE Clientes(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR (60) NOT NULL,
    apellido_cliente_uno VARCHAR (60) NOT NULL,
    apellido_cliente_dos VARCHAR (60),
    direccion_cliente  VARCHAR (60),
    telefono_cliente INT,
    INE_cliente VARCHAR (18)
);

CREATE TABLE Coches_nuevos(
    id_coche_nuevo INT PRIMARY KEY AUTO_INCREMENT,
    matricula_coche_nuevo VARCHAR (10) UNIQUE NOT NULL,
    id_version INT,
    FOREIGN KEY(id_version) REFERENCES Versiones(id_version)
);

CREATE TABLE Vendedores(
    id_vendedor INT PRIMARY KEY AUTO_INCREMENT,
    nombre_vendedor VARCHAR (60) NOT NULL,
    apellido_vendedor_uno VARCHAR (60) NOT NULL,
    apellido_vendedor_dos VARCHAR (60),
    direccion_vendedor  VARCHAR (60),
    telefono_vendedor INT,
    INE_vendedor VARCHAR (18) UNIQUE
);

CREATE TABLE Extras(
    id_extra INT PRIMARY KEY AUTO_INCREMENT,
    nombre_extra VARCHAR (60) NOT NULL,
    descripcion VARCHAR (200)
);

CREATE TABLE Entregas(
    id_entrega INT PRIMARY KEY AUTO_INCREMENT,
    id_coche_usado INT,
    id_cliente INT,
    FOREIGN KEY(id_coche_usado) REFERENCES Coches_nuevos(id_coche_nuevo),
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Compras(
    id_compra INT PRIMARY KEY AUTO_INCREMENT,
    id_coche_nuevo INT,
    id_cliente INT,
    id_vendedor INT,
    fecha_compra DATE NOT NULL,
    FOREIGN KEY(id_coche_nuevo) REFERENCES Coches_nuevos(id_coche_nuevo),
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY(id_vendedor) REFERENCES Vendedores(id_vendedor)
);

CREATE TABLE Versiones_extras(
    id_version_extra INT PRIMARY KEY AUTO_INCREMENT,
    id_version INT,
    id_extra INT,
    FOREIGN KEY(id_version) REFERENCES Versiones(id_version),
    FOREIGN KEY(id_extra) REFERENCES Extras(id_extra)
);

CREATE TABLE Coches_nuevos_extras(
    Coches_nuevos_extras INT PRIMARY KEY AUTO_INCREMENT,
    id_coche_nuevo INT,
    id_extra INT,
    FOREIGN KEY(id_coche_nuevo) REFERENCES Coches_nuevos(id_coche_nuevo),
    FOREIGN KEY(id_extra) REFERENCES Extras(id_extra)
);