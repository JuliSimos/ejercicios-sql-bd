## TP3 – Ejercicio 2.3: Pasaje de modelo ER a modelo físico
Durante el proceso de transformación del modelo ER al modelo físico se tomó como base el enunciado textual, definiendo entidades, relaciones y restricciones según las reglas del dominio. El objetivo es modelar correctamente la gestión de transporte de paquetes, respetando las cardinalidades y dependencias entre camioneros, camiones, paquetes y ciudades

### Enunciado textual
Se desea informatizar la gestión de una empresa de transportes que reparte paquetes dentro de la provincia. El sistema debe contemplar lo siguiente:
1. **Camioneros**
    - Se registra: DNI, nombre, teléfono, dirección, salario y ciudad donde vive
    - Son los responsables de distribuir los paquetes

2. **Paquetes**
    - Se guarda: código de paquete, descripción, destinatario y dirección del destinatario.

3. **Relación camionero–paquetes**
    - Un camionero distribuye muchos paquetes
    - Un paquete es distribuido por un único camionero

4. **Ciudades de destino**
    - Se registra: código de ciudad y nombre
    - Un paquete llega a una única ciudad
    - Una ciudad puede recibir muchos paquetes

5. **Camiones**
    - Se guarda: matrícula, modelo, tipo y potencia
      
6. **Relación camionero–camiones**
    - Un camionero puede conducir distintos camiones en distintas fechas.
    - Un camión puede ser conducido por varios camioneros.
    - Esto implica una relación muchos a muchos con atributo (fecha).

### Modelo lógico
<img width="818" height="283" alt="image" src="https://github.com/user-attachments/assets/089e6fab-26fc-4a2e-9557-2835412a5a4a" />


### Modelo físico
<img width="940" height="507" alt="image" src="https://github.com/user-attachments/assets/6b279257-b522-4de9-ae1d-71c011c86053" />


