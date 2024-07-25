DROP DATABASE IF EXISTS mapa;
CREATE DATABASE mapa CHARACTER SET utf8mb4;
USE mapa;

CREATE TABLE ubicaciones (
    id_ubicacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_ubicacion VARCHAR(100) NOT NULL,
    long_ubicacion FLOAT(25) NOT NULL,
    lat_ubicacion FLOAT(25) NOT NULL
);

CREATE TABLE usuarios(
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(120) NOT NULL,
    correo_usuario VARCHAR(120) NOT NULL UNIQUE,
    password_usuario VARCHAR(255) NOT NULL,
    rol_usuario enum("User","Admin") not null default "User"
);

insert into usuarios values(null,"alberto","alberto@admin.com","password","admin");