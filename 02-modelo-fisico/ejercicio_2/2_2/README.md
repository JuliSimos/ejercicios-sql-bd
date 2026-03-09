## TP3 – Ejercicio 2: Pasaje de modelo ER a modelo físico

Durante el proceso de transformación del modelo ER al modelo físico se detectaron algunas inconsistencias en el diseño original del DER del TP2.
Por este motivo, para la construcción del esquema final se tomó como referencia tanto el enunciado textual como el modelo ER, priorizando siempre las reglas del dominio establecidas en el problema.


### Enunciado textual
Se quiere registrar información correspondiente a un depósito, sus departamentos, sus empleados, sus productos y los fabricantes de estos productos. El sistema debe cumplir con las siguientes reglas:

1. Cada empleado está identificado por un número de empleado. 
    - Se registra nombre, apellido y dirección (calle, puerta, piso y ciudad).
    - Cada empleado pertenece a un único departamento.

2. Cada departamento está identificado por su nombre. Se debe registrar:
    - qué empleados trabajan en él,
    - quién es su empleado jefe,
    - qué productos vende.
    > Nota: cada producto se vende en un único departamento.

3. Cada producto está identificado por:
    - el número asignado por el almacén,
    - el número asignado por el fabricante.
    - Además, se registra nombre, fabricante y precio.

4. Cada fabricante está identificado por un identificador propio. Se registra su nombre, dirección, los productos que suministra al almacén y los precios correspondientes.

5. Un departamento puede tener muchos empleados, pero cada empleado solo puede ser jefe de un único departamento.
___

### Notas de Implementación (Modelo Físico)
**Resolución de la Jerarquía y Jefatura**
En el diseño físico, se unificó la información de los empleados en una única tabla. Para cumplir con las reglas de negocio, se aplicó la siguiente lógica:

- **Atributo de Discriminación:** Se añadió la columna tipo en la tabla Empleado para identificar el rol de cada registro (administrativo o jefe)

- **Relación de Jefatura:** La vinculación se resuelve en la tabla Departamento mediante la columna id_jefe. Esta actúa como una clave foránea (FK) que referencia al número de empleado

- **Clave Única (AK) sobre id_jefe:** Asegura que un empleado pueda figurar como jefe en un solo departamento a la vez, garantizando la relación 1:1

**Identificación de Productos y Fabricantes**

- **Clave Primaria Compuesta:** En la tabla Producto, se definió una PK conformada por el código del almacén y el número del fabricante. Esto identifica de forma única cada artículo según su origen

- **Asignación de Punto de Venta:** La relación se establece guardando el código del departamento dentro de la tabla Producto, permitiendo que cada producto pertenezca a un único sector de ventas


### Modelo lógico

<img width="739" height="487" alt="image" src="https://github.com/user-attachments/assets/5152c2dd-33ea-49fb-8d09-97dad598c9e7" />


### Modelo físico

<img width="873" height="720" alt="image" src="https://github.com/user-attachments/assets/dafe0aa9-0412-48e1-889c-d50c316e6837" />

