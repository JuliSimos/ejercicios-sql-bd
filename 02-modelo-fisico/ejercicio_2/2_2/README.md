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

### Modelo lógico

<img width="723" height="372" alt="image" src="https://github.com/user-attachments/assets/7aa0c5c5-d13d-418a-9b84-ca624e8ef04e" />


### Modelo físico

<img width="1032" height="573" alt="image" src="https://github.com/user-attachments/assets/a249921b-e100-4624-a418-999904077110" />
