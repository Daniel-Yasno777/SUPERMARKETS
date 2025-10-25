
CREATE DATABASE IF NOT EXISTS Biblioteca;
USE Biblioteca;

CREATE TABLE Libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL UNIQUE,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100),
    anio_publicacion YEAR,
    estado ENUM('Disponible', 'Prestado') DEFAULT 'Disponible'
);

CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    numero_usuario VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150)
);

CREATE TABLE Prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_libro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    fecha_limite DATE NOT NULL,
    estado ENUM('Activo', 'Devuelto', 'Retrasado') DEFAULT 'Activo',

    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES Libros(id_libro)
);

INSERT INTO Libros (codigo, titulo, autor, anio_publicacion)
VALUES 
('L001', 'Cien años de soledad', 'Gabriel García Márquez', 1967),
('L002', 'Don Quijote de la Mancha', 'Miguel de Cervantes', 1605),
('L003', 'La Odisea', 'Homero', NULL);

INSERT INTO Usuarios (numero_usuario, nombre, direccion)
VALUES
('U001', 'Ana Torres', 'Calle 10 #5-15'),
('U002', 'Luis Pérez', 'Carrera 8 #12-34'),
('U003', 'María Gómez', 'Avenida 3 #45-67');

INSERT INTO Prestamos (id_usuario, id_libro, fecha_prestamo, fecha_limite)
VALUES
(1, 2, '2025-10-15', '2025-10-30'),
(2, 1, '2025-10-18', '2025-11-02');

SELECT 
    p.id_prestamo,
    u.nombre AS Usuario,
    l.titulo AS Libro,
    p.fecha_prestamo,
    p.fecha_limite,
    p.estado
FROM Prestamos p
JOIN Usuarios u ON p.id_usuario = u.id_usuario
JOIN Libros l ON p.id_libro = l.id_libro;