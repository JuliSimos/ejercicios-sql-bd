# Ejercicio 1.2 –> Prestamos de una biblioteca

> **Objetivo:** Modela la información de los préstamos de libros en una biblioteca

### Implementación de tablas
* [Script de Creación de Tablas DDL](/02-modelo-fisico/ejercicio_1/1_2/codigo_SQL/Tp3_Ej_1_2_create.sql)

### Script de Borrado (DROP TABLE)
*El orden es inverso a la creación para evitar conflictos de FK*
  ```sql
-- 1. Las tablas que unen relaciones o son subtipos
DROP TABLE IF EXISTS prestamo_libro; 
DROP TABLE IF EXISTS Con_carnet;
DROP TABLE IF EXISTS Sin_carnet;

-- 2. Las tablas que dependen de entidades principales
DROP TABLE IF EXISTS Prestamo;
DROP TABLE IF EXISTS Autor;
DROP TABLE IF EXISTS Ejemplar_libro;

-- 3. Las tablas maestras o independientes
DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Catalogo_libro;
```



## Modelo Conceptual (ER)

<img width="729" height="436" alt="image" src="https://github.com/user-attachments/assets/11d430cd-a816-45c0-a7fb-b1e80aa37c18" />


## Diagrama Fisico

<img width="832" height="429" alt="image" src="https://github.com/user-attachments/assets/bc5060d9-4d2a-4b38-b47e-db2b2c9040b6" />




---
