-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-03-09 19:29:36.824

-- tables
-- Table: Departamento
CREATE TABLE Departamento (
    cod_depto serial  NOT NULL,
    nombre_depto int  NOT NULL,
    id_jefe int  NOT NULL,
    CONSTRAINT ak_Departamento UNIQUE (nombre_depto) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT pk_Departamento PRIMARY KEY (cod_depto)
);

-- Table: Empleado
CREATE TABLE Empleado (
    nro_empleado serial  NOT NULL,
    nombre varchar(60)  NOT NULL,
    apellido varchar(60)  NOT NULL,
    direccion_calle int  NOT NULL,
    direccion_puerta int  NOT NULL,
    direccion_piso int  NULL,
    direccion_ciudad int  NOT NULL,
    tipo char(1)  NOT NULL,
    cod_depto int  NOT NULL,
    CONSTRAINT ak_Empleado UNIQUE (cod_depto) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT pk_Empleado PRIMARY KEY (nro_empleado)
);

-- Table: Fabricante
CREATE TABLE Fabricante (
    nro_fabricante serial  NOT NULL,
    nombre varchar(30)  NOT NULL,
    direccion varchar(100)  NOT NULL,
    CONSTRAINT pk_Fabricante PRIMARY KEY (nro_fabricante)
);

-- Table: Producto
CREATE TABLE Producto (
    nro_fabricante int  NOT NULL,
    cod_almacen int  NOT NULL,
    nombre varchar(30)  NOT NULL,
    precio decimal  NOT NULL,
    cod_depto int  NOT NULL,
    CONSTRAINT ak_Producto UNIQUE (cod_almacen) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT pk_Producto PRIMARY KEY (nro_fabricante)
);

-- foreign keys
-- Reference: fk_Departamento_Empleado (table: Empleado)
ALTER TABLE Empleado ADD CONSTRAINT fk_Departamento_Empleado
    FOREIGN KEY (cod_depto)
    REFERENCES Departamento (cod_depto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Departamento_Producto (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT fk_Departamento_Producto
    FOREIGN KEY (cod_depto)
    REFERENCES Departamento (cod_depto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Fabricante_Producto (table: Producto)
ALTER TABLE Producto ADD CONSTRAINT fk_Fabricante_Producto
    FOREIGN KEY (nro_fabricante)
    REFERENCES Fabricante (nro_fabricante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Jefe_Departamento (table: Departamento)
ALTER TABLE Departamento ADD CONSTRAINT fk_Jefe_Departamento
    FOREIGN KEY (id_jefe)
    REFERENCES Empleado (nro_empleado)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

