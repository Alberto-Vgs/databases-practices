DROP DATABASE IF EXISTS bs_db;
CREATE DATABASE bs_db CHARACTER SET utf8mb4;
USE bs_db;

CREATE TABLE users_tb(
    user_id  INT PRIMARY KEY AUTO_INCREMENT,
    user_email varchar(140) UNIQUE,
    user_password varchar(200) NOT NULL,
    user_temp_password varchar(200),
    user_force_change ENUM('Y','N') NOT NULL DEFAULT 'Y',
    user_status ENUM('Active','Inactive') NOT NULL DEFAULT 'Active',
    user_role ENUM('Administrator','General') NOT NULL,
    user_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_update TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE os_tb(
    os_id  INT PRIMARY KEY AUTO_INCREMENT,
    os_name varchar(60) NOT NULL,
    os_architecture ENUM('64 bits','32 bits') DEFAULT '64 bits' NOT NULL,
    os_description TEXT,
    os_ram ENUM('512M','2G','4') NOT NULL,
    os_storage ENUM('300M','10G','60G') NOT NULL,
    os_base VARCHAR(100) NOT NULL,
    os_register TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);