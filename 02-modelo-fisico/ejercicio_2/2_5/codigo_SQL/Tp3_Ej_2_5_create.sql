-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2025-12-12 21:38:42.977

-- tables
-- Table: CATEGORIA
CREATE TABLE CATEGORIA (
    id_categoria serial  NOT NULL,
    nombre int  NOT NULL,
    CONSTRAINT ak_categoria UNIQUE (nombre) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT CATEGORIA_pk PRIMARY KEY (id_categoria)
);

-- Table: CATEGORIA_LIBRO
CREATE TABLE CATEGORIA_LIBRO (
    ISBN_libro int  NOT NULL,
    id_categoria int  NOT NULL,
    CONSTRAINT CATEGORIA_LIBRO_pk PRIMARY KEY (ISBN_libro,id_categoria)
);

-- Table: COPIA_LIBRO
CREATE TABLE COPIA_LIBRO (
    ISBN_libro int  NOT NULL,
    nro_ejemplar int  NOT NULL,
    fecha_edicion date  NOT NULL,
    nro_edicion int  NOT NULL,
    estanteria int  NOT NULL,
    CONSTRAINT ak_copia_libro UNIQUE (nro_ejemplar) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT COPIA_LIBRO_pk PRIMARY KEY (nro_ejemplar,ISBN_libro)
);

-- Table: EMPLEADO
CREATE TABLE EMPLEADO (
    dni_empleado int  NOT NULL,
    nombre varchar(60)  NOT NULL,
    cargo varchar(30)  NOT NULL,
    entrada_horaria time  NOT NULL,
    salida_horaria time  NOT NULL,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY (dni_empleado)
);

-- Table: LECTOR
CREATE TABLE LECTOR (
    dni_lector int  NOT NULL,
    nombre varchar(60)  NOT NULL,
    telefono varchar(60)  NOT NULL,
    direccion varchar(60)  NOT NULL,
    email varchar(60)  NOT NULL,
    CONSTRAINT LECTOR_pk PRIMARY KEY (dni_lector)
);

-- Table: LIBRO
CREATE TABLE LIBRO (
    ISBN_libro serial  NOT NULL,
    titulo varchar(100)  NOT NULL,
    autor varchar(60)  NOT NULL,
    editoria varchar(60)  NOT NULL,
    fecha_publicacion date  NOT NULL,
    genero varchar(60)  NOT NULL,
    CONSTRAINT LIBRO_pk PRIMARY KEY (ISBN_libro)
);

-- Table: PRESTAMO
CREATE TABLE PRESTAMO (
    id_prestamo serial  NOT NULL,
    fecha_inicio date  NOT NULL,
    fecha_devolucion date  NOT NULL,
    nro_ejemplar int  NOT NULL,
    ISBN_libro int  NOT NULL,
    dni_lector int  NOT NULL,
    dni_empleado int  NOT NULL,
    CONSTRAINT ak_prestamo UNIQUE (nro_ejemplar, ISBN_libro) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT PRESTAMO_pk PRIMARY KEY (id_prestamo)
);

-- Table: RESERVA
CREATE TABLE RESERVA (
    id_reserva serial  NOT NULL,
    fecha_inicio date  NOT NULL,
    fecha_fin date  NOT NULL,
    estado varchar(30)  NOT NULL,
    dni_lector int  NOT NULL,
    CONSTRAINT RESERVA_pk PRIMARY KEY (id_reserva)
);

-- Table: RESERVA_LIBRO
CREATE TABLE RESERVA_LIBRO (
    id_reserva int  NOT NULL,
    ISBN_libro int  NOT NULL,
    CONSTRAINT RESERVA_LIBRO_pk PRIMARY KEY (id_reserva,ISBN_libro)
);

-- foreign keys
-- Reference: FK_CATEGORIA_CATEGORIA_LIBRO (table: CATEGORIA_LIBRO)
ALTER TABLE CATEGORIA_LIBRO ADD CONSTRAINT FK_CATEGORIA_CATEGORIA_LIBRO
    FOREIGN KEY (id_categoria)
    REFERENCES CATEGORIA (id_categoria)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_COPIA_LIBRO_PRESTAMO (table: PRESTAMO)
ALTER TABLE PRESTAMO ADD CONSTRAINT FK_COPIA_LIBRO_PRESTAMO
    FOREIGN KEY (nro_ejemplar, ISBN_libro)
    REFERENCES COPIA_LIBRO (nro_ejemplar, ISBN_libro)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_EMPLEADO_PRESTAMO (table: PRESTAMO)
ALTER TABLE PRESTAMO ADD CONSTRAINT FK_EMPLEADO_PRESTAMO
    FOREIGN KEY (dni_empleado)
    REFERENCES EMPLEADO (dni_empleado)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_LECTOR_PRESTAMO (table: PRESTAMO)
ALTER TABLE PRESTAMO ADD CONSTRAINT FK_LECTOR_PRESTAMO
    FOREIGN KEY (dni_lector)
    REFERENCES LECTOR (dni_lector)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_LECTOR_RESERVA (table: RESERVA)
ALTER TABLE RESERVA ADD CONSTRAINT FK_LECTOR_RESERVA
    FOREIGN KEY (dni_lector)
    REFERENCES LECTOR (dni_lector)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_LIBRO_CATEGORIA_LIBRO (table: CATEGORIA_LIBRO)
ALTER TABLE CATEGORIA_LIBRO ADD CONSTRAINT FK_LIBRO_CATEGORIA_LIBRO
    FOREIGN KEY (ISBN_libro)
    REFERENCES LIBRO (ISBN_libro)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_LIBRO_COPIA_LIBRO (table: COPIA_LIBRO)
ALTER TABLE COPIA_LIBRO ADD CONSTRAINT FK_LIBRO_COPIA_LIBRO
    FOREIGN KEY (ISBN_libro)
    REFERENCES LIBRO (ISBN_libro)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_LIBRO_RESERVA_LIBRO (table: RESERVA_LIBRO)
ALTER TABLE RESERVA_LIBRO ADD CONSTRAINT FK_LIBRO_RESERVA_LIBRO
    FOREIGN KEY (ISBN_libro)
    REFERENCES LIBRO (ISBN_libro)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_RESERVA_RESERVA_LIBRO (table: RESERVA_LIBRO)
ALTER TABLE RESERVA_LIBRO ADD CONSTRAINT FK_RESERVA_RESERVA_LIBRO
    FOREIGN KEY (id_reserva)
    REFERENCES RESERVA (id_reserva)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

