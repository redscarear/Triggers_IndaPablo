# Triggers_IndaPablo

En este repositorio encontrara siete archivos

- el Diagrama ER del proyecto (ER_IndaPablo)
- el de creacion de la base de datos y tablas (EventosArtisticos_Schema_Tables),
- el de insercion de datos ( EventosArtisticos_Insert_Data)
- el de vistas (EventosArtisticos_Views)
- el de funciones (EventosArtisticos_Functions)
- el de procedimientos (EventosArtisticos_StoreProcedures)
- el de Triggers

Este ultimo archivo, contiene la creacion  de dos tablas de LOG, para las tablas Espacio y Productor. Luego la creacion de dos Triggers para cada tabla de Log.
En el caso de Log_Espacio hay un triger que guardara registros luego del Insert y otro anteriores al Delete.
En el caso de Log_Productor guardara datos en su log antes de Update y el otro luego de insertar

Pablo Inda
