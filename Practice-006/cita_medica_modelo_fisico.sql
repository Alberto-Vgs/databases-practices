DROP DATABASE IF EXISTS cita_medica;
CREATE DATABASE cita_medica CHARACTER SET utf8mb4;
USE cita_medica;

CREATE TABLE tb_citas(
id INT AUTO_INCREMENT PRIMARY KEY,
nombrePaciente VARCHAR(100) NOT NULL,
nombreMedico VARCHAR(100) NOT NULL,
horaInicio VARCHAR(100) NOT NULL,
horaFin VARCHAR(100) NOT NULL,
precio FLOAT(10) NOT NULL,
fechaCita DATE NOT NULL,
malestares TEXT
);

INSERT INTO tb_citas VALUES(null,'aberto','doctor','12:00 pm','13:00 pm','150.50','2000/02/02','bla bla bla');