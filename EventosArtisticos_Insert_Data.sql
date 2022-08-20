insert into Artista ( Art_Email, Art_Name, Art_Cuit, Art_Phone )
values ( 'Rolo@colo.co' , 'Rolitos' , '20328526545', '1156279541' ), 
( 'bigger@gmail.com' , 'Bigger' , '2029850215', '1196325574' ),
( 'Parte@planeta.nx' , 'Parteplaneta' , '2092582624', '1154859541' ) ;

insert into prov_tipo values ( 1 , 'catering'), (2, 'transporte'), (3, 'iluminacion'),
(4, 'sonido'), (5, 'imprenta'), (6, 'merchandising');

insert into emp_espec values (1, 'sonido') , (2, 'iluminacion'), (3, 'seguridad'), (4, 'electricidad'),
(5, 'Atencion al publico');

insert into Empleado ( Emp_Espec, Emp_Email, Emp_Name, Emp_Lastname, Emp_Phone, Emp_Cuit )
values ( 1, 'ramones@gmail.com', 'Guillermo', 'Gonzalez', '118563547', '275232552' ),
(2, 'lean@fito.es', 'Leandro', 'Ousset', '118751547', '277732552' ) ,
(3, 'Jorge@hotmail.com', 'Jorge', 'Lista', '118441547', '277785252' ) ;
          
insert into Espacio (Esp_Adress, Esp_email, esp_name, esp_capacity, esp_phone)
values ('Alcorta 622', 'Quimica@flow.com', 'Quimica', '5000', '299256354'),
('niceto 922', 'niceto@terra.com', 'niceto', '2500', '116538555'),
('Corrientes 52', 'Emergente@ortuzar.co', 'Emergente', '1600', '119562541');

insert into productor ( Prod_Name, Prod_LastName, Prod_Phone, Prod_Email, Prod_Cuit)
values ('Maru' , 'Polak', '119536254', 'maru@polak.pk', '273021685'),
('Luciano', 'Villace', '115982632', 'luciano@human.com', '203269547'),
('Fernando', 'taborda', '118526582', 'oliver@knos.com', '20255652');

insert into proveedor (Prov_Tipo, Prov_Email, Prov_Name, Prov_Phone, Prov_Cuit)
values (1, 'polloshermanos@fringe.tx', 'Pollos hermanos', '1159268856', '302596215'),
(3, 'thunder@force.jp', 'Thunder Force', '299862354', '329665834'),
(2, 'transoceanica@terra.es', 'Transoceanica', '220536504', '359558610'),
(5, 'impremax@yahoo.com', 'Impremax', '118965324', '362201479'),
(4, 'Ultrasound@hotmail.com', 'Ultra Sound', '1153268852', '33253652258');

insert into evento (event_date, event_name, Event_Prod, Event_Art, Event_Emp, Event_Prov)
values (20230312, 'Gerard Fest',  2, 1 , 3, 2),
('20230803', 'Salamuth',  3,2,3,1),
('20230605', 'Freedom ice', 1, 1, 2,4);
