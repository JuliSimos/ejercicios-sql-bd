## TP3 – Ejercicio 2.5: Pasaje de modelo ER a modelo físico

Para la elaboración del modelo lógico y el modelo físico se analizó el enunciado textual y se identificaron las entidades, relaciones y restricciones necesarias para informatizar correctamente la gestión de préstamos en una biblioteca. 
El diseño resultante busca representar lectores, libros, ejemplares, categorías, empleados, préstamos y reservas, asegurando integridad y consistencia en las operaciones principales del sistema.

---

### Enunciado textual

Se desea informatizar la gestión de una biblioteca que presta libros a sus lectores. El sistema debe ajustarse a las siguientes reglas:

1. **Lectores**  
   - Se almacena: DNI, nombre, teléfono, dirección y correo electrónico

2. **Libros**  
   - Se registra: ISBN, título, autor, editorial, año de publicación y género

3. **Préstamos**  
   - Un lector puede tomar prestados varios libros
   - Un libro sólo puede estar prestado a un lector a la vez
   - Se registra: fecha de préstamo y fecha de devolución

5. **Colección de libros**  
   - La biblioteca posee múltiples copias de cada libro  
   - Se debe registrar la ubicación espacial de la colección

6. **Ejemplares de libro**  
   Cada copia tiene:  
   - Nº de ejemplar  
   - Año de edición  
   - Nº de edición

7. **Empleado que realiza el préstamo**  
   - Cada préstamo debe ser registrado por un empleado de la biblioteca

8. **Categorías**  
   - Un libro puede pertenecer a múltiples categorías (Novela, Historia, Ciencia, etc.)
   - Una categoría puede agrupar múltiples libros
   → Relación **muchos a muchos** libro–categoría

9. **Empleados**  
  - Se guarda: DNI, nombre, cargo y horario de trabajo

10. **Reservas**  
   - Si un libro no está disponible, el lector puede realizar una reserva  
   - Se registra: fecha de reserva y estado (pendiente, cancelada o completada)

---

###  Interpretación:

A partir del enunciado, se identifican los siguientes elementos del modelo:

#### **Entidades principales**
- **Lector**
- **Libro**
- **Ejemplar**
- **Empleado**
- **Categoría**
- **Reserva**
- **Préstamo**

#### **Relaciones y restricciones**

- **Lector–Préstamo (1:N)**  
  Un lector puede realizar múltiples préstamos

- **Ejemplar–Préstamo (1:1 en un instante)**  
  Un ejemplar sólo puede estar prestado a un lector a la vez 
  La restricción se controla a nivel de lógica del sistema

- **Libro–Ejemplar (1:N)**  
  Un libro puede tener múltiples copias físicas

- **Empleado–Préstamo (1:N)**  
  Cada préstamo es gestionado por un único empleado

- **Libro–Categoría (N:N)**  
  Relación muchos a muchos mediante tabla intermedia

- **Lector–Reserva (1:N)**  
  Un lector puede realizar varias reservas

- **Libro–Reserva (1:N)**  
  Un libro puede tener múltiples reservas

- **Reserva**  
  Incluye atributos propios: fecha y estado

- **Ubicación de ejemplares / colección**  
  Se almacena para identificar dónde está cada copia dentro de la biblioteca

---

###  Modelo lógico

<img width="930" height="540" alt="image" src="https://github.com/user-attachments/assets/e69ee150-cf02-45c3-9432-c951fa0afe5a" />

---

###  Modelo físico

<img width="930" height="540" alt="image" src="https://github.com/user-attachments/assets/813b29e0-aa17-4719-a5da-df22c91aebb2" />

---
