-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2025-12-12 18:15:15.02

-- tables
-- Table: CLIENTE
CREATE TABLE CLIENTE (
    id_cliente serial  NOT NULL,
    CUIT int  NOT NULL,
    apellido varchar(60)  NOT NULL,
    nombre varchar(60)  NOT NULL,
    direccion_calle varchar(100)  NOT NULL,
    direccion_puerta int  NOT NULL,
    direccion_piso int  NOT NULL,
    email varchar(60)  NULL,
    telefono varchar(60)  NOT NULL,
    id_cliente_garante int  NULL,
    CONSTRAINT ak_garante UNIQUE (id_cliente_garante) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);

-- Table: COMPONENTE_QUIMICO
CREATE TABLE COMPONENTE_QUIMICO (
    id_producto_quimico int  NOT NULL,
    pq_porcentaje decimal  NOT NULL,
    CONSTRAINT pk_componente_quimico PRIMARY KEY (id_producto_quimico)
);

-- Table: ENVIO
CREATE TABLE ENVIO (
    nro_envio int  NOT NULL,
    id_cliente int  NOT NULL,
    id_producto_quimico int  NOT NULL,
    peso decimal  NOT NULL,
    cantidad int  NOT NULL,
    CONSTRAINT pk_envio PRIMARY KEY (nro_envio)
);

-- Table: PQ_LIQUIDO
CREATE TABLE PQ_LIQUIDO (
    id_producto_quimico int  NOT NULL,
    inflamable char(1)  NOT NULL,
    tipo_envace varchar(60)  NOT NULL,
    cond_translado varchar(100)  NULL,
    CONSTRAINT pk_producto_liquido PRIMARY KEY (id_producto_quimico)
);

-- Table: PQ_SOLIDO
CREATE TABLE PQ_SOLIDO (
    id_producto_quimico int  NOT NULL,
    forma varchar(60)  NOT NULL,
    empaque_max int  NOT NULL,
    CONSTRAINT pk_producto_solido PRIMARY KEY (id_producto_quimico)
);

-- Table: PRODUCTO_QUIMICO
CREATE TABLE PRODUCTO_QUIMICO (
    id_producto_quimico serial  NOT NULL,
    id_componente_quimico int  NOT NULL,
    nombre_producto_quimico varchar(150)  NOT NULL,
    formula varchar(100)  NOT NULL,
    CONSTRAINT pk_producto_quimico PRIMARY KEY (id_producto_quimico)
);

-- foreign keys
-- Reference: CLIENTE_CLIENTE (table: CLIENTE)
ALTER TABLE CLIENTE ADD CONSTRAINT CLIENTE_CLIENTE
    FOREIGN KEY (id_cliente_garante)
    REFERENCES CLIENTE (id_cliente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fj_envio_cliente (table: ENVIO)
ALTER TABLE ENVIO ADD CONSTRAINT fj_envio_cliente
    FOREIGN KEY (id_cliente)
    REFERENCES CLIENTE (id_cliente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_componente_quimico_producto_quimico (table: COMPONENTE_QUIMICO)
ALTER TABLE COMPONENTE_QUIMICO ADD CONSTRAINT fk_componente_quimico_producto_quimico
    FOREIGN KEY (id_producto_quimico)
    REFERENCES PRODUCTO_QUIMICO (id_producto_quimico)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_pq_liquido_producto_quimico (table: PQ_LIQUIDO)
ALTER TABLE PQ_LIQUIDO ADD CONSTRAINT fk_pq_liquido_producto_quimico
    FOREIGN KEY (id_producto_quimico)
    REFERENCES PRODUCTO_QUIMICO (id_producto_quimico)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_pq_solido_producto_quimico (table: PQ_SOLIDO)
ALTER TABLE PQ_SOLIDO ADD CONSTRAINT fk_pq_solido_producto_quimico
    FOREIGN KEY (id_producto_quimico)
    REFERENCES PRODUCTO_QUIMICO (id_producto_quimico)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_producto_quimico_componente_quimico (table: PRODUCTO_QUIMICO)
ALTER TABLE PRODUCTO_QUIMICO ADD CONSTRAINT fk_producto_quimico_componente_quimico
    FOREIGN KEY (id_componente_quimico)
    REFERENCES COMPONENTE_QUIMICO (id_producto_quimico)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_producto_quimico_envio (table: ENVIO)
ALTER TABLE ENVIO ADD CONSTRAINT fk_producto_quimico_envio
    FOREIGN KEY (id_producto_quimico)
    REFERENCES PRODUCTO_QUIMICO (id_producto_quimico)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

