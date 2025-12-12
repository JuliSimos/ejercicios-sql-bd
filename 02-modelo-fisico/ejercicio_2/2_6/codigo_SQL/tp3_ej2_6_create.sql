-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2025-12-12 22:10:59.269

-- tables
-- Table: CLIENTE
CREATE TABLE CLIENTE (
    cod_cliente int  NOT NULL,
    nombre int  NOT NULL,
    email int  NOT NULL,
    telefono int  NOT NULL,
    monto_total int  NOT NULL,
    fecha_inicio_contrato int  NOT NULL,
    CONSTRAINT CLIENTE_pk PRIMARY KEY (cod_cliente)
);

-- Table: EMPLEADO
CREATE TABLE EMPLEADO (
    dni_empleado int  NOT NULL,
    nombre varchar(60)  NOT NULL,
    apellido varchar(60)  NOT NULL,
    cargo varchar(60)  NOT NULL,
    especialidad varchar(60)  NOT NULL,
    email varchar(60)  NOT NULL,
    fecha_contratacion date  NOT NULL,
    salario decimal  NOT NULL,
    tipo_contrato varchar(30)  NOT NULL,
    cod_equipo int  NOT NULL,
    CONSTRAINT ak_empleado UNIQUE (cod_equipo) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT EMPLEADO_pk PRIMARY KEY (dni_empleado)
);

-- Table: EQUIPO
CREATE TABLE EQUIPO (
    cod_equipo int  NOT NULL,
    nombre int  NOT NULL,
    dni_empleado_lider int  NOT NULL,
    CONSTRAINT ak_equipo UNIQUE (dni_empleado_lider) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT EQUIPO_pk PRIMARY KEY (cod_equipo)
);

-- Table: FASE_EVALUACION
CREATE TABLE FASE_EVALUACION (
    cod_proyecto int  NOT NULL,
    fecha_evaluacion date  NOT NULL,
    cod_equipo int  NOT NULL,
    resultado varchar(10)  NOT NULL,
    CONSTRAINT FASE_EVALUACION_pk PRIMARY KEY (cod_proyecto,fecha_evaluacion)
);

-- Table: PARTICIPA
CREATE TABLE PARTICIPA (
    dni_empleado int  NOT NULL,
    cod_proyecto int  NOT NULL,
    CONSTRAINT PARTICIPA_pk PRIMARY KEY (dni_empleado,cod_proyecto)
);

-- Table: PROYECTO
CREATE TABLE PROYECTO (
    cod_proyecto int  NOT NULL,
    nombre int  NOT NULL,
    descripcion int  NOT NULL,
    tipo_proyecto int  NOT NULL,
    fecha_inicio int  NOT NULL,
    fecha_fin int  NOT NULL,
    estado_proyecto int  NOT NULL,
    presupuesto_asignado int  NOT NULL,
    cod_cliente int  NULL,
    cod_equipo int  NOT NULL,
    CONSTRAINT PROYECTO_pk PRIMARY KEY (cod_proyecto)
);

-- foreign keys
-- Reference: FK_CLIENTE_PROYECTO (table: PROYECTO)
ALTER TABLE PROYECTO ADD CONSTRAINT FK_CLIENTE_PROYECTO
    FOREIGN KEY (cod_cliente)
    REFERENCES CLIENTE (cod_cliente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_EMPLEADO_EQUIPO (table: EQUIPO)
ALTER TABLE EQUIPO ADD CONSTRAINT FK_EMPLEADO_EQUIPO
    FOREIGN KEY (dni_empleado_lider)
    REFERENCES EMPLEADO (dni_empleado)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_EMPLEADO_PARTICIPA (table: PARTICIPA)
ALTER TABLE PARTICIPA ADD CONSTRAINT FK_EMPLEADO_PARTICIPA
    FOREIGN KEY (dni_empleado)
    REFERENCES EMPLEADO (dni_empleado)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_EQUIPO_EMPLEADO (table: EMPLEADO)
ALTER TABLE EMPLEADO ADD CONSTRAINT FK_EQUIPO_EMPLEADO
    FOREIGN KEY (cod_equipo)
    REFERENCES EQUIPO (cod_equipo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_EQUIPO_FASE_EVALUACION (table: FASE_EVALUACION)
ALTER TABLE FASE_EVALUACION ADD CONSTRAINT FK_EQUIPO_FASE_EVALUACION
    FOREIGN KEY (cod_equipo)
    REFERENCES EQUIPO (cod_equipo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_EQUIPO_PROYECTO (table: PROYECTO)
ALTER TABLE PROYECTO ADD CONSTRAINT FK_EQUIPO_PROYECTO
    FOREIGN KEY (cod_equipo)
    REFERENCES EQUIPO (cod_equipo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_PROYECTO_FASE_EVALUACION (table: FASE_EVALUACION)
ALTER TABLE FASE_EVALUACION ADD CONSTRAINT FK_PROYECTO_FASE_EVALUACION
    FOREIGN KEY (cod_proyecto)
    REFERENCES PROYECTO (cod_proyecto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_PROYECTO_PARTICIPA (table: PARTICIPA)
ALTER TABLE PARTICIPA ADD CONSTRAINT FK_PROYECTO_PARTICIPA
    FOREIGN KEY (cod_proyecto)
    REFERENCES PROYECTO (cod_proyecto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

