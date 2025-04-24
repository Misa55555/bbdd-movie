En este examen que se nos presento en la materia de "Base de datos" debiamos de crear una bbdd siguiendo ciertas intrucciones del profesor, en este caso 
esta base de datos simula el registro de misiones espaciales tripuladas, más específicamente del programa Apolo. Se almacenan datos sobre:
* Vectores de lanzamiento (cohetes utilizados),
* Misiones realizadas (con sus fechas, éxito o fracaso, y observaciones),
* Tripulantes que participaron (con nombre, apellido y año de nacimiento),
* Y la relación entre tripulantes y misiones.

LO QUE SE HIZO EN EL CODIGO FUE:
- Creé la base de datos actividad_entregable2 y todas sus tablas principales: vectores, misiones, tripulantes, y la tabla intermedia tripulantes_misiones. 
En cada una de ellas apliqué las claves primarias, foráneas y las restricciones necesarias para garantizar la integridad referencial.
Cargué los datos correspondientes en todas las tablas, incluyendo:
* Los vectores Saturn IB y Saturn V.
* Todas las misiones Apolo del 1 al 17, con sus respectivas fechas, observaciones y estado (exitosa o fallida).
* Los 32 tripulantes, junto con sus nombres, apellidos y año de nacimiento.
* La relación entre los tripulantes y las misiones en las que participaron.

- Luego, modifiqué la columna masaKg_vec de la tabla vectores, estableciéndola como obligatoria (NOT NULL), con tipo entero sin signo y un valor por defecto de 0.

Realicé dos consultas SQL:
* La primera muestra el nombre completo del tripulante, la misión, su fecha de lanzamiento, 
el vector utilizado, y si fue exitosa o no (reemplazando los valores booleanos por “SÍ” o “NO”), todo ordenado por fecha de forma ascendente.
* La segunda consulta lista a los tripulantes que participaron en misiones fallidas, sin orden específico.

- Además, corregí el nombre del tripulante de apellido Aldrin, actualizándolo a "Edwin Buzz".

- Por último, eliminé de forma física el vector "Saturn V" utilizando una sentencia DELETE, y repetí la consulta del punto 4a para observar cómo impactaba esa eliminación en los resultados.
