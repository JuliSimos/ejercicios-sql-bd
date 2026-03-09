-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-03-09 20:09:20.185

-- tables
-- Table: Camion
CREATE TABLE Camion (
    matricula int  NOT NULL,
    modelo varchar(30)  NOT NULL,
    tipo varchar(30)  NOT NULL,
    potencia int  NOT NULL,
    CONSTRAINT pk_Camion PRIMARY KEY (matricula)
);

-- Table: Camionero
CREATE TABLE Camionero (
    dni int  NOT NULL,
    nombre varchar(30)  NOT NULL,
    apellido varchar(30)  NOT NULL,
    telefono varchar(30)  NOT NULL,
    salario decimal  NOT NULL,
    ciudad varchar(60)  NOT NULL,
    direccion_calle varchar(60)  NOT NULL,
    direccion_puerta int  NOT NULL,
    direccion_piso int  NULL,
    CONSTRAINT pk_Camionero PRIMARY KEY (dni)
);

-- Table: Ciudad
CREATE TABLE Ciudad (
    codig_ciudad serial  NOT NULL,
    nombre varchar(100)  NOT NULL,
    CONSTRAINT pk_Ciudad PRIMARY KEY (codig_ciudad)
);

-- Table: Conduce
CREATE TABLE Conduce (
    matricula_camion int  NOT NULL,
    dni_camionero int  NOT NULL,
    fecha_inicio date  NOT NULL,
    fecha_fin date  NOT NULL,
    CONSTRAINT pk_Conduce PRIMARY KEY (matricula_camion,dni_camionero)
);

-- Table: Paquete
CREATE TABLE Paquete (
    codig_paquete serial  NOT NULL,
    dni_camionero int  NOT NULL,
    codig_ciudad int  NOT NULL,
    descripcion varchar(200)  NOT NULL,
    destinatario varchar(60)  NOT NULL,
    direccion_destino varchar(100)  NOT NULL,
    CONSTRAINT pk_Paquete PRIMARY KEY (codig_paquete)
);

-- foreign keys
-- Reference: fk_Camion_Conduce (table: Conduce)
ALTER TABLE Conduce ADD CONSTRAINT fk_Camion_Conduce
    FOREIGN KEY (matricula_camion)
    REFERENCES Camion (matricula)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Camionero_Conduce (table: Conduce)
ALTER TABLE Conduce ADD CONSTRAINT fk_Camionero_Conduce
    FOREIGN KEY (dni_camionero)
    REFERENCES Camionero (dni)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Camionero_Paquete (table: Paquete)
ALTER TABLE Paquete ADD CONSTRAINT fk_Camionero_Paquete
    FOREIGN KEY (dni_camionero)
    REFERENCES Camionero (dni)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Ciudad_Paquete (table: Paquete)
ALTER TABLE Paquete ADD CONSTRAINT fk_Ciudad_Paquete
    FOREIGN KEY (codig_ciudad)
    REFERENCES Ciudad (codig_ciudad)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

