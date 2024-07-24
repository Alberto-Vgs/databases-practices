DROP DATABASE IF EXISTS Notes;
CREATE DATABASE Notes CHARACTER SET utf8mb4;
USE Notes;

CREATE TABLE tb_cards (
    id_card INT AUTO_INCREMENT PRIMARY KEY,
    lenguage VARCHAR(100) NOT NULL,
    title VARCHAR(150) NOT NULL,
    descript TEXT NOT NULL,
    syntax VARCHAR(300) NOT NULL,
    status_card ENUM ("Activo","Inactivo") DEFAULT "Activo" NOT NULL
);