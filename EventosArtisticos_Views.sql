-- Vistas. ejecutando este script, se crearan las vistas y se ejecutaran al final

-- vista para ver Eventos en el mes de marzo
create or replace view vw_march23_events as
select event_name as Evento_Marzo from evento where Event_Date between 20230301 and 20230331;

-- vista para ver los productores activos en eventos del dia 12 de marzo del 2023
create or replace view vw_prod_120323 as
select prod_name as Nombre, prod_lastname as Apellido, prod_phone as Telefono from productor
where id_prod = (select event_prod from evento where Event_Date = 20230312
);

-- vista del personal completo de empleados y productores implicados en todos los eventos del año

create or replace view vw_activeemp_23 as
select Prod_Name as nombre , prod_lastname as apellido from productor union
select Emp_Name , emp_lastname from empleado;

-- Capacidad de todos los espacion disponibles para eventos

create  or  replace view vw_spacescapacity as
select Esp_Name as Nombre, Esp_Capacity as Capacidad from espacio;

-- Emails de todo el personal y proveedores adheridos

create or replace view vw_emails as
select p.prod_email as Productores, e.emp_email as Empleados, pr.prov_email as Proveedores,
a.art_email as Artistas  from productor as p
join empleado as e on Id_Emp = Id_Prod join proveedor as pr on id_prod = id_prov
join artista as a on id_prov = id_art;

select * from vw_activeemp_23;
select * from vw_prod_120323;
select * from vw_march23_events;
select * from vw_spacescapacity;
