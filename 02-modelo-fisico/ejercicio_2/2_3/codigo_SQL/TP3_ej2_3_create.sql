-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2025-12-12 20:06:06.778

-- tables
-- Table: CAMION
CREATE TABLE CAMION (
    matricula int  NOT NULL,
    modelo varchar(30)  NOT NULL,
    tipo int  NOT NULL,
    potencia int  NOT NULL,
    CONSTRAINT CAMION_pk PRIMARY KEY (matricula)
);

-- Table: CAMIONERO
CREATE TABLE CAMIONERO (
    DNI int  NOT NULL,
    nombre varchar(30)  NOT NULL,
    telefono varchar(30)  NOT NULL,
    direccion_calle varchar(60)  NOT NULL,
    direccion_puerta int  NOT NULL,
    direccion_piso int  NULL,
    salario decimal  NOT NULL,
    ciudad varchar(60)  NOT NULL,
    CONSTRAINT CAMIONERO_pk PRIMARY KEY (DNI)
);

-- Table: CIUDAD
CREATE TABLE CIUDAD (
    cod_ciudad serial  NOT NULL,
    nombre_ciudad varchar(60)  NOT NULL,
    CONSTRAINT CIUDAD_pk PRIMARY KEY (cod_ciudad)
);

-- Table: CONDUCE
CREATE TABLE CONDUCE (
    dni_camionero int  NOT NULL,
    matricula_camion int  NOT NULL,
    fecha_inicio date  NOT NULL,
    fecha_fin date  NOT NULL,
    CONSTRAINT CONDUCE_pk PRIMARY KEY (matricula_camion,dni_camionero)
);

-- Table: PAQUETE
CREATE TABLE PAQUETE (
    cod_paquete serial  NOT NULL,
    descripcion varchar(100)  NOT NULL,
    destinatario varchar(60)  NOT NULL,
    direccion_destino varchar(100)  NOT NULL,
    cod_ciudad int  NOT NULL,
    dni_camionero int  NOT NULL,
    CONSTRAINT PAQUETE_pk PRIMARY KEY (cod_paquete)
);

-- foreign keys
-- Reference: FK_CAMIONERO_CONDUCE (table: CONDUCE)
ALTER TABLE CONDUCE ADD CONSTRAINT FK_CAMIONERO_CONDUCE
    FOREIGN KEY (dni_camionero)
    REFERENCES CAMIONERO (DNI)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_CAMIONERO_PAQUETE (table: PAQUETE)
ALTER TABLE PAQUETE ADD CONSTRAINT FK_CAMIONERO_PAQUETE
    FOREIGN KEY (dni_camionero)
    REFERENCES CAMIONERO (DNI)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_CIUDAD_PAQUETE (table: PAQUETE)
ALTER TABLE PAQUETE ADD CONSTRAINT FK_CIUDAD_PAQUETE
    FOREIGN KEY (cod_ciudad)
    REFERENCES CIUDAD (cod_ciudad)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_CONDUCE_CAMION (table: CONDUCE)
ALTER TABLE CONDUCE ADD CONSTRAINT FK_CONDUCE_CAMION
    FOREIGN KEY (matricula_camion)
    REFERENCES CAMION (matricula)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

