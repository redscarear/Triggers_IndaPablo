use eventos_artisticos;

-- se crean las dos tablas de Log, para las tablas de Espacio y Productor

drop table log_espacio;
create table log_espacio (
Id_log int auto_increment not null,
Id_Esp int NOT NULL ,
Esp_Adress varchar(30) NOT NULL,
Esp_Email varchar(30) NOT NULL,
Esp_Name varchar(20) NOT NULL,
Esp_Capacity int NOT NULL,
Esp_Phone varchar(20) NOT NULL,
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
USUARIO VARCHAR(100) ,
FECHA_UPD_INS_DEL DATEtime,
PRIMARY KEY (ID_LOG));

drop table log_productor;
create table log_productor (
id_log int auto_increment not null,
Id_Prod int NOT NULL ,
Prod_Name varchar(20) NOT NULL,
Prod_LastName varchar(20) NOT NULL,
Prod_Phone varchar(20) NOT NULL,
Prod_Email varchar(30) NOT NULL,
Prod_Cuit varchar(13) NOT NULL,
NOMBRE_DE_ACCION VARCHAR(10) ,
NOMBRE_TABLA VARCHAR(50) ,
USUARIO VARCHAR(100) ,
FECHA_UPD_INS_DEL DATEtime,
PRIMARY KEY (ID_LOG));

-- se crearan dos triggers para cada tabla 

-- el siguiente es un trigger que guardara datos luego del Insert en la tabla Espacio

drop trigger trg_espacio;
delimiter //
create trigger trg_espacio after insert on espacio
FOR EACH ROW 
BEGIN
insert into log_espacio (Id_Esp, Esp_Adress,Esp_Email,Esp_Name, Esp_Capacity, Esp_Phone,  NOMBRE_DE_ACCION,
NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL)
values (new.id_esp, new.Esp_Adress, new.Esp_Email, new.Esp_Name, new.Esp_Capacity, new.Esp_Phone, 'update',
'espacio', CURRENT_USER(), NOW());
end //
delimiter ;

-- se inserta un registro, y luego se puede listar la informacion tanto de Espacio como de su log

insert into espacio (Esp_Adress, Esp_email, esp_name, esp_capacity, esp_phone)
values ('corrientes 150', 'Magarelo@pepe.com', 'Taxonomi', '15000', '29246354');

select * from espacio;
select * from log_espacio;

-- en el siguiente se guardara en LOG los datos anteriores al Delete en la tabla Espacio

drop trigger trg_del_espacio;
delimiter //
create trigger trg_del_espacio before delete on espacio
FOR EACH ROW 
BEGIN
insert into log_espacio (Id_Esp, Esp_Adress,Esp_Email,Esp_Name, Esp_Capacity, Esp_Phone,  NOMBRE_DE_ACCION,
NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL)
values (old.id_esp, old.Esp_Adress, old.Esp_Email, old.Esp_Name, old.Esp_Capacity, old.Esp_Phone, 'delete',
'espacio', CURRENT_USER(), NOW());
end //
delimiter ;

delete from espacio where id_esp = 4;

select * from espacio;
select * from log_espacio;

-- El siguiente es un trigger que guardara datos en su log antes de Update en la tabla Productor

drop trigger trg_upd_productor;

delimiter //
create trigger trg_upd_productor before update on productor
FOR EACH ROW 
BEGIN
insert into log_productor 
(Id_Prod, Prod_Name, Prod_LastName, Prod_Phone, Prod_Email, 
Prod_Cuit, NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL)
values (old.Id_Prod, old.Prod_Name, old.Prod_LastName, old.Prod_Phone, old.Prod_Email, 
old.Prod_Cuit, 'update', 'productor', CURRENT_USER(), NOW());
end //
delimiter ;

select * from productor;
update productor set prod_phone = 115383662 where id_prod = 2;
select * from log_productor;

-- el siguiente trigger guardara los datos en log luego de insertar en la tabla productor

drop trigger trg_ins_productor;
delimiter //
create trigger trg_ins_productor after insert on productor
FOR EACH ROW 
BEGIN
insert into log_productor 
(Id_Prod, Prod_Name, Prod_LastName, Prod_Phone, Prod_Email, 
Prod_Cuit, NOMBRE_DE_ACCION, NOMBRE_TABLA, USUARIO, FECHA_UPD_INS_DEL)
values (new.Id_Prod, new.Prod_Name, new.Prod_LastName, new.Prod_Phone, new.Prod_Email, 
new.Prod_Cuit, 'insert', 'productor', CURRENT_USER(), NOW());
end //
delimiter ;

insert into productor ( Prod_Name, Prod_LastName, Prod_Phone, Prod_Email, Prod_Cuit)
values ('Chengo' , 'Gonzales', '220536254', 'chengo@rosario.pk', '254021685');

