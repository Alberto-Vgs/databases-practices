DROP DATABASE IF EXISTS actividad_practica;
CREATE DATABASE actividad_practica CHARACTER SET utf8mb4;
USE actividad_practica;

CREATE TABLE tb_users(
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    correo_user VARCHAR(120) UNIQUE NOT NULL,
    cotraseña_user VARCHAR(120) NOT NULL
);

INSERT INTO tb_users VALUES(null,'user@admin.com','B03');

CREATE TABLE tb_empleados(
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombres_empleado VARCHAR(60) NOT NULL,
    apellidos_empleado VARCHAR(120) NOT NULL,
    fechaNacimiento_empleado DATE NOT NULL,
    genero_empleado ENUM ('M','F') NOT NULL,
    telefono_empleado INT(120) NOT NULL,
    correo_empleado VARCHAR(120) UNIQUE NOT NULL,
    departamentos_empleado ENUM('Recursos Humanos', 'Sistema', 'Administración'),
    salarioMensual_empleado FLOAT(10) NOT NULL,
    estatus_empleado ENUM ('activo','inactivo'),
    fechaCreacion_empleado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tb_autos(
    id_auto VARCHAR(20) PRIMARY KEY,
    fechaMontaje_auto DATE NOT NULL,
    color_auto VARCHAR(60) NOT NULL,
    caracteristicas_auto TEXT NOT NULL,
    modelo_auto VARCHAR(60) NOT NULL,
    precio_auto FLOAT(10) NOT NULL,
    estatus_auto ENUM ('vendido','mustra','venta'),
    fechaCreacion_auto DATE NOT NULL
);

CREATE TABLE tb_cards (
    id_card INT AUTO_INCREMENT PRIMARY KEY,
    lenguage VARCHAR(100) NOT NULL,
    title VARCHAR(150) NOT NULL,
    descript TEXT NOT NULL,
    syntax VARCHAR(300) NOT NULL,
    status_card ENUM ("Activo","Inactivo") DEFAULT "Activo" NOT NULL
);