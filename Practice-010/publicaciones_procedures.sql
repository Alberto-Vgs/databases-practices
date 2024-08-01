---------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER Supervizar_Doctor
BEFORE INSERT ON supervicion
  FOR EACH ROW BEGIN
    IF((SELECT doctorado FROM profesor WHERE id = NEW.id_profesor_principal)!="DOCTOR" AND (SELECT doctorado FROM profesor WHERE id = NEW.id_profesor_principal)!="NODOCTOR") THEN BEGIN
      signal sqlstate '45000' set MESSAGE_text = 'El registro Fallo';
      END; 
    END IF;
END //
DELIMITER ;
---------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER Asignar_doctor_al_proyecto
BEFORE INSERT ON proyecto
  FOR EACH ROW BEGIN
    IF((SELECT doctorado FROM profesor WHERE id = NEW.id_profesor_principal)!="DOCTOR") THEN BEGIN
      signal sqlstate '45000' set MESSAGE_text = 'El registro Fallo';
      END; 
    END IF;
  END //
DELIMITER ;
---------------------------------------------------------------------------------------------------------------
--insert into profesor values (Null,"Beto","hijodiosito","Semideidad","software",12345678,"NODOCTOR");
--insert into profesor values (Null,"alfred","diosito","deidad","software",12345678,"DOCTOR");
---------------------------------------------------------------------------------------------------------------
--insert into asignacion values (Null,2,1,02/02/2020,03/02/2020);
--insert into proyecto values (Null,"proyecto1",15009,"no se",03/02/2020,04/02/2020,"es un proyecto chido",1);
---------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER publicacion_revista
BEFORE INSERT ON revista
  FOR EACH ROW BEGIN
    IF((SELECT tipo FROM publicacion WHERE id = NEW.idp)!="congreso") THEN BEGIN
      signal sqlstate '45000' set MESSAGE_text = 'El registro Fallo';
      END; 
    END IF;
  END //
DELIMITER ;
---------------------------------------------------------------------------------------------------------------
DELIMITER //
CREATE TRIGGER publicacion_congreso
BEFORE INSERT ON congreso
  FOR EACH ROW BEGIN
    IF((SELECT tipo FROM publicacion WHERE id = NEW.idp)!="revista") THEN BEGIN
      signal sqlstate '45000' set MESSAGE_text = 'El registro Fallo';
      END; 
    END IF;
  END //
DELIMITER ;
---------------------------------------------------------------------------------------------------------------
--insert into publicacion values (Null,"titulo1","revista");
--insert into publicacion values (Null,"titulo1","congreso");
--insert into revista values (Null,1,01,01,25,1);
--insert into congreso values (Null,"cdmx","mexico","mieditorial",01,25,1);
DELIMITER //
CREATE FUNCTION holaMundo(entrada VARCHAR(20)) RETURNS VARCHAR(20)
BEGIN
  DECLARE salida VARCHAR(20);
  SET salida = entrada;
  RETURN salida;
  END ;//
DELIMITER ;
---Funcion
delimiter $
CREATE FUNCTION insertar_publicacion_revista(titulo VARCHAR(200),volumen SMALLINT,numero SMALLINT,pagina_inicio SMALLINT,pagina_fin SMALLINT)
RETURNS VARCHAR(200)
  BEGIN
    DECLARE id VARCHAR(4);
    INSERT INTO publicacion VALUES(NULL,titulo,'revista');
    SET id = (SELECT LAST_INSERT_ID());
    INSERT INTO revista VALUES(id,volumne,numero,pagina_inicio,pagina_fin);
    RETURN id;
  END;$
delimiter ;
--- PROCEDURE
delimiter $
CREATE PROCEDURE insertar_publicacion_revista(titulo VARCHAR(200),volumen SMALLINT,numero SMALLINT,pagina_inicio SMALLINT,pagina_fin SMALLINT)
   BEGIN
   DECLARE id VARCHAR(4);
    INSERT INTO publicacion VALUES(NULL,titulo,'revista');
    SET id = (SELECT LAST_INSERT_ID());
    INSERT INTO revista VALUES(id,volumne,numero,pagina_inicio,pagina_fin);
  END;$
delimiter ;