create database MercAppBD;

use MercAppBD;

create table Usuario(
id_usu int(10) not null auto_increment primary key,
correo varchar(50) not null,
nombre varchar(100) not null,
apellido varchar(100) not null,
user_name varchar(30) not null, 
contraseña varchar(10) not null,
imagen varchar(100) not null,
imagenN varchar(100) not null,
tipo int(2) not null,
tipo_admi int(10) not null,
estado_bloqueo int(10) not null,
estado_baja int(10) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table tarjeta(
id_tar int(10) not null auto_increment primary key,
id_usu int(10) not null,
numero varchar(50) not null,
nombre varchar(50) not null,
mes int(10) not null,
año int(200) not null,
cvv int(5) not null,
foreign key (id_usu) references usuario(id_usu) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

insert into usuario values (1,'sin correo','admin','admin','admin','1234','null','null',0,1,0,0),
(2,'sin correo','editor','editor','editor','1234','null','null',0,2,0,0),(3,'sin correo','agente_reportes','agente_reportes','Areportes','1234','null','null',0,3,0,0)
,(4,'sin correo','gerente_reportes','gerente_reportes','Greportes','1234','null','null',0,4,0,0)
,(5,'sin correo','ingeniero_soporte','ingeniero_soporte','Isoporte','1234','null','null',0,5,0,0);

create table Tienda(
id_tie int(10) not null auto_increment primary key,
id_usu int(10) not null,
estado_bloqueo int(10) not null,
estado_baja int(10) not null,
nombre varchar(100) not null,
descripcion varchar(150) not null,
localizacion varchar(200) not null,
env_dom int(10) not null,
imagen varchar(100) not null,
imagenN varchar(100) not null,
foreign key (id_usu) references usuario(id_usu) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table Reseña(
id_res int(10) not null auto_increment primary key,
id_tie int(10) not null,
id_usu int(10) not null,
resena varchar(50) not null,
foreign key (id_usu) references usuario(id_usu) on delete cascade on update cascade,
foreign key (id_tie) references tienda(id_tie) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table Producto(
id_pro int(10) not null auto_increment primary key,
id_tie int(10) not null,
nombre varchar(20) not null, 
descripcion varchar(100) not null,
costo decimal(10,2) not null,
disponibilidad int(10) not null,
ofertaDiso char(3) not null,
ofertaDesc varchar(50) not null,
imagen varchar(100) not null,
imagenN varchar(100) not null,
foreign key (id_tie) references tienda(id_tie) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table CarritoCompras(
id_car int(10) not null auto_increment primary key,
id_usu int(10) not null,
id_tie int(10) not null,
foreign key (id_usu) references usuario(id_usu) on delete cascade on update cascade,
foreign key (id_tie) references tienda(id_tie) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table RelCarPro(
id_rel int(10) not null auto_increment primary key,
id_pro int(10) not null,
id_car int(10) not null,
cantidad int(10) not null,
foreign key (id_pro) references producto(id_pro) on delete cascade on update cascade,
foreign key (id_car) references Carritocompras(id_car) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table EstadoVenta(
id_est int(10) not null auto_increment primary key,
estado varchar(50) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

insert into EstadoVenta values (1,'Pedido hecho'),(2,'En espera de recogerlo'),
(3,'En proceso de entrega'),(4,'Venta finalizada aún sin vizualizar'),(5,'Venta finalizada y vizualizada'),(6,'Pedido cancelado');


create table venta(
id_ven int(10) not null auto_increment primary key,
id_tie int(10) not null,
id_usu int(10) not null,
id_est int(10) not null,
cont_fin int(10) not null,
tipo_venta varchar(15) not null,
total decimal(10,2) not null,
tipo_pago varchar(20) not null,
direccion varchar(50) not null,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP null,
foreign key (id_tie) references tienda(id_tie) on delete cascade on update cascade,
foreign key (id_usu) references usuario(id_usu) on delete cascade on update cascade,
foreign key (id_est) references estadoventa(id_est) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table relvenpro(
id_rel int(10) not null auto_increment primary key,
id_ven int(10) not null,
id_pro int(10) not null,
cantidad int(10) not null,
foreign key (id_ven) references venta(id_ven) on delete cascade on update cascade,
foreign key (id_pro) references producto(id_pro) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table Chat(
id_chat int(10) not null auto_increment primary key,
id_usu1 int(10) not null,
id_usu2 int(10) not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table Mensajes(
id_men int(10) not null auto_increment primary key,
id_chat int(10) not null,
id_usu int(10) not null,
mensaje varchar(150) not null,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
foreign key (id_chat) references chat(id_chat) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table Mensajes_admin(
id_men int(10) not null auto_increment primary key,
idUnic varchar(20) not null,
id_usu int(10) not null,
mensaje varchar(250) not null,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
foreign key (id_usu) references usuario(id_usu) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table reportes_tienda(
id_rep int(10) not null auto_increment primary key,
id_tie int(10) not null,
num_rep int(10) not null,
tipo_reporte varchar(80) not null,
asunto varchar(100) not null,
reporte varchar(255) not null,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table reportes_usuarios(
id_rep int(10) not null auto_increment primary key,
id_usu int(10) not null,
num_rep int(10) not null,
tipo_reporte varchar(80) not null,
asunto varchar(100) not null,
reporte varchar(255) not null,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

create table FAQS(
id_pre int(10) not null primary key auto_increment,
id_usu int(10) not null,
preguta varchar(100) not null,
respuesta varchar(140) not null,
estado int(10) not null,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
foreign key (id_usu) references usuario(id_usu) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

insert into FAQS value(1,2,'¿Como se sube una promocion a mi tienda?','Dentro de la sección de tu tienda se podrá editar y agregar una promoción',2,NOW())
,(2,2,'¿Como puedo poner mi foto de pergil?','Dentro de la sección configuracion, en el vinculo de cambiar foto',2,NOW())
,(3,2,'¿Cuantos productos se pueden agregar al carrito de compras?','No hay límite',2,NOW())
,(4,2,'¿Se pueden modificar los datos del usuario?','Si, en la seccion de configuracion',2,NOW())
,(5,2,'¿Puedo hacer compras como invitado?','No, debes crear una cuenta o iniciar sesion si tienes una',2,NOW())
,(6,2,'¿La aplicacion sigue sirviendo hasta las 11pm?','La aplicacion funciona 24/7',2,NOW());

create table reporte(
id_rep int(10) not null auto_increment primary key,
id_usu int(10) not null,
nombre varchar(50) not null,
asunto varchar(150) not null,
reporte varchar(600) not null,
solucion varchar(600) not null,
estado_reporte varchar(100) not null,
baja int(10) not null,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP not null,
fechaCambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP null,
foreign key (id_usu) references usuario(id_usu) on delete cascade on update cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

insert into reporte values
 (1,3,'Juan','Comentarios deshabilitados','Los usuarios no pueden escribir comentarios en las tiendas.','Sin solucion','Abierto',0,NOW(),null)
,(2,3,'Pedro','Falla en los pagos','Los usuarios no pueden dar de alta una tarjeta de crédito.','Sin solucion','Abierto',0,NOW(),null)
,(3,3,'José','Error al iniciar sesión','Al iniciar sesión, se redirige a la pantalla de configuración y no de inicio.','Sin solucion','Abierto',0,NOW(),null)
,(4,3,'Antonio','Datos de contacto','El usuario no es capaz de editar sus datos de contacto.','Sin solucion','Abierto',0,NOW(),null)
,(5,3,'Luis','Desorden en la interfaz','Los elementos como cuadros de texto y botones están fuera de lugar.','Sin solucion','Abierto',0,NOW(),null)
,(6,3,'Juan','Bloqueo en el chat','No es posible escribir mensajes donde corresponde.','Sin solucion','Abierto',0,NOW(),null)
,(7,3,'Pedro','Barra de búsqueda no intituiva','Al buscar algo en la barra de búsqueda solo despliega tiendas y no productos.','Sin solucion','Abierto',0,NOW(),null);

create table solucion(
id_sol int(10) not null auto_increment primary key,
id_rep int(10) not null,
ing_asig varchar(100) not null,
estado_solucion varchar(100) not null,
tipo_mantenimiento varchar(100) not null,
observaciones varchar(600) not null,
foreign key (id_rep) references reporte(id_rep) on delete cascade on update cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=default;

insert into solucion values
(1,1,'Sin asignar','En espera','En espera','Sin obervaciones'),
(2,2,'Sin asignar','En espera','En espera','Sin obervaciones'),
(3,3,'Sin asignar','En espera','En espera','Sin obervaciones'),
(4,4,'Sin asignar','En espera','En espera','Sin obervaciones'),
(5,5,'Sin asignar','En espera','En espera','Sin obervaciones'),
(6,6,'Sin asignar','En espera','En espera','Sin obervaciones'),
(7,7,'Sin asignar','En espera','En espera','Sin obervaciones');

select * from usuario;
delete  from estadoventa where id_est=4;
select count(*) FAQS;
select * from solucion;
select * from usuario;

insert into chat values (1,4,5);

select count(*) from chat where id_usu1=5 and id_usu2=4;


describe reporte;
drop table solucion;

select count(*) from venta where id_usu = 6 and id_est < 3;
select * from tienda;
drop database mercappbd;

use mercappbd;

drop table carritocompras;
drop table venta;
select * from venta;
select * from mensajes;
drop database mercappbd;
insert into chat values (2,3,4);

drop database mercappbd;
Select * from reporte;
Select * from reportes_usuarios;
Select * from tienda;
Select * from usuario;
select id_usu1, id_usu2 from chat where id_usu1 ='4' or id_usu1='3' and id_usu2='4' or id_usu2='3';
select * from chat where id_usu1 = 2 or id_usu2 = 2;
select * from relcarpro where id_car=1;

select id_tie from producto where id_pro=1;
describe venta;

select * from relvenpro inner join producto;

select * from reseña inner join usuario where reseña.id_tie=1;


select count(*), producto.nombre from producto where id_pro=1;

insert into venta values(1,1,2,255.0,NOW());

select count(*),id_car from carritocompras where id_usu='3';
