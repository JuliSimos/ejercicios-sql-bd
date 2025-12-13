## TP3 - Ejercicio 6: Cambios en las tablas
En el ejercicio 6 del Práctico 02 se decide que para una mejor identificación al Proyecto se le agregue también al nombre como identificador, además se decide que la fase ya no debe ir más en la evaluación del proyecto sino que debería ir en el proyecto mismo.
Genere un script que realice los cambios sugeridos

### Modificar la clave primaria de PROYECTO
1. Hay que eliminar y rehacer las FK de las tablas que dependen de PROYECTO (FASE_EVALUACION y PARTICIPA):

   > Eliminar FKs que apuntan a PROYECTO
   ``` sql
    ALTER TABLE FASE_EVALUACION DROP CONSTRAINT FK_PROYECTO_FASE_EVALUACION;

    ALTER TABLE PARTICIPA DROP CONSTRAINT FK_PROYECTO_PARTICIPA;
   ```

2. Modificar la PK de PROYECTO
   > Eliminar PK
   ``` sql
   ALTER TABLE PROYECTO DROP CONSTRAINT PROYECTO_pk;
   ```
   > Rehacer la PK de proyecto agregando el atributo `nombre`
      ``` sql
    ALTER TABLE PROYECTO ADD CONSTRAINT pk_proyecto PRIMARY KEY (cod_proyecto, nombre);
     ```
      
3. Agregar la fase al PROYECTO
      ``` sql
    ALTER TABLE PROYECTO ADD COLUMN fase varchar(30);
     ```
      
4. Ajustar FASE_EVALUACION a la nueva PK
    ``` sql
    ALTER TABLE FASE_EVALUACION ADD COLUMN nombre_proyecto varchar(60) NOT NULL;
    ```
    > Crear la nueva FK compuesta
    ``` sql
    ALTER TABLE FASE_EVALUACION ADD CONSTRAINT FK_PROYECTO_FASE_EVALUACION
    FOREIGN KEY (cod_proyecto, nombre_proyecto) REFERENCES PROYECTO (cod_proyecto, nombre);
    ```

 5. Ajustar PARTICIPA
     > Agregar nombre del proyecto

    ``` sql
    ALTER TABLE PARTICIPA ADD COLUMN nombre_proyecto varchar(60) NOT NULL;
    ```
      > Nueva FK compuesta

    ``` sql
     ALTER TABLE PARTICIPA ADD CONSTRAINT FK_PROYECTO_PARTICIPA
     FOREIGN KEY (cod_proyecto, nombre_proyecto) REFERENCES PROYECTO (cod_proyecto, nombre);
     ```
