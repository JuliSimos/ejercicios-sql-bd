# Ejercicios resueltos del practico modelado de datos

<details>
  <summary><b>Guía de Lectura: Cardinalidades </b></summary>
  
  *Para la correcta interpretación de los diseños, se utiliza la convención de __"mirar al frente"__*:

* **Lógica de lectura:** La cardinalidad que define a una entidad se encuentra anotada en el extremo opuesto de la relación.
  
* **Interpretación de los valores:**
    * **(0, N):** **Opcionalidad.** La entidad puede relacionarse con muchos ejemplares o ninguno.
    * **(1, 1):** **Obligatoriedad única.** La entidad debe relacionarse con exactamente un ejemplar.
    * **(1, N):** **Obligatoriedad múltiple.** La entidad debe relacionarse con al menos uno o varios ejemplares.

> **Ejemplo:** Si en la relación entre `Paquete` y `Ciudad`, el valor **(1,1)** está junto a `Ciudad`, significa que "El paquete llega a **una sola** ciudad".

</details>

---


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
  
<img width="683" height="479" alt="image" src="https://github.com/user-attachments/assets/95674807-9142-41a3-8792-b86e5b93b50d" />


### Ejercicio 3: Sistema de Distribución de Paquetes

Puntos clave del diseño:

- **Relación Histórica (N:N):** Para cumplir con el requisito de que un camionero conduce diferentes camiones en fechas distintas, se estableció una relación muchos a muchos entre Camionero y Camión. Se incluyeron los atributos fecha_inicio y fecha_fin en la relación para mantener el registro histórico de quién condujo qué vehículo.

- **Trazabilidad de Paquetes:** La relación entre Camionero y Paquete se definió como (1,1) del lado del paquete, asegurando que cada envío tenga un único responsable asignado para su distribución.

- **Destino de Envíos:** Se vinculó Paquete con Ciudad mediante una relación de obligatoriedad, donde un paquete llega a una única ciudad de destino, pero una ciudad puede recibir múltiples paquetes a lo largo del tiempo.
  
<img width="753" height="299" alt="image" src="https://github.com/user-attachments/assets/b138c6a0-283c-4939-9b1f-e2a828e591ca" />


### Ejercicio 4: Sistema de Control de Niños Refugiados
Puntos clave del diseño:

- **Gestión de Contactos y Cuidado:** Se estableció una relación de obligatoriedad múltiple (1,N) entre Infante y Cuidador. Esto permite que cada niño cuente con uno o más responsables asignados dentro de la institución, cumpliendo con el requisito de identificar a sus cuidadores y contactos.

- **Atributos Multivaluados y Compuestos:** Para los datos sanitarios y filiatorios, se utilizaron atributos multivaluados (como enfermedades y parientes). Esto permite registrar un historial médico completo y múltiples vínculos familiares sin generar redundancia en la entidad principal.

- **Localización Institucional:** La relación entre Infante e Institución se definió como (1,1) desde la perspectiva del niño. Esto asegura que cada menor esté vinculado obligatoriamente a una única sede, la cual contiene la información jerárquica de su ubicación geográfica (país, región y ciudad).

- **Trazabilidad de Retorno:** Se incluyó el atributo fecha_retorno en la entidad Infante con carácter opcional. Esto permite registrar el reencuentro familiar en los casos donde se concrete, manteniendo el campo como nulo mientras el niño permanezca bajo el cuidado de la organización.
<img width="687" height="452" alt="image" src="https://github.com/user-attachments/assets/5713ceba-bd1f-487f-8bb2-9f4a6a9622aa" />

### Ejercicio 5: Sistema de Gestión de Biblioteca y Préstamos
Puntos clave del diseño:

- **Modelado de Ejemplares (Entidad Débil):** Se diferenció la entidad LIBRO (información bibliográfica) de COPIA_LIBRO (ejemplar físico). Esta última se definió como una entidad débil, ya que su identificación depende del ISBN del libro original, permitiendo gestionar el stock y la ubicación en estantería de forma individualizada.

- **Gestión de Préstamos y Empleados:** Se implementó una relación ternaria o vinculada entre LECTOR, PRESTAMO y EMPLEADO para asegurar la trazabilidad de cada transacción, registrando no solo quién se lleva el libro, sino también qué funcionario autorizó la operación y en qué fechas.

- **Sistema de Reservas:** Se incorporó la entidad RESERVA para gestionar la demanda de libros no disponibles. Se vinculó directamente con el LECTOR y el LIBRO mediante relaciones de opcionalidad (0,N), permitiendo un seguimiento del estado de la solicitud (pendiente, cancelada o completada).

- **Categorización Muchos a Muchos:** Para cumplir con el requisito de que un libro puede pertenecer a múltiples géneros (Novela, Historia, etc.), se estableció una relación (N:N) con la entidad CATEGORIA, facilitando la clasificación y búsqueda avanzada en el catálogo.
  
<img width="930" height="540" alt="image" src="https://github.com/user-attachments/assets/b1c03f54-bc09-4591-8bb9-575c5d2e7a3d" />

### Ejercicio 6: Gestión de Startup de Consultoría Tecnológica
Puntos clave del diseño:

- **Estructura de Equipos y Proyectos:** Se estableció una distinción entre la pertenencia a un EQUIPO y la participación operativa en un PROYECTO. Esto permite registrar a un empleado en su unidad administrativa mientras colabora en múltiples proyectos simultáneamente.

- **Roles de Liderazgo:** La relación lidera cuenta con una cardinalidad (0,1) desde la perspectiva del empleado. Esto indica que un trabajador puede no tener personal a cargo o, como máximo, ser el líder de un único equipo.

- **Flexibilidad de Clientes:** La vinculación con la entidad CLIENTE es de carácter opcional (0,1). Esta configuración permite al sistema gestionar tanto desarrollos para terceros como productos digitales propios de la startup.

- **Ciclo de Vida y Evaluaciones:** Se definió una relación de opcionalidad (0,N) para las evaluaciones de fase. Esto posibilita el registro de proyectos nuevos que aún no han sido auditados, permitiendo que los controles se sumen de forma incremental conforme avance el desarrollo.

<img width="731" height="560" alt="image" src="https://github.com/user-attachments/assets/6e7835f7-c360-4a36-808f-6a1d92dcb5e8" />
