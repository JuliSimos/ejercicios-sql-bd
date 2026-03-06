# Ejercicio 1.1 –> Repositorio Digital

> **Objetivo:** Modelar un repositorio de archivos digitales (audios, videos y documentos) agrupados por temática en colecciones.

### Implementación de tablas
* [Script de Creación de Tablas DDL](/02-modelo-fisico/ejercicio_1/1_1/codigo_SQL/Tp3_Ej_1_1_create.sql)

#### Script de Borrado (DROP TABLE)

  ```sql
  DROP TABLE IF EXISTS Audio CASCADE;
  DROP TABLE IF EXISTS Video CASCADE;
  DROP TABLE IF EXISTS Documento CASCADE;
  DROP TABLE IF EXISTS Objeto CASCADE;
  DROP TABLE IF EXISTS Coleccion CASCADE;
  DROP TABLE IF EXISTS Repositorio CASCADE;
```



## Modelo Conceptual (ER)

<img width="685" height="486" alt="image" src="https://github.com/user-attachments/assets/4ed8f66f-ed30-42e9-bb40-e035d53ef0d1" />


## Diagrama Fisico

<img width="816" height="581" alt="image" src="https://github.com/user-attachments/assets/afe58161-815d-45d6-93b1-3030d86d29c2" />

#### Notas de diseño

- **Manejo de categorías:** Para los diferentes tipos de archivos (Audio, Video, Documento), se creó una tabla para cada uno. Todas comparten la misma clave para que los datos estén siempre conectados de forma segura.

- **Relación de dependencia:** La tabla Objeto depende directamente de Coleccion. Por eso, para identificar un objeto, usamos tanto su propio ID como el de la colección a la que pertenece.

- **Orden de datos:** Se incluyó un campo "tipo" en la tabla principal para saber rápidamente qué clase de archivo es cada registro sin tener que buscar en todas las tablas.

---





