-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-03-10 03:57:02.878

-- tables
-- Table: Categoria
CREATE TABLE Categoria (
    id_categoria serial  NOT NULL,
    nombre_categoria varchar(60)  NOT NULL,
    CONSTRAINT pk_Categoria PRIMARY KEY (id_categoria)
);

-- Table: Categoria_Libro
CREATE TABLE Categoria_Libro (
    id_categoria int  NOT NULL,
    ISBN_libro int  NOT NULL,
    CONSTRAINT pk_Categoria_Libro PRIMARY KEY (id_categoria,ISBN_libro)
);

-- Table: Copia_Libro
CREATE TABLE Copia_Libro (
    ISBN_libro int  NOT NULL,
    cod_libro serial  NOT NULL,
    nro_ejemplar int  NOT NULL,
    fecha_edicion date  NOT NULL,
    nro_edicion int  NOT NULL,
    CONSTRAINT ak_Copia_Libro UNIQUE (nro_ejemplar) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT pk_Copia_Libro PRIMARY KEY (cod_libro,ISBN_libro)
);

-- Table: Empleado
CREATE TABLE Empleado (
    nro_empleado serial  NOT NULL,
    nombre_empleado varchar(30)  NOT NULL,
    cargo varchar(60)  NOT NULL,
    entrada_horaria int  NOT NULL,
    salida_horaria int  NOT NULL,
    CONSTRAINT pk_Empleado PRIMARY KEY (nro_empleado)
);

-- Table: Lector
CREATE TABLE Lector (
    dni_lector int  NOT NULL,
    nombre varchar(30)  NOT NULL,
    telefono varchar(30)  NOT NULL,
    direccion varchar(60)  NOT NULL,
    email varchar(30)  NOT NULL,
    CONSTRAINT pk_Lector PRIMARY KEY (dni_lector)
);

-- Table: Libro
CREATE TABLE Libro (
    ISBN_libro serial  NOT NULL,
    titulo varchar(100)  NOT NULL,
    autor varchar(60)  NOT NULL,
    editorial varchar(60)  NOT NULL,
    fecha_publicacion date  NOT NULL,
    genero varchar(30)  NOT NULL,
    CONSTRAINT pk_Libro PRIMARY KEY (ISBN_libro)
);

-- Table: Prestamo
CREATE TABLE Prestamo (
    id_prestamo serial  NOT NULL,
    dni_lector int  NOT NULL,
    nro_empleado int  NOT NULL,
    cod_copia_libro int  NOT NULL,
    ISBN_libro int  NOT NULL,
    fecha_inicio date  NOT NULL,
    fecha_devolucion date  NOT NULL,
    CONSTRAINT ak_Prestamo UNIQUE (ISBN_libro, cod_copia_libro) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT pk_Prestamo PRIMARY KEY (id_prestamo)
);

-- Table: Reserva
CREATE TABLE Reserva (
    nro_reserva serial  NOT NULL,
    dni_lector int  NOT NULL,
    ISBN_libro int  NOT NULL,
    fecha_inicio date  NOT NULL,
    fecha_fin date  NOT NULL,
    estado varchar(30)  NOT NULL,
    CONSTRAINT pk_Reserva PRIMARY KEY (nro_reserva)
);

-- foreign keys
-- Reference: Copia_Libro_Libro (table: Copia_Libro)
ALTER TABLE Copia_Libro ADD CONSTRAINT Copia_Libro_Libro
    FOREIGN KEY (ISBN_libro)
    REFERENCES Libro (ISBN_libro)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Categoria_Categoria_Libro (table: Categoria_Libro)
ALTER TABLE Categoria_Libro ADD CONSTRAINT fk_Categoria_Categoria_Libro
    FOREIGN KEY (id_categoria)
    REFERENCES Categoria (id_categoria)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Copia_Libro_Prestamo (table: Prestamo)
ALTER TABLE Prestamo ADD CONSTRAINT fk_Copia_Libro_Prestamo
    FOREIGN KEY (cod_copia_libro, ISBN_libro)
    REFERENCES Copia_Libro (cod_libro, ISBN_libro)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Empleado_Prestamo (table: Prestamo)
ALTER TABLE Prestamo ADD CONSTRAINT fk_Empleado_Prestamo
    FOREIGN KEY (nro_empleado)
    REFERENCES Empleado (nro_empleado)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Lector_Prestamo (table: Prestamo)
ALTER TABLE Prestamo ADD CONSTRAINT fk_Lector_Prestamo
    FOREIGN KEY (dni_lector)
    REFERENCES Lector (dni_lector)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Lector_Reserva (table: Reserva)
ALTER TABLE Reserva ADD CONSTRAINT fk_Lector_Reserva
    FOREIGN KEY (dni_lector)
    REFERENCES Lector (dni_lector)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Libro_Categoria_Libro (table: Categoria_Libro)
ALTER TABLE Categoria_Libro ADD CONSTRAINT fk_Libro_Categoria_Libro
    FOREIGN KEY (ISBN_libro)
    REFERENCES Libro (ISBN_libro)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Libro_Reserva (table: Reserva)
ALTER TABLE Reserva ADD CONSTRAINT fk_Libro_Reserva
    FOREIGN KEY (ISBN_libro)
    REFERENCES Libro (ISBN_libro)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

