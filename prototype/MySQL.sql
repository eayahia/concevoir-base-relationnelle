drop database if exists prototype;
create database prototype ;
use prototype ;
create table utilisateur (
id_utilisateur int primary key auto_increment ,
nom varchar(45) not null,
email varchar (45) not null ,
date_naissance date not null ,
mot_de_pass varchar (45) not null 
)comment='Table de utilisateur';
 create table categorie (
 id_categorie int primary key auto_increment ,
 nom varchar(45)
 )comment='Table de categorie';

create table article (
id_article int primary key auto_increment ,
titre varchar(45) not null , 
contenu text not null ,
date_publication date ,
statut enum ('publier','draft') ,
id_utilisateur int ,
foreign key (id_utilisateur) references utilisateur(id_utilisateur) ,
id_categorie int ,
 foreign key (id_categorie) references categorie(id_categorie)
)comment='Table de article';
create table commentaire (
id_commentaire int primary key auto_increment ,
contenu text not null ,
date_publication date ,
id_utilisateur int ,
foreign key (id_utilisateur) references utilisateur(id_utilisateur) ,
id_article int ,
 foreign key (id_article) references article(id_article)
 )comment='Table de commentaire';