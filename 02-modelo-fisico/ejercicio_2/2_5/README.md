## TP3 – Ejercicio 2.5: Gestión de Eventos: Préstamos y Reservas

<details>
  <summary><b>Enunciado Textual</b></summary>
   
---
Se desea informatizar la gestión de una biblioteca que presta libros a sus lectores. El sistema debe ajustarse a las siguientes reglas:

1. **Lectores** - Se almacena: DNI, nombre, teléfono, dirección y correo electrónico

2. **Libros** - Se registra: ISBN, título, autor, editorial, año de publicación y género

3. **Préstamos** - Un lector puede tomar prestados varios libros
   - Un libro sólo puede estar prestado a un lector a la vez
   - Se registra: fecha de préstamo y fecha de devolución

4. **Colección de libros** - La biblioteca posee múltiples copias de cada libro  
   - Se debe registrar la ubicación espacial de la colección

5. **Ejemplares de libro** Cada copia tiene:  
   - Nº de ejemplar  
   - Año de edición  
   - Nº de edición

6. **Empleado que realiza el préstamo** - Cada préstamo debe ser registrado por un empleado de la biblioteca

7. **Categorías** - Un libro puede pertenecer a múltiples categorías (Novela, Historia, Ciencia, etc.)
   - Una categoría puede agrupar múltiples libros
   → Relación **muchos a muchos** libro–categoría

8. **Empleados** - Se guarda: DNI, nombre, cargo y horario de trabajo

9. **Reservas** - Si un libro no está disponible, el lector puede realizar una reserva  
   - Se registra: fecha de reserva y estado (pendiente, cancelada o completada)

---

</details>

#### Notas del pasaje a tablas:

Se diseñaron las tablas de transacciones para centralizar la información de los eventos y asegurar la trazabilidad del sistema:

- **Vinculación con el Lector:** Se determinó una cardinalidad 1:N, donde un lector puede estar asociado a múltiples préstamos o reservas. Esta relación se resolvió integrando el dni_lector como Clave Foránea (FK) directa en las tablas Prestamo y Reserva, eliminando la necesidad de tablas intermedias.

- **Responsabilidad del Personal:** Para cumplir con el registro obligatorio del empleado en cada operación, se incluyó el identificador del personal (nro_empleado) como FK en la tabla Prestamo con restricción NOT NULL. Esto garantiza que toda salida de material cuente con un responsable unívoco.

- **Granularidad de Reservas:** Se optó por una asociación directa entre la reserva y el libro solicitado. Este diseño permite gestionar el estado de cada pedido (pendiente, cancelada o completada) de forma independiente y simplifica la lógica de validación de disponibilidad por título.

**Estructura de la Colección y Clasificación**

- **Tratamiento de la Entidad Débil (Copia_Libro):** Para representar las múltiples copias de un mismo título, se definió una Clave Primaria (PK) Compuesta formada por el ISBN_libro y el cod_libro. Esta identificación se propaga hacia la tabla Prestamo para asegurar que cada transacción referencie un ejemplar físico específico.

- **Resolución de Categorías (N:N):** La relación muchos a muchos entre libros y géneros se resolvió mediante la tabla asociativa Categoria_Libro. Esta estructura permite que un título pertenezca a diversas categorías simultáneamente, facilitando la organización multidimensional del catálogo.

---

###  Modelo lógico

<img width="961" height="549" alt="image" src="https://github.com/user-attachments/assets/b81e7df9-5dcf-4d78-a4c6-648800d43f18" />

---

###  Modelo físico

<img width="962" height="642" alt="image" src="https://github.com/user-attachments/assets/7185e357-605d-49d1-9f22-d68ab7550970" />


---



