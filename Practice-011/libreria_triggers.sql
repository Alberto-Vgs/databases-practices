--  TRIGGER'S
-- provincia
DELIMITER $
CREATE TRIGGER provincia_BI BEFORE INSERT 
  ON provincia
    FOR EACH ROW
      BEGIN
        SET NEW.nombre = UPPER(NEW.nombre);
      END;$
DELIMITER ;
DELIMITER $
CREATE TRIGGER provincia_BU BEFORE UPDATE 
  ON provincia
    FOR EACH ROW
      BEGIN
        SET NEW.nombre = UPPER(NEW.nombre);
      END;$
DELIMITER ;
-- localidad
DELIMITER $
CREATE TRIGGER localidad_BI BEFORE INSERT 
  ON localidad
    FOR EACH ROW
      BEGIN
        IF((SELECT COUNT(nombre) FROM localidad WHERE id_provincia = NEW.id_provincia AND nombre = NEW.nombre) > 0 ) THEN
          BEGIN
            SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'No pudes repetir nombre de localidad en la misma provincia';
          END;
        END IF;
        SET NEW.nombre = UPPER(NEW.nombre);
      END;$
DELIMITER ;
DELIMITER $
CREATE TRIGGER localidad_BU BEFORE UPDATE 
  ON localidad
    FOR EACH ROW
      BEGIN
        SET NEW.nombre = UPPER(NEW.nombre);
      END;$
DELIMITER ;
