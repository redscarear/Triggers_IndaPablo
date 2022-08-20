-- Primero, se arma panel de creacion, borrado y uso del Schema

drop schema Eventos_Artisticos;
create schema Eventos_Artisticos; 
use Eventos_Artisticos;

-- Segundo, Se crean las tablas correspondientes

CREATE TABLE if not exists Productor (
  Id_Prod int NOT NULL auto_increment,
  Prod_Name varchar(20) NOT NULL,
  Prod_LastName varchar(20) NOT NULL,
  Prod_Phone varchar(20) NOT NULL,
  Prod_Email varchar(30) NOT NULL,
  Prod_Cuit varchar(13) not null,
  PRIMARY KEY (Id_Prod) );
  
   CREATE TABLE if not exists Espacio (
  Id_Esp int NOT NULL auto_increment,
  Esp_Adress varchar(30) NOT NULL,
  Esp_Email varchar(30) NOT NULL,
  Esp_Name varchar(20) NOT NULL,
  Esp_Capacity int(5) NOT NULL,
  Esp_Phone varchar(20) NOT NULL,
  PRIMARY KEY (Id_Esp)); 
  
  CREATE TABLE if not exists Artista (
  Id_Art int NOT NULL auto_increment,
  Art_Email varchar(30) NOT NULL,
  Art_Name varchar(20) NOT NULL,
  Art_Cuit varchar(13) NOT NULL,
  Art_Phone varchar(20) NOT NULL,
  PRIMARY KEY (Id_Art) );
  
  CREATE TABLE if not exists Empleado (
  Id_Emp int NOT NULL auto_increment,
  Emp_Espec int NOT NULL,
  Emp_Email varchar(30) NOT NULL,
  Emp_Name varchar(20) NOT NULL,
  Emp_Lastname varchar(20) NOT NULL,
  Emp_Phone varchar(20) NOT NULL,
  Emp_Cuit varchar(13) NOT NULL,
    PRIMARY KEY (Id_Emp) 
  );
  
  CREATE TABLE if not exists Proveedor (
  Id_Prov int NOT NULL auto_increment,
  Prov_Tipo int NOT NULL,
  Prov_Email varchar(30) NOT NULL,
  Prov_Name varchar(15) NOT NULL,
  Prov_Phone varchar(20) NOT NULL,
  Prov_Cuit varchar(13) NOT NULL,
    PRIMARY KEY (Id_Prov) 
  );
  
  CREATE TABLE if not exists Evento (
  Id_Event int NOT NULL auto_increment,
  Event_Date date NOT NULL,
  Event_Name varchar(15) NOT NULL,
  Event_Prod INT NOT NULL,
  Event_Art int NOT NULL,
  Event_Emp int Not null,
  Event_Prov int Not null,
  PRIMARY KEY (Id_Event) );
  
  Create table if not exists Emp_Espec (
  Id_Emp_Espec int not null,
  Emp_Espec_Desc varchar (20) not null,
  primary key (Id_Emp_Espec));
  
  Create table if not exists Prov_Tipo (
  Id_Prov_Tipo int not null,
  Prov_Tipo_Desc varchar (20) not null,
  primary key (Id_Prov_Tipo));
  

 -- Tercero, se agregan las FK
 
 alter table Evento add 
FOREIGN KEY (Event_Prod) REFERENCES Productor (Id_Prod);
alter table Evento add
FOREIGN KEY (Event_Art) REFERENCES Artista (Id_Art);
alter table Evento add
FOREIGN KEY (Event_Emp) REFERENCES Empleado (Id_Emp);
alter table Evento add
FOREIGN KEY (Event_Prov) REFERENCES Proveedor (Id_Prov);
alter table Empleado add
foreign key (Emp_Espec) references Emp_Espec (Id_Emp_Espec);
alter table Proveedor add
foreign key (Prov_Tipo) references Prov_Tipo (Id_Prov_Tipo);

  
