
CREATE DATABASE Hospital;
USE Hospital;


CREATE TABLE Pacientes (
    numero_historia_clinica INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150),
    telefono VARCHAR(20)
);


CREATE TABLE Medicos (
    numero_colegiatura INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100)
);


CREATE TABLE Citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    numero_historia_clinica INT,
    numero_colegiatura INT,
    FOREIGN KEY (numero_historia_clinica) REFERENCES Pacientes(numero_historia_clinica),
    FOREIGN KEY (numero_colegiatura) REFERENCES Medicos(numero_colegiatura)
);
