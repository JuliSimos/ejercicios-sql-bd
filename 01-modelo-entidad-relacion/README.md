# Ejercicios resueltos del practico modelado de datos

### Ejercicio 1: Sistema de Facturación y Clientes
  a. Analice si su modelo es capaz de respetar el precio de venta de cada producto cuando se modifica el precio de un producto.
  
  b. Proponga una solución para el DERE al problema
  
Puntos clave del diseño:
  - Para evitar que el precio de una venta cambie cuando el producto se actualiza en el futuro, se define la relación "Contiene" entre Factura y Producto como una relación muchos a muchos. Al agregar los atributos cantidad y precio_unitario directamente en esta relación, el precio queda 'congelado' en la instancia de la factura, independientemente de los cambios posteriores en la tabla de Producto

<img width="649" height="376" alt="image" src="https://github.com/user-attachments/assets/f8bc8244-0d7b-4d14-88d3-3bca8bc15429" />

### Ejercicio 2: Gestión de Depósito y Departamentos

Puntos clave del diseño:

- **Jerarquía de Empleados:** Se implementó una especialización disjunta (d) para separar a los empleados en las categorías JEFE y NO_JEFE. Esto permite asegurar que cada departamento tenga un único jefe asignado, cumpliendo con la restricción de que un empleado solo puede liderar un sector a la vez.

- **Identificación de Productos:** El producto se definió como una entidad débil. Su identidad completa se construye combinando el número asignado por el fabricante con el código del almacén, reflejando la dependencia de existencia respecto al fabricante.

- **Restricción de Ventas:** Para respetar la anotación de que cada producto se vende en un único departamento, se estableció una cardinalidad (1,1) desde el lado del Producto hacia la relación de venta con el Departamento.
  
<img width="749" height="475" alt="image" src="https://github.com/user-attachments/assets/c96c738d-1457-4641-b1ba-04938ed08ccf" />

### Ejercicio 3: Sistema de Distribución de Paquetes

Puntos clave del diseño:

- **Relación Histórica (N:N):** Para cumplir con el requisito de que un camionero conduce diferentes camiones en fechas distintas, se estableció una relación muchos a muchos entre Camionero y Camión. Se incluyeron los atributos fecha_inicio y fecha_fin en la relación para mantener el registro histórico de quién condujo qué vehículo.

- **Trazabilidad de Paquetes:** La relación entre Camionero y Paquete se definió como (1,1) del lado del paquete, asegurando que cada envío tenga un único responsable asignado para su distribución.

- **Destino de Envíos:** Se vinculó Paquete con Ciudad mediante una relación de obligatoriedad, donde un paquete llega a una única ciudad de destino, pero una ciudad puede recibir múltiples paquetes a lo largo del tiempo.
  
<img width="787" height="323" alt="image" src="https://github.com/user-attachments/assets/b13f66a9-30c6-443b-8897-d2e6baa7b94d" />

### Ej 4:
<img width="666" height="463" alt="image" src="https://github.com/user-attachments/assets/a1ddb3c9-8974-4615-ba8a-0a244cc79a94" />

### Ej 5:
<img width="930" height="540" alt="image" src="https://github.com/user-attachments/assets/b1c03f54-bc09-4591-8bb9-575c5d2e7a3d" />

### Ej 6:
<img width="662" height="519" alt="image" src="https://github.com/user-attachments/assets/2f4944c9-3f43-4091-904b-20c7fb70d405" />
