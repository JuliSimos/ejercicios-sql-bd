### Ejercicio 1

- **Modelado de datos:** Repositorio de archivos digitales (audios, videos y documentos) agrupados por temática en colecciones.

#### Implementación de tablas
* [Script de Creación de Tablas DDL](/02-modelo-fisico/Tp3_Ej_1_create.sql)

<details>
  <summary><b>  Ver Script de Borrado (DROP TABLE)</b></summary>

  ```sql
  DROP TABLE IF EXISTS AUDIO CASCADE;
  DROP TABLE IF EXISTS VIDEO CASCADE;
  DROP TABLE IF EXISTS DOCUMENTO CASCADE;
  DROP TABLE IF EXISTS OBJETO CASCADE;
  DROP TABLE IF EXISTS COLECCION CASCADE;
  DROP TABLE IF EXISTS REPOSITORIO CASCADE;
```
</details>


### Pasaje de modelo logico a fisico

<details>
  <summary><b> Diagrama ER (Entidad-Relación)</b></summary>
  <br>
  <img width="623" height="671" alt="Tp3_Ej_1 1_modeloER" src="https://github.com/user-attachments/assets/5fd6b3f2-8cd9-414a-a5ee-01f1af4b6e0f" />
</details>

<details>
  <summary><b>  Diagrama Fisico</b></summary>
  <br>
  <img width="685" height="486" alt="image" src="https://github.com/user-attachments/assets/c43f31d1-7b0d-46f7-9812-bc6ab988c1c3" />
</details>

---





