use eventos_artisticos;

/** El siguiente SP, sirve para ver una tabla ordenando por el campo que se prefiera, 
de manera ascendente o descendente, de la tabla PROVEEDORES 
al final de la creacion, hay dos ejemplos para utilizar el SP
**/

drop procedure if exists sp_ordenar_proveedores;

delimiter \\
create procedure sp_ordenar_proveedores
(inout param_order varchar (32), inout param_asc_desc varchar(32))
begin
set @t1 = concat('select * from proveedor u order by', ' ', param_order, ' ', param_asc_desc);
prepare param_stmt from @t1;
execute param_stmt;
deallocate prepare param_stmt;
end \\
delimiter ;

-- Ejemplos del primer SP

set @param_order = 'Prov_Name';
set @param_asc_desc = 'desc';
call sp_ordenar_proveedores (@param_order , @param_asc_desc);

set @param_order = 'Prov_cuit';
set @param_asc_desc = 'desc';
call sp_ordenar_proveedores (@param_order , @param_asc_desc);

-- insercion y borrado de registros por SP
/** con el siguiente SP , se podran insertar registros a partir de parametros que responden a campos obligatorios de la tabla,
o borrar registros a partir del Id del registro que se quiere eliminar.
Para insertar registros, hay que setear el parametro 'p_id_emp' en 0 , y luego setear los demas 
parametros. El condicional del SP, al encontrar ese parametro en 0, tiene la funcion de insertar
los datos de los demas parametros.
En el caso de que 'p_id_emp' sea distinto de cero, es decir, se ingrese un numero que corresponderia
con el ID del Empleado a borrar, de ser asi, solo se setea ese campo, y borrara el registro que 
contenga ese ID en la tabla de Empleados **/

drop procedure if exists sp_updel_empleado;

 delimiter \\
create procedure sp_updel_empleado
(inout p_Id_Emp int,
 inout p_Emp_Espec int ,
 inout p_Emp_Email varchar(30) ,
 inout p_Emp_Name varchar(20) ,
 inout p_Emp_Lastname varchar(20) ,
 inout p_Emp_Phone varchar(20) ,
 inout p_Emp_Cuit varchar(13))
   begin
  if ( p_id_Emp = 0) then
  insert into empleado ( Emp_Espec, Emp_Email, Emp_Name, Emp_Lastname, Emp_Phone, Emp_Cuit )
  values (@p_Emp_Espec, @p_Emp_Email, @p_Emp_Name, @p_Emp_Lastname , @p_Emp_Phone, @p_Emp_Cuit);
  else
  delete from empleado where id_emp = @p_Id_Emp ;
  end if;
 end \\
  delimiter ;
  
  -- ejemplo de insercion de datos
  /** en el caso de insercion, se setea el parametro @p_id_emp = 0, y tambien los demas parametros
 con los datos con el formato que requiera la tabla **/
 
set 
  @p_id_emp = 0 ,
  @p_Emp_Espec = 1
  , @p_Emp_Email = 'fenix@tool.net'
  , @p_Emp_Name = 'jorge'
  , @p_Emp_Lastname = 'usuriaga'
  , @p_Emp_Phone = '112659663'
  , @p_Emp_Cuit = '213625896';  
  
  call sp_updel_empleado
  (@p_id_emp, @p_Emp_Espec, @p_Emp_Email, @p_Emp_Name, @p_Emp_Lastname , @p_Emp_Phone, @p_Emp_Cuit);
  
  -- Ejemplo de borrado de registro
  /** En este caso, se setea el parametro @p_id_emp con un valor, que deber ser igual al ID
  del registro a borrar, por eso hay que chequear en la tabla el ID del registro que se quiere eliminar
  **/
  select * from empleado; -- asi vemos cual es el ID del registro a eliminar
  
  set @p_id_emp = 7;
  
  call sp_updel_empleado
  (@p_id_emp, @p_Emp_Espec, @p_Emp_Email, @p_Emp_Name, @p_Emp_Lastname , @p_Emp_Phone, @p_Emp_Cuit);
  