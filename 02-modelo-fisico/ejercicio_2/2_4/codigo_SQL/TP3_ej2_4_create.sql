-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-03-09 20:58:52.891

-- tables
-- Table: Cuida
CREATE TABLE Cuida (
    dni_infante int  NOT NULL,
    dni_cuidador int  NOT NULL,
    CONSTRAINT pk_Cuida PRIMARY KEY (dni_infante,dni_cuidador)
);

-- Table: Cuidador
CREATE TABLE Cuidador (
    dni_cuidador int  NOT NULL,
    nombre varchar(30)  NOT NULL,
    apellido varchar(30)  NOT NULL,
    nombre_institucion varchar(100)  NOT NULL,
    CONSTRAINT pk_Cuidador PRIMARY KEY (dni_cuidador)
);

-- Table: Enfermedad_Actual
CREATE TABLE Enfermedad_Actual (
    dni_infante int  NOT NULL,
    nombre_enfermedad varchar(100)  NOT NULL,
    CONSTRAINT pk_Enfermedad_actual PRIMARY KEY (dni_infante,nombre_enfermedad)
);

-- Table: Enfermedad_Pasada
CREATE TABLE Enfermedad_Pasada (
    dni_infante int  NOT NULL,
    nombre_enfermedad varchar(100)  NOT NULL,
    CONSTRAINT pk_Enfermedad_pasada PRIMARY KEY (dni_infante,nombre_enfermedad)
);

-- Table: Infante
CREATE TABLE Infante (
    dni_infante int  NOT NULL,
    nombre_institucion varchar(100)  NOT NULL,
    nombre varchar(30)  NOT NULL,
    apellido varchar(30)  NOT NULL,
    fecha_nacimiento date  NOT NULL,
    lugar_nacimiento varchar(60)  NOT NULL,
    nombre_completo_padre varchar(100)  NOT NULL,
    nombre_completo_madre varchar(100)  NOT NULL,
    fecha_retorno date  NULL,
    cuidados_especiales boolean  NOT NULL,
    CONSTRAINT pk_Infante PRIMARY KEY (dni_infante)
);

-- Table: Institucion
CREATE TABLE Institucion (
    nombre_institucion varchar(100)  NOT NULL,
    pais varchar(60)  NOT NULL,
    region varchar(60)  NOT NULL,
    ciudad varchar(60)  NOT NULL,
    CONSTRAINT pk_Institucion PRIMARY KEY (nombre_institucion)
);

-- Table: Pariente
CREATE TABLE Pariente (
    dni_infante int  NOT NULL,
    nombre varchar(30)  NOT NULL,
    apellido varchar(30)  NOT NULL,
    relacion varchar(30)  NOT NULL,
    CONSTRAINT pk_Pariente PRIMARY KEY (dni_infante,nombre,apellido)
);

-- foreign keys
-- Reference: Cuida_Cuidador (table: Cuida)
ALTER TABLE Cuida ADD CONSTRAINT Cuida_Cuidador
    FOREIGN KEY (dni_cuidador)
    REFERENCES Cuidador (dni_cuidador)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Infante_Cuida (table: Cuida)
ALTER TABLE Cuida ADD CONSTRAINT fk_Infante_Cuida
    FOREIGN KEY (dni_infante)
    REFERENCES Infante (dni_infante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Infante_Enfermedad_Actual (table: Enfermedad_Actual)
ALTER TABLE Enfermedad_Actual ADD CONSTRAINT fk_Infante_Enfermedad_Actual
    FOREIGN KEY (dni_infante)
    REFERENCES Infante (dni_infante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Infante_Enfermedad_Pasada (table: Enfermedad_Pasada)
ALTER TABLE Enfermedad_Pasada ADD CONSTRAINT fk_Infante_Enfermedad_Pasada
    FOREIGN KEY (dni_infante)
    REFERENCES Infante (dni_infante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Infante_Pariente (table: Pariente)
ALTER TABLE Pariente ADD CONSTRAINT fk_Infante_Pariente
    FOREIGN KEY (dni_infante)
    REFERENCES Infante (dni_infante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Institucion_Cuidador (table: Cuidador)
ALTER TABLE Cuidador ADD CONSTRAINT fk_Institucion_Cuidador
    FOREIGN KEY (nombre_institucion)
    REFERENCES Institucion (nombre_institucion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Institucion_Infante (table: Infante)
ALTER TABLE Infante ADD CONSTRAINT fk_Institucion_Infante
    FOREIGN KEY (nombre_institucion)
    REFERENCES Institucion (nombre_institucion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

