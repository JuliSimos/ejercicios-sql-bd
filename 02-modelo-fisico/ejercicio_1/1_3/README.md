# Ejercicio 1.2 –> Envios de Productos Quimicos

> **Objetivo:** Modela la información de envíos de productos químicos a diferentes clientes de una empresa

### Implementación de tablas
* [Script de Creación de Tablas DDL](/02-modelo-fisico/ejercicio_1/1_3/codigo_SQL/Tp3_Ej_1_3_create.sql)

### Script de Borrado (DROP TABLE)

  ```sql
DROP TABLE IF EXISTS ENVIO CASCADE;
DROP TABLE IF EXISTS PQ_LIQUIDO CASCADE;
DROP TABLE IF EXISTS PQ_SOLIDO CASCADE;
DROP TABLE IF EXISTS COMPONENTE_QUIMICO CASCADE;
DROP TABLE IF EXISTS PRODUCTO_QUIMICO CASCADE;
DROP TABLE IF EXISTS CLIENTE CASCADE;
```



## Modelo Conceptual (ER)

<img width="708" height="482" alt="image" src="https://github.com/user-attachments/assets/56618b57-773e-4f4c-a8bf-d7c7977c8335" />


## Diagrama Fisico

<img width="912" height="450" alt="image" src="https://github.com/user-attachments/assets/9f3f10fa-d2a1-4e3b-b266-ff16342e968c" />




---

