use elUniversitario;


-- 1 TotalCreditosAlumno(AlumnoID, Anio): Calcula el total de 
-- créditos cursados por un alumno en un año específico.
drop function if exists TotalCreditosAlumno;
delimiter //
create function TotalCreditosAlumno(AlumnoID int, Anio int)
returns int deterministic
begin
	declare total int;
		select  sum(a.creditos) into total from alumno al
        join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno
        join asignatura a on a.id = asm.id_asignatura
        join curso_escolar ce on asm.id_curso_escolar = ce.id where al.id = AlumnoID and ce.anyo_inicio = Anio ;
	return total;
end //
delimiter ;

 select TotalCreditosAlumno(1, 2015) as creditos;

-- 2 PromedioHorasPorAsignatura(AsignaturaID): 
-- Retorna el promedio de horas de clases para una asignatura.
-- ----------------------------------------------------------------
-- NO EXISTE NINGUN ATRIBUTO CON HORAS EN LA BASE DE DATOS
-- ----------------------------------------------------------------

-- 3 TotalHorasPorDepartamento(DepartamentoID):
--  Calcula la cantidad total de horas impartidas por un departamento específico.

-- ----------------------------------------------------------------
-- NO EXISTE NINGUN ATRIBUTO CON HORAS EN LA BASE DE DATOS
-- ----------------------------------------------------------------

-- 4 VerificarAlumnoActivo(AlumnoID):
-- Verifica si un alumno está activo en el semestre actual basándose en su matrícula.

 drop function if exists VerificarAlumnoActivo;
 delimiter //
 create function VerificarAlumnoActivo(AlumnoID int)
 returns varchar(20) deterministic
 begin
	 
end //
delimiter ;


