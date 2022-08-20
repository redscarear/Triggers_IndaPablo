# Stored_IndaPablo

En este repositorio encontrara seis archivos

- el Diagrama ER del proyecto (ER_IndaPablo)
- el de creacion de la base de datos y tablas (EventosArtisticos_Schema_Tables),
- el de insercion de datos ( EventosArtisticos_Insert_Data)
- el de vistas (EventosArtisticos_Views)
- el de funciones (EventosArtisticos_Functions)
- el de procedimientos (EventosArtisticos_StoreProcedures)

Este ultimo archivo, contiene dos SP

- El primero sirve para ver una tabla ordenando por el campo que se prefiera, 
de manera ascendente o descendente, de la tabla PROVEEDORES 
al final de la creacion, hay dos ejemplos para utilizar el SP.

- El segundo se podra insertar registros a partir de parametros que responden a campos obligatorios de la tabla, o borrar registros a partir del Id del registro que se quiere eliminar.
Para insertar registros, hay que setear el parametro 'p_id_emp' en 0 , y luego setear los demas parametros. El condicional del SP, al encontrar ese parametro en 0, tiene la funcion de insertar los datos de los demas parametros.
En el caso de que 'p_id_emp' sea distinto de cero, es decir, se ingrese un numero que corresponderia con el ID del Empleado a borrar, de ser asi, solo se setea ese campo, y borrara el registro que contenga ese ID en la tabla de Empleados

Pablo Inda
