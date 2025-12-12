-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2025-12-12 19:47:36.114

-- tables
-- Table: departamento
CREATE TABLE departamento (
    cod_depto int  NOT NULL,
    nombre_depto varchar(60)  NOT NULL,
    nro_empleado_jefe int  NOT NULL,
    CONSTRAINT ak_departamento UNIQUE (nro_empleado_jefe) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT departamento_pk PRIMARY KEY (cod_depto)
);

-- Table: empleado
CREATE TABLE empleado (
    nro_empleado int  NOT NULL,
    nombre varchar(60)  NOT NULL,
    apellido varchar(60)  NOT NULL,
    direccion_calle varchar(60)  NOT NULL,
    direccion_puerta int  NOT NULL,
    direccion_piso int  NULL,
    direccion_ciudad varchar(60)  NOT NULL,
    cod_depto int  NULL,
    nro_empleado_supervisor int  NULL,
    CONSTRAINT empleado_pk PRIMARY KEY (nro_empleado)
);

-- Table: fabricante
CREATE TABLE fabricante (
    nro_fabricante int  NOT NULL,
    nombre varchar(60)  NOT NULL,
    direccion varchar(100)  NOT NULL,
    CONSTRAINT fabricante_pk PRIMARY KEY (nro_fabricante)
);

-- Table: producto
CREATE TABLE producto (
    id_producto int  NOT NULL,
    nro_almacen int  NOT NULL,
    nombre varchar(60)  NOT NULL,
    precio int  NOT NULL,
    cod_depto int  NOT NULL,
    nro_fabricante int  NOT NULL,
    CONSTRAINT ak_producto UNIQUE (nro_almacen) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT producto_pk PRIMARY KEY (id_producto)
);

-- foreign keys
-- Reference: FK_DEPARTAMENTO_EMPLEADO (table: empleado)
ALTER TABLE empleado ADD CONSTRAINT FK_DEPARTAMENTO_EMPLEADO
    FOREIGN KEY (cod_depto)
    REFERENCES departamento (cod_depto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_DEPARTAMENTO_PRODUCTO (table: producto)
ALTER TABLE producto ADD CONSTRAINT FK_DEPARTAMENTO_PRODUCTO
    FOREIGN KEY (cod_depto)
    REFERENCES departamento (cod_depto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_EMPLEADO_DEPARTAMENTO (table: departamento)
ALTER TABLE departamento ADD CONSTRAINT FK_EMPLEADO_DEPARTAMENTO
    FOREIGN KEY (nro_empleado_jefe)
    REFERENCES empleado (nro_empleado)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_EMPLEADO_SUPERVISOR (table: empleado)
ALTER TABLE empleado ADD CONSTRAINT FK_EMPLEADO_SUPERVISOR
    FOREIGN KEY (nro_empleado_supervisor)
    REFERENCES empleado (nro_empleado)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_FABRICANTE_PRODUCTO (table: producto)
ALTER TABLE producto ADD CONSTRAINT FK_FABRICANTE_PRODUCTO
    FOREIGN KEY (nro_fabricante)
    REFERENCES fabricante (nro_fabricante)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

