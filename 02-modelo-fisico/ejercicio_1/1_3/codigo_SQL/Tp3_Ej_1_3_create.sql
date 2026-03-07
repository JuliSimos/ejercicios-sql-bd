-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-03-07 22:56:31.154

-- tables
-- Table: Cliente
CREATE TABLE Cliente (
    id_cliente serial  NOT NULL,
    CUIT int  NOT NULL,
    apellido varchar(30)  NOT NULL,
    nombre varchar(30)  NOT NULL,
    direccion_calle varchar(60)  NOT NULL,
    direccion_puerta int  NOT NULL,
    direccion_piso int  NOT NULL,
    email varchar(100)  NULL,
    telefono varchar(60)  NOT NULL,
    id_garante int  NULL,
    CONSTRAINT ak_Cliente UNIQUE (CUIT) NOT DEFERRABLE  INITIALLY IMMEDIATE,
    CONSTRAINT Cliente_pk PRIMARY KEY (id_cliente)
);

-- Table: Compone_prod_quim
CREATE TABLE Compone_prod_quim (
    id_prod_quim int  NOT NULL,
    id_prod_componente int  NOT NULL,
    porcentaje decimal  NOT NULL,
    CONSTRAINT Compone_prod_quim_pk PRIMARY KEY (id_prod_quim,id_prod_componente)
);

-- Table: Envio
CREATE TABLE Envio (
    nro_envio serial  NOT NULL,
    id_cliente int  NOT NULL,
    id_prod_quim int  NOT NULL,
    peso decimal  NOT NULL,
    cantidad int  NOT NULL,
    CONSTRAINT Envio_pk PRIMARY KEY (nro_envio)
);

-- Table: Pq_liquido
CREATE TABLE Pq_liquido (
    id_prod_quim int  NOT NULL,
    inflamable boolean  NOT NULL,
    tipo_envace varchar(30)  NOT NULL,
    cond_translado varchar(60)  NULL,
    CONSTRAINT Pq_liquido_pk PRIMARY KEY (id_prod_quim)
);

-- Table: Pq_solido
CREATE TABLE Pq_solido (
    id_prod_quim int  NOT NULL,
    formula varchar(100)  NOT NULL,
    empaque_max int  NOT NULL,
    CONSTRAINT Pq_solido_pk PRIMARY KEY (id_prod_quim)
);

-- Table: Producto_quimico
CREATE TABLE Producto_quimico (
    id_prod_quim serial  NOT NULL,
    nombre_prod_quim varchar(100)  NOT NULL,
    formula varchar(200)  NOT NULL,
    tipo char(1)  NOT NULL,
    CONSTRAINT Producto_quimico_pk PRIMARY KEY (id_prod_quim)
);

-- foreign keys
-- Reference: fk_Cliente_Envio (table: Envio)
ALTER TABLE Envio ADD CONSTRAINT fk_Cliente_Envio
    FOREIGN KEY (id_cliente)
    REFERENCES Cliente (id_cliente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Cliente_Garante (table: Cliente)
ALTER TABLE Cliente ADD CONSTRAINT fk_Cliente_Garante
    FOREIGN KEY (id_garante)
    REFERENCES Cliente (id_cliente)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Compone_Prod_Quim (table: Compone_prod_quim)
ALTER TABLE Compone_prod_quim ADD CONSTRAINT fk_Compone_Prod_Quim
    FOREIGN KEY (id_prod_componente)
    REFERENCES Producto_quimico (id_prod_quim)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Producto_quimico_Compone (table: Compone_prod_quim)
ALTER TABLE Compone_prod_quim ADD CONSTRAINT fk_Producto_quimico_Compone
    FOREIGN KEY (id_prod_quim)
    REFERENCES Producto_quimico (id_prod_quim)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Producto_quimico_Envio (table: Envio)
ALTER TABLE Envio ADD CONSTRAINT fk_Producto_quimico_Envio
    FOREIGN KEY (id_prod_quim)
    REFERENCES Producto_quimico (id_prod_quim)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Producto_quimico_Pq_liquido (table: Pq_liquido)
ALTER TABLE Pq_liquido ADD CONSTRAINT fk_Producto_quimico_Pq_liquido
    FOREIGN KEY (id_prod_quim)
    REFERENCES Producto_quimico (id_prod_quim)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: fk_Producto_quimico_Pq_solido (table: Pq_solido)
ALTER TABLE Pq_solido ADD CONSTRAINT fk_Producto_quimico_Pq_solido
    FOREIGN KEY (id_prod_quim)
    REFERENCES Producto_quimico (id_prod_quim)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

