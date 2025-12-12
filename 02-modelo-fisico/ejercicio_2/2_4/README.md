## TP3 – Ejercicio 2.4: Pasaje de modelo ER a modelo físico
Para el diseño del modelo físico se partió del enunciado textual, identificando entidades, atributos y relaciones necesarias para representar el sistema de control de niños refugiados a nivel mundial. Se priorizó la correcta representación de vínculos familiares, datos sanitarios, ubicación institucional y estado actual del niño, respetando las reglas del dominio


### Enunciado textual
Se necesita realizar la base de datos de una organización que lleve el control de niños refugiados en distintas instituciones a nivel mundial, por ejemplo como la base de datos de UNICEF.

La organización necesita tener la información de los niños con sus datos personales, filiatorios (nombre y apellido de los padres), fecha y lugar de nacimiento, parientes, datos sanitarios (enfermedades actuales y pasadas), etc.
También se desea conocer en qué institución está cada niño, adicionalmente se conoce el país, región y ciudad de la institución.

Se necesita saber si los niños requieren cuidados especiales y quienes son sus contactos o cuidadores dentro de la institución en la que están.

Por último se necesita saber la fecha en la que volvió con la familia (si es que lo hizo).

### Interpretacion:
A partir del enunciado, se identifican las siguientes necesidades funcionales:
1. **Información del niño:**
    - Datos personales: nombre, apellido, fecha de nacimiento
    - Lugar de nacimiento
    - Datos filiatorios: nombres y apellidos de los padres
    - Información sanitaria:
      - Enfermedades actuales
      - Enfermedades pasadas
    - Indicación de si requiere cuidados especiales
    - Fecha en la que volvió con su familia (opcional)

2. **Ubicación institucional**
   - Cada niño se encuentra en una institución
   - De cada institución se debe registrar país, región y ciudad
   - Una institución aloja a muchos niños
  
3. **Contactos o cuidadores**
   - Se deben registrar las personas responsables de cuidar al niño
   - Un niño puede tener múltiples cuidadores/contactos

4. **Egreso del niño**
   - Se debe registrar la fecha en la que el niño regresó con su familia (si corresponde)
   - En caso de no haber regresado aún, este dato se mantiene nulo


### Modelo lógico

<img width="666" height="463" alt="image" src="https://github.com/user-attachments/assets/13621e41-1b6b-4117-8f17-aa2e929f9aac" />


### Modelo físico

<img width="1106" height="631" alt="image" src="https://github.com/user-attachments/assets/2b782b0f-137d-4cba-9ff3-9c355a6569cf" />


