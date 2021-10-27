use master 
go
DROP DATABASE IF EXISTS BDControlAsistencia;
CREATE DATABASE  BDControlAsistencia;

USE BDControlAsistencia
go

DROP TABLE IF EXISTS TGrado;
CREATE TABLE TGrado
(
	CodGrado varchar(5)not null,
	Nombre varchar(20),
	Seccion varchar(1)not null,
	Nivel varchar(15)not null,
	PRIMARY KEY (CodGrado)	
)

DROP TABLE IF EXISTS TDocente;
CREATE TABLE TDocente
(
	DniDocente varchar(8)not null,
	Contrasena varchar(50)not null,
	Appaterno varchar(50)not null,
	Apmaterno varchar(50)not null,
	Nombres varchar(50)not null,
	Genero varchar(20)not null,
	TelCelu varchar(10)not null,
	Direccion varchar(50)not null,
	FecNacimiento date not null,
	PRIMARY KEY (DniDocente),		
)

DROP TABLE IF EXISTS TGradoTDocente;
CREATE TABLE TGradoTDocente
(
	CodGrado varchar(5)not null,
	DniDocente varchar(8)not null,
	FOREIGN KEY (CodGrado) REFERENCES TGrado (CodGrado),
	FOREIGN KEY (DniDocente) REFERENCES TDocente (DniDocente)
)


DROP TABLE IF EXISTS TApoderado;
CREATE TABLE TApoderado
(
	DniApoderado varchar(8)not null,
	Contrasenia varchar(50)not null,
	Appaterno varchar(50)not null,
	Apmaterno varchar(50)not null,
	Nombres varchar(50)not null,
	Genero varchar(20)not null,
	Parentesco varchar(20)not null,
	TelCelu varchar(10)not null,
	Direccion varchar(50)not null,
	FecNacimiento date not null,
	PRIMARY KEY (DniApoderado),	
)

DROP TABLE IF EXISTS TAlumno;
CREATE TABLE TAlumno
(
	DniAlumno varchar(8)not null,
	Appaterno varchar(50)not null,
	Apmaterno varchar(50)not null,
	Nombres varchar(50)not null,
	Genero varchar(20)not null,
	Direccion varchar(50)not null,
	FecNacimiento date not null,
	DniApoderado varchar(8)not null,
	CodGrado varchar(5)not null,
	PRIMARY KEY (DniAlumno),
	FOREIGN KEY (DniApoderado) REFERENCES TApoderado (DniApoderado),
	FOREIGN KEY (CodGrado) REFERENCES TGrado (CodGrado)
)



DROP TABLE IF EXISTS TAsistencia;
CREATE TABLE TAsistencia
(
	CodAsistencia varchar(15), --1A211021
	Fecha date not null,
	Hora time not null,
	PRIMARY KEY (CodAsistencia)	
)

DROP TABLE IF EXISTS TAsistenciaTAlumno;
CREATE TABLE TAsistenciaTAlumno
(
	CodAsistencia varchar(15),
	DniAlumno varchar(8)not null,
	Estado varchar(10)not null,	 --Puntual/Falta/Tardanza
	FOREIGN KEY (CodAsistencia) REFERENCES TAsistencia (CodAsistencia),
	FOREIGN KEY (DniAlumno) REFERENCES TAlumno (DniAlumno)
)