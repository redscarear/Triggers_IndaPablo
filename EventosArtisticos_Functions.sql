use eventos_artisticos;

/** la siguiente funcion sirve para saber cuando espacios para eventos hay mayores a la cantidad de audiencia que se requiera
se ingresa un numero de audiencia, y la funcion devovlera la cantidad de espacios mayores a esa cantidad de publico **/
drop function if exists FN_capacidad ;
DELIMITER //
CREATE FUNCTION FN_capacidad ( cantidad int ) 
RETURNS INT 
DETERMINISTIC 
BEGIN 
DECLARE  NUMERO INT;
set numero = (SELECT count(esp_capacity) FROM espacio 
WHERE esp_capacity > cantidad) ;
RETURN NUMERO;
END//
DELIMITER ; 

/** en la siguiente funcion, se ingresa el ID de un evento, y devuelve el Nombre del evento y la fecha**/
drop function if exists fn_evento;
DELIMITER //
create function fn_evento (id int)
returns varchar (100)
deterministic
begin
declare eventofecha varchar (100);
select concat(event_name,'  ', event_date) as Nombre_del_Evento_y_Fecha from evento
where id_event = id into eventofecha;
return eventofecha;
end//
DELIMITER ;


-- ejemplos
select fn_evento(2);
select fn_capacidad(2000);



