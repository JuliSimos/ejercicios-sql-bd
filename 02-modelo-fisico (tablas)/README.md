### Ejercicio 1
a. Creen las tablas que lo representan.   
  - [Script de Creación de Tablas DDL](02-modelo-fisico%20(tablas)/Tp3_Ej_1.1_create.sql)   
  
b. Realice el borrado de las tablas al inicio del script.
```
DROP TABLE IF EXISTS AUDIO CASCADE;
DROP TABLE IF EXISTS VIDEO CASCADE;
DROP TABLE IF EXISTS DOCUMENTO CASCADE;
DROP TABLE IF EXISTS OBJETO CASCADE;
DROP TABLE IF EXISTS COLECCION CASCADE;
DROP TABLE IF EXISTS REPOSITORIO CASCADE;
  ```   

- Diagrama 1: Modela la información de un repositorios de archivos digitales (audios, videos y documentos) que se encuentran agrupados de acuerdo a su temática en colecciones

<img width="623" height="671" alt="Tp3_Ej_1 1_modeloER" src="https://github.com/user-attachments/assets/5fd6b3f2-8cd9-414a-a5ee-01f1af4b6e0f" />



