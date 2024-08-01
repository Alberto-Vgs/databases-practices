-- modelo real 
DROP DATABASE IF EXISTS publicaciones;
CREATE DATABASE publicaciones CHARACTER SET utf8mb4;
USE publicaciones;


CREATE TABLE profesor (
  id INT  AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  despacho VARCHAR(100) NOT NULL,
  telefono int(10) NOT NULL,
  doctorado ENUM ("DOCTOR","NODOCTOR")
);

CREATE TABLE proyecto (
  id INT  AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  presupuesto DOUBLE  NOT NULL,
  I_D VARCHAR(100) NOT NULL,
  f_inicio DATE NOT NULL,
  f_fin DATE NOT NULL,
  dscripcion text,
  id_profesor_principal int NOT NULL,
  FOREIGN KEY (id_profesor_principal) REFERENCES profesor(id)
);


CREATE TABLE supervicion (
  id INT  AUTO_INCREMENT PRIMARY KEY,
  id_proyecto int NOT NULL, 
  id_profesor_principal int NOT NULL,
  id_profesor int NOT NULL,
  despacho VARCHAR(100) NOT NULL,
  telefono int(10) NOT NULL,
  FOREIGN KEY (id_profesor_principal) REFERENCES profesor(id),
  FOREIGN KEY (id_proyecto) REFERENCES proyecto(id),
  FOREIGN KEY (id_profesor_principal) REFERENCES profesor(id)
);

CREATE TABLE asignacion(
    id INT  AUTO_INCREMENT PRIMARY KEY,
    id_profesor_a INT,
    id_profesor INT,
    f_inicio DATE NOT NULL,
    f_fin DATE NOT NULL,
    FOREIGN KEY (id_profesor_a) REFERENCES profesor(id),
    FOREIGN KEY (id_profesor) REFERENCES profesor(id)
);

CREATE TABLE publicacion(
    id INT  AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    tipo ENUM("revista","congreso")
);

CREATE TABLE revista(
    id INT  AUTO_INCREMENT PRIMARY KEY,
    volumen INT NOT NULL,
    numero INT NOT NULL,
    pinicio INT NOT NULL,
    pfinal INT NOT NULL,
    idp INT NOT NULL,
    FOREIGN KEY (idp) REFERENCES publicacion(id)
);

CREATE TABLE congreso(
  id INT  AUTO_INCREMENT PRIMARY KEY,
  ciudad  VARCHAR(100) NOT NULL,
  pais  VARCHAR(100) NOT NULL,
  editorial  VARCHAR(100) NOT NULL,
  f_inicio DATE NOT NULL,
  f_fin DATE NOT NULL,
  idp INT NOT NULL,
  FOREIGN KEY (idp) REFERENCES publicacion(id)
);