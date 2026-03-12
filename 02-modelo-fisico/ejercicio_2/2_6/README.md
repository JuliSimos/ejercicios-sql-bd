## TP3 – Ejercicio 2.6: Pasaje de modelo ER a modelo físico

Para el diseño del modelo lógico y físico se analizó el enunciado textual, identificando las entidades clave, las relaciones entre ellas y las restricciones del dominio necesarias para modelar correctamente los proyectos, empleados, clientes, facturación y evaluaciones de los proyectos.

---

###  Enunciado textual

Una startup de tecnología y consultoría se especializa en la creación y comercialización de proyectos en diversas áreas, como software, hardware, consultoría y productos digitales. Para mejorar su administración, se requiere diseñar un sistema que gestione sus proyectos, equipos de trabajo, clientes, facturación e inversiones.

#### **Proyectos**
- Cada proyecto tiene un código único, nombre, descripción y tipo (software, hardware, consultoría o producto digital).
- Se registra la fecha de inicio y finalización, el estado del proyecto (en desarrollo, finalizado, cancelado) y su presupuesto asignado.
- Un proyecto puede estar asociado a un cliente si es un trabajo contratado.

#### **Equipos de Trabajo**
- Cada proyecto es desarrollado por un equipo, identificado por un código y un nombre.
- Un equipo está compuesto por varios empleados.
- Cada equipo tiene un líder asignado.

#### **Empleados**
- Se registra la información de cada empleado: DNI, nombre, apellido, cargo, especialidad y correo electrónico.
- Se almacena además: fecha de contratación, salario y tipo de contrato (full-time, part-time o freelance).
- Un empleado puede participar en varios proyectos simultáneamente.

#### **Clientes**
- Si un proyecto es desarrollado para un cliente, se guarda su información: código de cliente, nombre de empresa o persona, contacto, email y teléfono.
- Se registra el monto total facturado y la fecha de inicio de la relación comercial.

#### **Evaluación de Proyectos**
- Cada proyecto pasa por evaluaciones en diferentes fases.
- Se registra la fecha de evaluación, resultado (aprobado, en revisión, rechazado) y comentarios técnicos.

---

##  Interpretación:

A partir del enunciado se identifican las siguientes entidades y relaciones:

### **Entidades principales**
- **Proyecto**
- **Equipo**
- **Empleado**
- **Cliente**
- **Evaluación**
- (Opcional según tu modelado) **Participación** empleado–proyecto

### **Relaciones clave**

- **Proyecto–Equipo (1:1)**  
  Cada proyecto es desarrollado por un único equipo.

- **Equipo–Empleado (1:N)**  
  Un equipo cuenta con múltiples empleados.  
  Incluye referencia al **líder del equipo** (FK a empleado).

- **Empleado–Proyecto (N:N)**  
  Un empleado puede participar en varios proyectos.  
  → Se modela mediante tabla intermedia.

- **Proyecto–Cliente (N:1 opcional)**  
  Un proyecto puede estar asociado a un cliente o no.

- **Proyecto–Evaluación (1:N)**  
  Un proyecto puede tener múltiples evaluaciones en distintas fases.

### **Atributos destacados**
- Proyecto: tipo, estado, fechas, presupuesto.  
- Empleado: cargo, especialidad, tipo de contrato, salario.  
- Cliente: datos comerciales y fecha de inicio de relación.  
- Evaluación: fecha, fase, resultado, comentarios.

---

## Modelo lógico

<img width="741" height="559" alt="image" src="https://github.com/user-attachments/assets/5d84a93f-415e-4b47-83de-cbf2bdff3211" />

## Modelo físico

<img width="920" height="464" alt="image" src="https://github.com/user-attachments/assets/6e41bf8e-e714-4488-83f1-d9f6cb33f487" />




