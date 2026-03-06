-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-03-06 03:55:00.98

-- tables
-- Table: Autor
CREATE TABLE Autor (
    cod_catalogo int  NOT NULL,
    nombre_autor varchar(30)  NOT NULL,
    CONSTRAINT Autor_pk PRIMARY KEY (cod_catalogo)
);

-- Table: Catalogo_libro
CREATE TABLE Catalogo_libro (
    cod_catalogo serial  NOT NULL,
    titulo varchar(60)  NOT NULL,
    formato varchar(30)  NOT NULL,
    editorial varchar(60)  NOT NULL,
    CONSTRAINT Catalogo_libro_pk PRIMARY KEY (cod_catalogo)
);

-- Table: Con_carnet
CREATE TABLE Con_carnet (
    id_usuario int  NOT NULL,
    nro_carnet int  NOT NULL,
    CONSTRAINT Con_carnet_pk PRIMARY KEY (id_usuario)
);

-- Table: Ejemplar_libro
CREATE TABLE Ejemplar_libro (
    cod_catalogo int  NOT NULL,
    nro_ejemplar int  NOT NULL,
    anio_edicion int  NOT NULL,
    nro_edicion int  NOT NULL,
    CONSTRAINT Ejemplar_libro_pk PRIMARY KEY (nro_ejemplar,cod_catalogo)
);

-- Table: Prestamo
CREATE TABLE Prestamo (
    id_prestamo int  NOT NULL,
    id_usuario int  NOT NULL,
    fecha_desde int  NOT NULL,
    fecha_hasta int  NOT NULL,
    CONSTRAINT Prestamo_pk PRIMARY KEY (id_prestamo)
);

-- Table: Sin_carnet
CREATE TABLE Sin_carnet (
    id_usuario int  NOT NULL,
    nro_celular varchar(100)  NOT NULL,
    CONSTRAINT Sin_carnet_pk PRIMARY KEY (id_usuario)
);

-- Table: Usuario
CREATE TABLE Usuario (
    id_usuario serial  NOT NULL,
    tipo_doc varchar(30)  NOT NULL,
    nro_doc int  NOT NULL,
    apellido varchar(30)  NOT NULL,
    nombre varchar(30)  NOT NULL,
    e_mail varchar(60)  NOT NULL,
    CONSTRAINT ak_usuario UNIQUE (tipo_doc, nro_doc) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario)
);

-- Table: prestamo_libro
CREATE TABLE prestamo_libro (
    id_prestamo int  NOT NULL,
    nro_ejemplar int  NOT NULL,
    cod_catalogo int  NOT NULL,
    CONSTRAINT prestamo_libro_pk PRIMARY KEY (id_prestamo,nro_ejemplar,cod_catalogo)
);

-- foreign keys
-- Reference: Autor_Catalogo_libro (table: Autor)
ALTER TABLE Autor ADD CONSTRAINT Autor_Catalogo_libro
    FOREIGN KEY (cod_catalogo)
    REFERENCES Catalogo_libro (cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Catalogo_libro_Ejemplar_libro (table: Ejemplar_libro)
ALTER TABLE Ejemplar_libro ADD CONSTRAINT fk_Catalogo_libro_Ejemplar_libro
    FOREIGN KEY (cod_catalogo)
    REFERENCES Catalogo_libro (cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Con_carnet_Prestamo (table: Prestamo)
ALTER TABLE Prestamo ADD CONSTRAINT fk_Con_carnet_Prestamo
    FOREIGN KEY (id_usuario)
    REFERENCES Con_carnet (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Prestamo_prestamo_libro (table: prestamo_libro)
ALTER TABLE prestamo_libro ADD CONSTRAINT fk_Prestamo_prestamo_libro
    FOREIGN KEY (id_prestamo)
    REFERENCES Prestamo (id_prestamo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Usuario_Con_carnet (table: Con_carnet)
ALTER TABLE Con_carnet ADD CONSTRAINT fk_Usuario_Con_carnet
    FOREIGN KEY (id_usuario)
    REFERENCES Usuario (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Usuario_Sin_carnet (table: Sin_carnet)
ALTER TABLE Sin_carnet ADD CONSTRAINT fk_Usuario_Sin_carnet
    FOREIGN KEY (id_usuario)
    REFERENCES Usuario (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_ejemplar_libro_prestamo_libro (table: prestamo_libro)
ALTER TABLE prestamo_libro ADD CONSTRAINT fk_ejemplar_libro_prestamo_libro
    FOREIGN KEY (nro_ejemplar, cod_catalogo)
    REFERENCES Ejemplar_libro (nro_ejemplar, cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

