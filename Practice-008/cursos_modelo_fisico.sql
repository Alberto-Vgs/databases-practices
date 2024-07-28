DROP DATABASE IF EXISTS Cursos;
CREATE DATABASE Cursos CHARACTER SET utf8mb4;
USE Cursos;

CREATE TABLE tb_empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(100) UNIQUE NOT NULL,
    nombre_empleado VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    apellido0 VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    direccion VARCHAR(100) NOT NULL,
    telefono INT,
    NIF VARCHAR(100) UNIQUE NOT NULL,
    nacionalidad VARCHAR(100) NOT NULL,
    salario DECIMAL,
    estado_empleado ENUM ("Calificado","No Calificado") DEFAULT "No Calificado" NOT NULL
);

CREATE TABLE tb_cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(100) UNIQUE NOT NULL,
    nombre_curso VARCHAR(100) NOT NULL,
    descripcion TEXT,
    duracion TIME NOT NULL,
    costo DECIMAL NOT NULL
);

CREATE TABLE tb_ediciones_cursos (
    id_edicion_curso INT AUTO_INCREMENT PRIMARY KEY,
    fecha_edicion_curso DATE NOT NULL,
    horario ENUM ("Intenso","Mañana","Tarde"),
    id_curso INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES tb_cursos(id_curso)
);

CREATE TABLE tb_cursos_realizados (
    id_curso_realizado INT AUTO_INCREMENT PRIMARY KEY,
    estado_curso ENUM ("Completo","Iniciado") DEFAULT "Iniciado" NOT NULL,
    docente INT NOT NULL,
    id_curso INT NOT NULL,
    FOREIGN KEY (docente) REFERENCES tb_empleados(id_empleado),
    FOREIGN KEY (id_curso) REFERENCES tb_cursos(id_curso)
);

CREATE TABLE tb_cursos_realizados_empleados (
    id_curso_realizado_empleado INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    id_curso_realizado INT NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES tb_empleados(id_empleado),
    FOREIGN KEY (id_curso_realizado) REFERENCES tb_cursos_realizados(id_curso_realizado)
);

CREATE TABLE tb_cursos_requisitos (
    id_cursos_requisito INT AUTO_INCREMENT PRIMARY KEY,
    id_curso_requisito INT NOT NULL,
    id_curso_a_realizar INT NOT NULL,
    FOREIGN KEY (id_curso_requisito) REFERENCES tb_cursos(id_curso),
    FOREIGN KEY (id_curso_a_realizar) REFERENCES tb_cursos(id_curso)
);