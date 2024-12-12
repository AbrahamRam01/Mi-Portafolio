create database NutriSoft;

use NutriSoft;

create table Tip_Alimento(
id_TipAli int(10) not null auto_increment primary key,
nom_TipAli varchar(50) not null
);

create table Tip_Comentario(
id_TipCom int(10) not null auto_increment primary key,
nom_TipCom varchar(50) not null
);

create table Usuario(
id_usu int(10) not null auto_increment Primary Key,
nom_us varchar(100) not null,
nombre varchar(100) not null,
aPaterno varchar(100) not null,
aMaterno varchar(100) not null,
contraseña varchar(100) not null,
tipo_us int(10) not null,
ImgUrl_usu longblob not null
);

create table Comentario(
id_com int(10) not null auto_increment primary key,
id_usu int(10) not null,
id_TipCom int(10) not null,
comentario varchar(150) not null,
fecha DATETIME not null,
FOREIGN KEY (id_usu) REFERENCES Usuario(id_usu),
FOREIGN KEY (id_TipCom) REFERENCES Tip_Comentario(id_TipCom)
);

create table Alimento(
id_alimento int(20) not null auto_increment Primary Key,
visto int(1) not null,
nom_alimento varchar(200) not null,
des_alimento varchar(500) not null,
id_TipAli int(10) not null,
ImgUrl_ali longblob not null,
FOREIGN KEY (id_TipAli) REFERENCES Tip_Alimento(id_TipAli) ON UPDATE CASCADE
);

create table Receta(
id_rec int(10) not null auto_increment Primary Key,
visto int(1) not null,
nom_rec varchar(100) not null,
des_rec varchar(200) not null,
ImgUrl_rec longblob not null
);

create table Dieta(
id_die int(20) not null auto_increment primary key,
visto int(1) not null,
nom_die varchar(100) not null,
des_dieta varchar(200) not null,
ImgUrl_die longblob not null
);

create table Rel_RecAli(
id_RelAli int(10) not null auto_increment primary key,
id_rec int(10) not null,
id_alimento int(20) not null,
FOREIGN KEY (id_rec) REFERENCES Receta(id_rec) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_alimento) REFERENCES Alimento(id_alimento) ON DELETE CASCADE ON UPDATE CASCADE
);

create table rel_RecDie(
id_relRecDie int(20) not null auto_increment primary key,
id_rec int(10) not null,
id_die int(10) not null,
FOREIGN KEY (id_rec) REFERENCES Receta(id_rec) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_die) REFERENCES Dieta(id_die) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Favorito_Dieta(
id_fav int(10) not null auto_increment primary Key,
id_usu int(10) not null,
id_die int(20) not null,
FOREIGN KEY (id_die) REFERENCES Dieta(id_die) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_usu) REFERENCES Usuario(id_usu) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Favorito_Receta(
id_fav int(10) not null auto_increment primary Key,
id_usu int(10) not null,
id_rec int(20) not null,
FOREIGN KEY (id_rec) REFERENCES Receta(id_rec) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_usu) REFERENCES Usuario(id_usu) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Favorito_Alimento(
id_fav int(10) not null auto_increment primary Key,
id_usu int(10) not null,
id_alimento int(20) not null,
FOREIGN KEY (id_alimento) REFERENCES Alimento(id_alimento) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_usu) REFERENCES Usuario(id_usu) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Mi_Alimento(
id_miAli int(20) not null auto_increment Primary Key,
id_usu int(10) not null,
nom_alimento varchar(200) not null,
des_alimento varchar(500) not null,
id_TipAli int(10) not null,
ImgUrl_ali longblob not null,
FOREIGN KEY (id_TipAli) REFERENCES Tip_Alimento(id_TipAli) ON UPDATE CASCADE,
FOREIGN KEY (id_usu) REFERENCES Usuario(id_usu) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Mi_Receta(
id_miRec int(10) not null auto_increment Primary Key,
id_usu int(10) not null,
nom_rec varchar(100) not null,
des_rec varchar(200) not null,
ImgUrl_rec longblob not null,
FOREIGN KEY (id_usu) REFERENCES Usuario(id_usu) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Mi_Dieta(
id_miDie int(20) not null auto_increment primary key,
id_usu int(10) not null,
nom_die varchar(100) not null,
des_dieta varchar(200) not null,
ImgUrl_die longblob not null,
FOREIGN KEY (id_usu) REFERENCES Usuario(id_usu) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Rel_MiRecAli(
id_MiRelAli int(10) not null auto_increment primary key,
id_miRec int(10) not null,
id_miali int(20) not null,
FOREIGN KEY (id_miRec) REFERENCES Mi_Receta(id_miRec) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_miAli) REFERENCES Mi_Alimento(id_miAli) ON DELETE CASCADE ON UPDATE CASCADE
);

create table rel_MiRecDie(
id_MiRelRecDie int(20) not null auto_increment primary key,
id_miRec int(10) not null,
id_miDie int(10) not null,
FOREIGN KEY (id_miRec) REFERENCES Mi_Receta(id_miRec) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_miDie) REFERENCES Mi_Dieta(id_miDie) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Amigos(
id_ami int(10) not null auto_increment primary key
);

create table Rel_UsuAmi(
id_RelAmi int(10) not null auto_increment primary key,
id_usu int(10) not null,
id_ami int(10) not null,
FOREIGN KEY (id_ami) REFERENCES Amigos(id_ami) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_usu) REFERENCES Usuario(id_usu) ON DELETE CASCADE ON UPDATE CASCADE
);

create table Mensajes(
id_men int(10) not null auto_increment primary key,
id_RelAmi int(10) not null,
mensaje varchar(100) not null,
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_RelAmi) REFERENCES Rel_UsuAmi(id_RelAmi) ON DELETE CASCADE ON UPDATE CASCADE
);

create table rel_comali(
id_rel int(10) not null auto_increment primary key,
id_alimento int(20) not null,
id_com int(10) not null,
FOREIGN KEY (id_alimento) REFERENCES Alimento(id_alimento) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_com) REFERENCES comentario(id_com) ON DELETE CASCADE ON UPDATE CASCADE
);

create table rel_comrec(
id_rel int(10) not null auto_increment primary key,
id_rec int(10) not null,
id_com int(10) not null,
FOREIGN KEY (id_rec) REFERENCES Receta(id_rec) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_com) REFERENCES comentario(id_com) ON DELETE CASCADE ON UPDATE CASCADE
);

create table rel_comdie(
id_rel int(10) not null auto_increment primary key,
id_die int(20) not null,
id_com int(10) not null,
FOREIGN KEY (id_die) REFERENCES Dieta(id_die) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_com) REFERENCES comentario(id_com) ON DELETE CASCADE ON UPDATE CASCADE
);