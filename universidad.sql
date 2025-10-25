
CREATE DATABASE Universidad;
USE Universidad;


CREATE TABLE Estudiantes (
    numero_matricula INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE Profesores (
    codigo_profesor INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100)
);


CREATE TABLE Cursos (
    codigo_curso INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos INT,
    codigo_profesor INT,
    FOREIGN KEY (codigo_profesor) REFERENCES Profesores(codigo_profesor)
);


CREATE TABLE Inscripciones (
    numero_matricula INT,
    codigo_curso INT,
    fecha_inscripcion DATE,
    PRIMARY KEY (numero_matricula, codigo_curso),
    FOREIGN KEY (numero_matricula) REFERENCES Estudiantes(numero_matricula),
    FOREIGN KEY (codigo_curso) REFERENCES Cursos(codigo_curso)
);
