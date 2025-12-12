-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2025-12-12 20:37:33.26

-- tables
-- Table: CUIDADOR
CREATE TABLE CUIDADOR (
    dni_cuidador int  NOT NULL,
    nombre int  NOT NULL,
    apellido int  NOT NULL,
    id_insitucion int  NOT NULL,
    CONSTRAINT CUIDADOR_pk PRIMARY KEY (dni_cuidador)
);

-- Table: ENFERMEDADES_ACTUALES
CREATE TABLE ENFERMEDADES_ACTUALES (
    dni_infante int  NOT NULL,
    nombre_enfermedad varchar(60)  NOT NULL,
    CONSTRAINT ENFERMEDADES_ACTUALES_pk PRIMARY KEY (dni_infante)
);

-- Table: ENFERMEDADES_PASADAS
CREATE TABLE ENFERMEDADES_PASADAS (
    dni_infante int  NOT NULL,
    nombre_enfermedad varchar(60)  NOT NULL,
    CONSTRAINT ENFERMEDADES_PASADAS_pk PRIMARY KEY (dni_infante)
);

-- Table: INFANTE
CREATE TABLE INFANTE (
    dni_infante int  NOT NULL,
    nombre varchar(60)  NOT NULL,
    apellido varchar(60)  NOT NULL,
    fecha_nac date  NOT NULL,
    lugar_nac varchar(60)  NOT NULL,
    nombre_padre varchar(60)  NOT NULL,
    apellido_padre varchar(60)  NOT NULL,
    nombre_madre varchar(60)  NOT NULL,
    apellido_madre varchar(60)  NOT NULL,
    fecha_retorno date  NULL,
    ciudados_especiales varchar(200)  NULL,
    dni_cuidador int  NOT NULL,
    CONSTRAINT INFANTE_pk PRIMARY KEY (dni_infante)
);

-- Table: INSTITUCION
CREATE TABLE INSTITUCION (
    id_insitucion serial  NOT NULL,
    nombre varchar(100)  NOT NULL,
    pais varchar(60)  NOT NULL,
    region varchar(60)  NOT NULL,
    ciudad varchar(60)  NOT NULL,
    CONSTRAINT ak_institucion UNIQUE (nombre) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT INSTITUCION_pk PRIMARY KEY (id_insitucion)
);

-- Table: Inscripto
CREATE TABLE Inscripto (
    dni_infante int  NOT NULL,
    id_insitucion int  NOT NULL,
    CONSTRAINT Inscripto_pk PRIMARY KEY (dni_infante,id_insitucion)
);

-- Table: PARIENTE
CREATE TABLE PARIENTE (
    dni_infante int  NOT NULL,
    nombre varchar(60)  NOT NULL,
    apellido varchar(60)  NOT NULL,
    relacion varchar(60)  NOT NULL,
    CONSTRAINT PARIENTE_pk PRIMARY KEY (dni_infante,nombre,apellido)
);

-- foreign keys
-- Reference: FK_CUIDADOR_INFANTE (table: INFANTE)
ALTER TABLE INFANTE ADD CONSTRAINT FK_CUIDADOR_INFANTE
    FOREIGN KEY (dni_cuidador)
    REFERENCES CUIDADOR (dni_cuidador)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_INFANTE_ENFERMEDADES_ACTUALES (table: ENFERMEDADES_ACTUALES)
ALTER TABLE ENFERMEDADES_ACTUALES ADD CONSTRAINT FK_INFANTE_ENFERMEDADES_ACTUALES
    FOREIGN KEY (dni_infante)
    REFERENCES INFANTE (dni_infante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_INFANTE_ENFERMEDADES_PASADAS (table: ENFERMEDADES_PASADAS)
ALTER TABLE ENFERMEDADES_PASADAS ADD CONSTRAINT FK_INFANTE_ENFERMEDADES_PASADAS
    FOREIGN KEY (dni_infante)
    REFERENCES INFANTE (dni_infante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_INFANTE_PARIENTE (table: PARIENTE)
ALTER TABLE PARIENTE ADD CONSTRAINT FK_INFANTE_PARIENTE
    FOREIGN KEY (dni_infante)
    REFERENCES INFANTE (dni_infante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_INSTITUCION_CUIDADOR (table: CUIDADOR)
ALTER TABLE CUIDADOR ADD CONSTRAINT FK_INSTITUCION_CUIDADOR
    FOREIGN KEY (id_insitucion)
    REFERENCES INSTITUCION (id_insitucion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_INSTITUCION_INSCRIPTO (table: Inscripto)
ALTER TABLE Inscripto ADD CONSTRAINT FK_INSTITUCION_INSCRIPTO
    FOREIGN KEY (id_insitucion)
    REFERENCES INSTITUCION (id_insitucion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FL_INFANTE_INSCRIPTO (table: Inscripto)
ALTER TABLE Inscripto ADD CONSTRAINT FL_INFANTE_INSCRIPTO
    FOREIGN KEY (dni_infante)
    REFERENCES INFANTE (dni_infante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

