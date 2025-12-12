# Ejercicio 1.2 –> Prestamos de una biblioteca

> **Objetivo:** Modela la información de los préstamos de libros en una biblioteca

### Implementación de tablas
* [Script de Creación de Tablas DDL](/02-modelo-fisico/ejercicio_1/1_2/codigo_SQL/Tp3_Ej_1_2_create.sql)

### Script de Borrado (DROP TABLE)
*El orden es inverso a la creación para evitar conflictos de FK*
  ```sql
  DROP TABLE IF EXISTS PRESTAMO_LIBRO CASCADE; 
  DROP TABLE IF EXISTS PRESTAMO CASCADE; 
  DROP TABLE IF EXISTS EJEMPLAR_LIBRO CASCADE; 
  DROP TABLE IF EXISTS AUTOR CASCADE; 
  DROP TABLE IF EXISTS CATALOGO_LIBRO CASCADE; 
  DROP TABLE IF EXISTS SIN_CARNET CASCADE; 
  DROP TABLE IF EXISTS CON_CARNET CASCADE; 
  DROP TABLE IF EXISTS USUARIO CASCADE;
```



## Modelo Conceptual (ER)

<img width="729" height="436" alt="image" src="https://github.com/user-attachments/assets/11d430cd-a816-45c0-a7fb-b1e80aa37c18" />


## Diagrama Fisico

<img width="975" height="522" alt="image" src="https://github.com/user-attachments/assets/588c3012-5cc7-406b-a3ca-aff2c1fb2a63" />



---
