-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2025-12-12 04:36:22.566

-- tables
-- Table: AUDIO
CREATE TABLE AUDIO (
    id_coleccion int  NOT NULL,
    id_objeto int  NOT NULL,
    formato varchar(60)  NOT NULL,
    duracion int  NOT NULL,
    CONSTRAINT AUDIO_pk PRIMARY KEY (id_coleccion,id_objeto)
);

-- Table: COLECCION
CREATE TABLE COLECCION (
    id_coleccion serial  NOT NULL,
    titulo_coleccion varchar(60)  NOT NULL,
    descripcion varchar(160)  NOT NULL,
    CONSTRAINT COLECCION_pk PRIMARY KEY (id_coleccion)
);

-- Table: DOCUMENTO
CREATE TABLE DOCUMENTO (
    id_coleccion int  NOT NULL,
    id_objeto int  NOT NULL,
    tipo_publicacion varchar(30)  NOT NULL,
    modos_color int  NOT NULL,
    resolucion_captura varchar(60)  NOT NULL,
    CONSTRAINT DOCUMENTO_pk PRIMARY KEY (id_coleccion,id_objeto)
);

-- Table: OBJETO
CREATE TABLE OBJETO (
    id_coleccion int  NOT NULL,
    id_objeto serial  NOT NULL,
    id_repo int  NOT NULL,
    titulo varchar(100)  NOT NULL,
    descripcion varchar(160)  NOT NULL,
    fuente varchar(60)  NOT NULL,
    fecha date  NOT NULL,
    tipo char(1)  NOT NULL,
    CONSTRAINT OBJETO_pk PRIMARY KEY (id_objeto,id_coleccion)
);

-- Table: RESPOSITORIO
CREATE TABLE RESPOSITORIO (
    id_repo serial  NOT NULL,
    nombre varchar(60)  NOT NULL,
    publico char(1)  NOT NULL,
    descripcion varchar(60)  NOT NULL,
    propietario varchar(100)  NULL,
    CONSTRAINT RESPOSITORIO_pk PRIMARY KEY (id_repo)
);

-- Table: VIDEO
CREATE TABLE VIDEO (
    id_coleccion int  NOT NULL,
    id_objeto int  NOT NULL,
    resolucion varchar(60)  NOT NULL,
    frames_x_segundo int  NOT NULL,
    CONSTRAINT VIDEO_pk PRIMARY KEY (id_coleccion,id_objeto)
);

-- foreign keys
-- Reference: AUDIO_OBJETO (table: AUDIO)
ALTER TABLE AUDIO ADD CONSTRAINT AUDIO_OBJETO
    FOREIGN KEY (id_objeto, id_coleccion)
    REFERENCES OBJETO (id_objeto, id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: DOCUMENTO_OBJETO (table: DOCUMENTO)
ALTER TABLE DOCUMENTO ADD CONSTRAINT DOCUMENTO_OBJETO
    FOREIGN KEY (id_objeto, id_coleccion)
    REFERENCES OBJETO (id_objeto, id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: OBJETO_COLECCION (table: OBJETO)
ALTER TABLE OBJETO ADD CONSTRAINT OBJETO_COLECCION
    FOREIGN KEY (id_coleccion)
    REFERENCES COLECCION (id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: OBJETO_RESPOSITORIO (table: OBJETO)
ALTER TABLE OBJETO ADD CONSTRAINT OBJETO_RESPOSITORIO
    FOREIGN KEY (id_repo)
    REFERENCES RESPOSITORIO (id_repo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: VIDEO_OBJETO (table: VIDEO)
ALTER TABLE VIDEO ADD CONSTRAINT VIDEO_OBJETO
    FOREIGN KEY (id_objeto, id_coleccion)
    REFERENCES OBJETO (id_objeto, id_coleccion)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

