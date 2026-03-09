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
<img width="754" height="292" alt="image" src="https://github.com/user-attachments/assets/745d7069-f802-47cd-a16f-9c7a16c1cc97" />

### Modelo físico
<img width="1044" height="487" alt="image" src="https://github.com/user-attachments/assets/a7f167d5-7d36-43d2-afa8-d4bc23573a3e" />

