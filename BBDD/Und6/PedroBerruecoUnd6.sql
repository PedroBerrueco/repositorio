/* 
BASE DE DATOS A CREAR:

Alumno (Matrícula (PK), Nombre, Apellido1, Apellido2)
Unidad (Número (PK), Título, Número_ud_precedente (FK))
Alumno_Unidad (Matrícula (PK)(FK), Número (PK)(FK), Curso)
Actividad (Código_act (PK), Título, Número_ud (FK))
Examen (Código_act (PK)(FK), Tiempo)
Ejercicio (Código_act (PK)(FK))
Pregunta (Código_act (PK)(FK), Código_preg (PK), Contenido)
*/

CREATE DATABASE Universidad CHARACTER SET Latin1 COLLATE latin1_spanish_ci;

USE universidad;

CREATE TABLE ALUMNO(
Matricula INTEGER, -- Vamos a suponer que la matricula es un número entero sin letras.
Nombre VARCHAR(20),
Apellido1 VARCHAR(20),
Apellido2 varchar(20),
PRIMARY KEY (Matricula)
)ENGINE=InnoDB;

CREATE TABLE UNIDAD(
Numero INTEGER,
Titulo VARCHAR(50),
Numero_ud_precedente INTEGER,
PRIMARY KEY (Numero),
FOREIGN KEY (Numero_ud_precedente) REFERENCES UNIDAD(Numero)
)ENGINE=InnoDB;

CREATE TABLE ALUMNO_UNIDAD(
Matricula INTEGER,
Numero INTEGER,
Curso VARCHAR(20), -- Imaginemos que los cursos tienen nombres como el nuestro "DAMD".
PRIMARY KEY (Matricula, Numero),
FOREIGN KEY (Matricula) REFERENCES ALUMNO(Matricula),
FOREIGN KEY (Numero) REFERENCES UNIDAD(Numero)
)ENGINE=InnoDB;

CREATE TABLE ACTIVIDAD(
Codigo_act INTEGER,
Titulo VARCHAR(50),
Numero_ud INTEGER,
PRIMARY KEY (Codigo_act),
FOREIGN KEY (Numero_ud) REFERENCES UNIDAD(Numero)
)ENGINE=InnoDB;

CREATE TABLE EXAMEN(
Codigo_act INTEGER,
Tiempo TIME,
PRIMARY KEY (Codigo_act),
FOREIGN KEY (Codigo_act) REFERENCES ACTIVIDAD(Codigo_act)
)ENGINE=InnoDB;

CREATE TABLE EJERCICIO(
Codigo_act INTEGER,
PRIMARY KEY (Codigo_act),
FOREIGN KEY (Codigo_act) REFERENCES ACTIVIDAD(Codigo_act)
)ENGINE=InnoDB;

CREATE TABLE PREGUNTA(
Codigo_act INTEGER,
Codigo_preg INTEGER,
Contenido TEXT, -- Las preguntas tienen un contenido muy dispar por lo que selecciono el tipo TEXT para esta columna.
PRIMARY KEY (Codigo_act, Codigo_preg),
FOREIGN KEY (Codigo_act) REFERENCES ACTIVIDAD(Codigo_act)
)ENGINE=InnoDB;

SHOW TABLES;

-- En este caso he seguido el mismo orden facilitado pues no se generaban conflictos con las FK.
