-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-03-05 22:01:31.649

-- tables
-- Table: Audio
CREATE TABLE Audio (
    id_coleccion int  NOT NULL,
    id_objeto int  NOT NULL,
    formato varchar(30)  NOT NULL,
    duracion int  NOT NULL,
    CONSTRAINT Audio_pk PRIMARY KEY (id_objeto,id_coleccion)
);

-- Table: Coleccion
CREATE TABLE Coleccion (
    id_coleccion serial  NOT NULL,
    titulo_coleccion varchar(30)  NOT NULL,
    descripcion varchar(100)  NOT NULL,
    CONSTRAINT Coleccion_pk PRIMARY KEY (id_coleccion)
);

-- Table: Documento
CREATE TABLE Documento (
    id_coleccion int  NOT NULL,
    id_objeto int  NOT NULL,
    tipo_publicacion varchar(30)  NOT NULL,
    modos_color varchar(30)  NOT NULL,
    resolucion_captura int  NOT NULL,
    CONSTRAINT Documento_pk PRIMARY KEY (id_coleccion,id_objeto)
);

-- Table: Objeto
CREATE TABLE Objeto (
    id_coleccion int  NOT NULL,
    id_objeto serial  NOT NULL,
    titulo varchar(60)  NOT NULL,
    descripcion varchar(160)  NOT NULL,
    fuente varchar(50)  NOT NULL,
    fecha date  NOT NULL,
    tipo char(1)  NOT NULL,
    id_repo int  NOT NULL,
    CONSTRAINT Objeto_pk PRIMARY KEY (id_objeto,id_coleccion)
);

-- Table: Repositorio
CREATE TABLE Repositorio (
    id_repo serial  NOT NULL,
    nombre varchar(30)  NOT NULL,
    publico boolean  NOT NULL,
    descripcion varchar(100)  NOT NULL,
    duenio varchar(30)  NULL,
    CONSTRAINT Repositorio_pk PRIMARY KEY (id_repo)
);

-- Table: Video
CREATE TABLE Video (
    id_coleccion int  NOT NULL,
    id_objeto int  NOT NULL,
    resolucion varchar(30)  NOT NULL,
    frames_x_segundo int  NOT NULL,
    CONSTRAINT Video_pk PRIMARY KEY (id_coleccion,id_objeto)
);

-- foreign keys
-- Reference: FK_Coleccion_Objeto (table: Objeto)
ALTER TABLE Objeto ADD CONSTRAINT FK_Coleccion_Objeto
    FOREIGN KEY (id_coleccion)
    REFERENCES Coleccion (id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_Objeto_Audio (table: Audio)
ALTER TABLE Audio ADD CONSTRAINT FK_Objeto_Audio
    FOREIGN KEY (id_objeto, id_coleccion)
    REFERENCES Objeto (id_objeto, id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_Objeto_Documento (table: Documento)
ALTER TABLE Documento ADD CONSTRAINT FK_Objeto_Documento
    FOREIGN KEY (id_objeto, id_coleccion)
    REFERENCES Objeto (id_objeto, id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_Objeto_Video (table: Video)
ALTER TABLE Video ADD CONSTRAINT FK_Objeto_Video
    FOREIGN KEY (id_objeto, id_coleccion)
    REFERENCES Objeto (id_objeto, id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: FK_repositorio_objeto (table: Objeto)
ALTER TABLE Objeto ADD CONSTRAINT FK_repositorio_objeto
    FOREIGN KEY (id_repo)
    REFERENCES Repositorio (id_repo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

