use elUniversitario;
-- 1 Encuentra el profesor que ha impartido más asignaturas en el último año académico.
select p.*, count(a.nombre) from profesor p
join asignatura a on a.id_profesor = p.id group by 1 order by 1 desc limit 1;

-- 2 Lista los cinco departamentos con mayor cantidad de asignaturas asignadas.
select d.*, count(a.nombre) from departamento d
 join profesor p on p.id_departamento = d.id
  join asignatura a on p.id = a.id_profesor group by 1  order by 1 limit 5 ;
  
  
-- 3 Obtén el total de alumnos y docentes por departamento.
select * from profesor p
 left join departamento d on d.id = p.id_departamento
join asignatura a on p.id = a.id_profesor
 right join alumno_se_matricula_asignatura asm on asm.id_asignatura = a.id
join alumno al on al.id = asm.id_alumno;

select * from profesor;
-- 4 Calcula el número total de alumnos matriculados
-- en asignaturas de un género específico en un semestre determinado.
select distinct count(al.id) from alumno al
 left join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno
 join asignatura a where al.sexo = 'M' and a.nombre = 'calculo' and  a.cuatrimestre = 1;
 
-- 5 Encuentra los alumnos que han cursado todas las asignaturas de un grado específico.
select distinct al.* from alumno al
left join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno
join asignatura a on a.id = asm.id_asignatura where a.id_grado is not null;

select * from grado;
select * from asignatura;
select * from alumno order by fecha_nacimiento desc;
-- 6 Lista los tres grados con mayor número de asignaturas cursadas en el último semestre.
select count(a.nombre), a.cuatrimestre from grado g
join asignatura a on g.id = a.id_grado group by 2 ;

-- 7 Muestra los cinco profesores con menos asignaturas impartidas en el último año académico.
select p.nombre, p.apellido1, count(a.id_profesor) from profesor p
join asignatura a on p.id = a.id_profesor group by 1,2 order by 1 desc limit 5;

-- 8 Calcula el promedio de edad de los alumnos al momento de su primera matrícula.
select  avg(ce.anyo_inicio - year(al.fecha_nacimiento)) as promedio_edad from alumno al
join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno
join curso_escolar ce on ce.id = asm.id_curso_escolar;

-- 9 Encuentra los cinco profesores que han impartido más clases de un mismo grado.
select p.nombre, p.apellido1, count(a.id_profesor) from profesor p
join asignatura a on p.id = a.id_profesor group by 1,2 order by 1 asc limit 5;

-- 10 Genera un informe con los alumnos que han cursado más de 10 asignaturas en el último año.
select  al.* from alumno al
join alumno_se_matricula_asignatura asm on asm.id_alumno = al.id
join asignatura a on asm.id_asignatura = a.id
join curso_escolar ce on ce.id = asm.id_curso_escolar where ce.anyo_inicio = 2017 and asm.id_asignatura > 10;

-- 11 Calcula el promedio de créditos de las asignaturas por grado.
select avg(a.creditos) from asignatura a
join grado g on a.id_grado = g.id group by g.id;

-- 12 Lista las cinco asignaturas más largas (en horas) impartidas en el último semestre.


-- 13 Muestra los alumnos que han cursado más asignaturas de un género específico.
select  count(asm.id_asignatura),  al.* from alumno al
join alumno_se_matricula_asignatura asm on asm.id_alumno = al.id where al.sexo = 'H' group by 2 order by 1 desc;

-- 14 Encuentra la cantidad total de horas cursadas por cada alumno en el último semestre.


-- 15 Muestra el número de asignaturas impartidas diariamente en cada mes del último trimestre.
