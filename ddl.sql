
drop database if exists elUniversitario;
create database elUniversitario;
use elUniversitario;

create table departamento(
id int(10) primary key,
nombre varchar(50)
);

create table profesor(
id int(10) primary key,
nif varchar(9),
nombre varchar(25),
apellido1 varchar(50),
apellido2 varchar(50),
ciudad varchar(25),
direccion varchar(50),
telefono varchar(9),
fecha_nacimiento date,
sexo enum('H','M'),
id_departamento int(10),
foreign key (id_departamento) references departamento (id)
);

create table grado (
id int(10) primary key,
nombre varchar(100)
);

create table asignatura (
id int(10) primary key, 
nombre varchar(100),
creditos float,
tipo enum('básica','obligatoria','optativa'),
curso tinyint(3),
cuatrimestre tinyint(3),
id_profesor int(10),
id_grado int(10),
foreign key (id_Profesor) references profesor (id),
foreign key (id_grado) references grado (id)
);

create table alumno (
id int(10) primary key,
nif varchar(9),
nombre varchar(25),
apellido1 varchar(50),
apellido2 varchar(50),
ciudad varchar(25),
direccion varchar(50),
telefono varchar(9),
fecha_nacimiento date,
sexo enum('H','M')
);

create table curso_escolar (
id int(10) primary key,
anyo_inicio year(4),
anyo_fin year(4)
);

create table alumno_se_matricula_asignatura (
id_alumno int(10),
id_asignatura int(10),
id_curso_escolar int(10),
foreign key (id_alumno) references alumno (id),
foreign key (id_asignatura) references asignatura (id),
foreign key (id_curso_escolar) references curso_escolar (id)
);

