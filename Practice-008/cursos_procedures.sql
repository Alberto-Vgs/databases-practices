
/*Un docente debe estar calificado*/
DELIMITER //
CREATE TRIGGER empleado_docente_calificado
BEFORE INSERT ON tb_cursos_realizados
  FOR EACH ROW BEGIN
    IF((SELECT estado_empleado FROM tb_empleados WHERE id = NEW.docente)!="Calificado") THEN BEGIN
        signal sqlstate '45000' set MESSAGE_text = 'El registro Fallo';
      END; 
    END IF;
END //
DELIMITER ;

/*Un curse prebio completo*/
DELIMITER //
CREATE TRIGGER curso_requisito
BEFORE INSERT ON tb_cursos_realizados
  FOR EACH ROW BEGIN
    IF((SELECT estado_curso FROM tb_cursos_realizados WHERE id = NEW.id_curso_realizado)!="Completo") THEN BEGIN
        signal sqlstate '45000' set MESSAGE_text = 'El registro Fallo';
      END; 
    END IF;
END //
DELIMITER ;

/*Un curso edicion por dia*/
DELIMITER //
CREATE TRIGGER curso_fecha
BEFORE INSERT ON tb_ediciones_cursos
  FOR EACH ROW BEGIN
    IF((SELECT fecha_edicion_curso FROM tb_ediciones_cursos)=NEW.fecha_edicion_curso) THEN BEGIN
        signal sqlstate '45000' set MESSAGE_text = 'El registro Fallo';
      END; 
    END IF;
END //
DELIMITER ;