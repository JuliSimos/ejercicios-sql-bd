-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2025-12-12 17:06:53.827

-- tables
-- Table: AUTOR
CREATE TABLE AUTOR (
    cod_catalogo int  NOT NULL,
    autor varchar(100)  NOT NULL,
    CONSTRAINT pk_autor PRIMARY KEY (cod_catalogo)
);

-- Table: CATALOGO_LIBRO
CREATE TABLE CATALOGO_LIBRO (
    cod_catalogo int  NOT NULL,
    titulo varchar(60)  NOT NULL,
    formato varchar(10)  NOT NULL,
    editorial varchar(60)  NOT NULL,
    CONSTRAINT pk_catalogo PRIMARY KEY (cod_catalogo)
);

-- Table: CON_CARNET
CREATE TABLE CON_CARNET (
    id_usuario int  NOT NULL,
    nro_carnet int  NOT NULL,
    CONSTRAINT ak_usuario_con_carnet UNIQUE (nro_carnet) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT pk_usario_con_carnet PRIMARY KEY (id_usuario)
);

-- Table: EJEMPLAR_LIBRO
CREATE TABLE EJEMPLAR_LIBRO (
    cod_catalogo int  NOT NULL,
    nro_ejemplar int  NOT NULL,
    anio_edicion int  NOT NULL,
    nro_edicion int  NOT NULL,
    CONSTRAINT pk_ejemplar_libro PRIMARY KEY (nro_ejemplar,cod_catalogo)
);

-- Table: PRESTAMO
CREATE TABLE PRESTAMO (
    id_prestamo serial  NOT NULL,
    id_usuario int  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    CONSTRAINT pk_prestamo PRIMARY KEY (id_prestamo)
);

-- Table: SIN_CARNET
CREATE TABLE SIN_CARNET (
    id_usuario int  NOT NULL,
    nro_celular varchar(100)  NOT NULL,
    CONSTRAINT pk_usuario_sin_carnet PRIMARY KEY (id_usuario)
);

-- Table: USUARIO
CREATE TABLE USUARIO (
    id_usuario serial  NOT NULL,
    tipo_documento int  NOT NULL,
    nro_documento int  NOT NULL,
    apellido varchar(60)  NOT NULL,
    nombre varchar(60)  NOT NULL,
    e_mail varchar(60)  NOT NULL,
    tipo char(1)  NOT NULL,
    CONSTRAINT ak_usuario UNIQUE (tipo_documento, nro_documento) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT pk_usuario PRIMARY KEY (id_usuario)
);

-- Table: prestamo_libro
CREATE TABLE prestamo_libro (
    id_prestamo int  NOT NULL,
    nro_ejemplar int  NOT NULL,
    cod_catalogo int  NOT NULL,
    CONSTRAINT pk_prestamo_libro PRIMARY KEY (id_prestamo,nro_ejemplar,cod_catalogo)
);

-- foreign keys
-- Reference: fk_autores_catalogo_libro (table: AUTOR)
ALTER TABLE AUTOR ADD CONSTRAINT fk_autores_catalogo_libro
    FOREIGN KEY (cod_catalogo)
    REFERENCES CATALOGO_LIBRO (cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_con_carnet_usuario (table: CON_CARNET)
ALTER TABLE CON_CARNET ADD CONSTRAINT fk_con_carnet_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES USUARIO (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_ejemplar_libro_catalogo_libro (table: EJEMPLAR_LIBRO)
ALTER TABLE EJEMPLAR_LIBRO ADD CONSTRAINT fk_ejemplar_libro_catalogo_libro
    FOREIGN KEY (cod_catalogo)
    REFERENCES CATALOGO_LIBRO (cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_prestamo_con_carnet (table: PRESTAMO)
ALTER TABLE PRESTAMO ADD CONSTRAINT fk_prestamo_con_carnet
    FOREIGN KEY (id_usuario)
    REFERENCES CON_CARNET (nro_carnet)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_prestamo_libro_con_carnet (table: prestamo_libro)
ALTER TABLE prestamo_libro ADD CONSTRAINT fk_prestamo_libro_con_carnet
    FOREIGN KEY (id_prestamo)
    REFERENCES PRESTAMO (id_prestamo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_prestamo_libro_ejemplar_libro (table: prestamo_libro)
ALTER TABLE prestamo_libro ADD CONSTRAINT fk_prestamo_libro_ejemplar_libro
    FOREIGN KEY (nro_ejemplar, cod_catalogo)
    REFERENCES EJEMPLAR_LIBRO (nro_ejemplar, cod_catalogo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_sin_carnet_usuario (table: SIN_CARNET)
ALTER TABLE SIN_CARNET ADD CONSTRAINT fk_sin_carnet_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES USUARIO (id_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

