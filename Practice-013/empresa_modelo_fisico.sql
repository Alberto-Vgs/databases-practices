DROP DATABASE IF EXISTS Empresa;
CREATE DATABASE Empresa CHARACTER SET utf8mb4;
USE Empresa;

CREATE TABLE tb_departments(
    id_department INT PRIMARY KEY AUTO_INCREMENT,
    name_department VARCHAR(60) NOT NULL,
    responsable_department VARCHAR(60) NOT NULL,
    ext_department INT NOT NULL,
    status_department ENUM ('Active','Inactive'),
    update_department TIMESTAMP DEFAULT current_timestamp on update current_timestamp
);

CREATE TABLE Tecnicos(
    id_tenico INT PRIMARY KEY AUTO_INCREMENT,
    nombre_tecnico VARCHAR(60) NOT NULL,
    apellido_uno_tecnico VARCHAR(60) NOT NULL,
    apellido_dos_tecnico VARCHAR(60) NOT NULL,
    numero_empleado VARCHAR(16) UNIQUE NOT NULL,
    email_tecnico VARCHAR(60) UNIQUE NOT NULL,
    id_departamento INT,
    FOREIGN KEY(id_departamento) REFERENCES Departamentos(id_departamento)
);


CREATE TABLE Clientes(
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nombre_cliente VARCHAR(60) NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    numero_cliente VARCHAR(16) UNIQUE NOT NULL,
    telefono INT,
    codigo_postal INT NOT NULL
);

CREATE TABLE Usuarios(
    id_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(60) NOT NULL,
    apellido_uno_usuario VARCHAR(60) NOT NULL,
    apellido_dos_usuario VARCHAR(60) NOT NULL,
    email_usuario VARCHAR(60) UNIQUE NOT NULL,
    contraseña VARCHAR(30) NOT NULL,
    id_cliente INT,
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE TABLE Tikets(
    id_ticket INT PRIMARY KEY AUTO_INCREMENT,
    foto VARCHAR(1000),
    archivo VARCHAR(1000),
    comentario text,
    status ENUM ("pendiente","asignador","encurso","denegado","duplicado","terminado"),
    id_departamento INT,
    FOREIGN KEY(id_departamento) REFERENCES Departamentos(id_departamento)
);

CREATE TABLE asignacion_cliente(
    id_asignacion_clietne INT PRIMARY KEY AUTO_INCREMENT,
    id_ticket INT, 
    id_tenico INT,
    FOREIGN KEY(id_ticket) REFERENCES Tikets(id_ticket),
    FOREIGN KEY(id_tenico) REFERENCES Tecnicos(id_tenico)
);