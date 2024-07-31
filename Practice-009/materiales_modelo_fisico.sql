DROP DATABASE IF EXISTS sw15_renta;
CREATE DATABASE sw15_renta CHARACTER SET utf8mb4;
USE sw15_renta;

CREATE TABLE tb_personas(
  id_persona INT  AUTO_INCREMENT PRIMARY KEY,
  persona_nombres varchar(120),
  persona_apellidos varchar(120), 
  persona_telefono varchar(20),
  persona_genero enum('M','F'),
  persona_creation timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  persona_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO `tb_personas` VALUES (null,'alberto','vargas','1234567890','M',default,default);

CREATE TABLE tb_usuarios (
  id_usuario int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  correo_usuario varchar(140) UNIQUE NOT NULL,
  contraseña_usuario varchar(200),
  contraseña_temp_usuario varchar(200) DEFAULT NULL,
  cambio_forzado_usuario enum('Y','N') NOT NULL DEFAULT 'Y',
  estado_usuario enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  tipo_usuario enum('Administrador','Recepcionista','Cliente') NOT NULL,
  fk_persona INT NOT NULL,
  creacion_usuario timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  actualizar_usuario timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (fk_persona) REFERENCES tb_personas(id_persona)
);

INSERT INTO `tb_usuarios` VALUES (null,'admin@user.com','123',NULL,'Y','Active','Administrador',1,default,default);


CREATE TABLE tb_clases (
  id_clase INT  AUTO_INCREMENT PRIMARY KEY,
  material_clase ENUM ('Herramienta','Maquinaria','Adenes','Otro'),
  estado_clase enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  fecha_registro_clase timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fecha_actualizacion_clase timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE tb_materiales (
    codigo_material INT  AUTO_INCREMENT PRIMARY KEY,
    nombre_material VARCHAR(100) NOT NULL,
    espesificaciones_material TEXT NOT NULL,
    existencia_material SMALLINT NOT NULL,
    cantidad_disponible SMALLINT NOT NULL,
    estado_material enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
    fecha_registro_material timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion_material timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE tb_clases_materiales (
  codigo_material INT NOT NULL,
  id_clase INT NOT NULL,
  FOREIGN KEY (id_clase) REFERENCES tb_clases(id_clase),
  FOREIGN KEY (codigo_material) REFERENCES tb_materiales(codigo_material)
);

CREATE TABLE tb_empresas (
    codigo_empresa INT  AUTO_INCREMENT PRIMARY KEY,
    nombre_empresa VARCHAR(100) NOT NULL,
    abr_empresa VARCHAR(15) NOT NULL,
    direccion_empresa TEXT,
    telefono_empresa VARCHAR(120) NOT NULL,
    responsable_empresa VARCHAR(160) NOT NULL,
    tel_responsable_empresa VARCHAR(120) NOT NULL,
    email_empresa VARCHAR(160) NOT NULL,
    estado_material enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
    fecha_registro_empresa timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ultima_mod_empresa timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE tb_cliente(
  codigo_cliente INT  AUTO_INCREMENT PRIMARY KEY,
  fk_persona_cliente INT NOT NULL,
  fk_empresas INT NOT NULL,
  cliente_creation timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  cliente_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (fk_persona_cliente) REFERENCES tb_personas(id_persona),
  FOREIGN KEY (fk_empresas) REFERENCES tb_empresas(codigo_empresa)
);
