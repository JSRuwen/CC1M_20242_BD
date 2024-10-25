#create schema atividade_2;

use atividade_2;

create table if not exists grupo (
id_grupo int primary key,
nome_grupo varchar(100) not null,
descricao text not null
);

create table if not exists usuarios (
id_usuario int primary key,
nome_usuario varchar(100) not null,
sobrenome varchar(100) not null,
email varchar(20) not null
);

#tabela com chave estrangeiras
create table if not exists postagens (
id_posts int primary key,
texto_post text,
imagem_post blob,
data_hora_post datetime not null,
usuario_post int not null,
constraint FK_usuario foreign key(usuario_post) references usuarios(id_usuario)
);

create table if not exists comentarios (
id_comentario int primary key,
texto text not null,
datahora datetime not null,
usuario int not null,
post int null,
constraint FK_usuarioscom foreign key(usuario) references usuarios(id_usuario),
constraint FK_posts foreign key(post) references postagens(id_posts)
);

#criando as entidades associativas
create table if not exists usuarios_grupos (
ug_usuario int,
ug_grupo int,
primary key(ug_usuario, ug_grupo),
constraint FK_ug_usuarios foreign key(ug_usuario) references usuarios(id_usuario),
constraint FK_ug_grupo foreign key(ug_grupo) references grupo(id_grupo)
);

create table if not exists seguidores_usuarios (
su_usuario int,
su_seguidores int,
primary key(su_usuario, su_seguidores),
constraint FK_su_usuario foreign key(su_usuario) references usuarios(id_usuario),
constraint FK_su_seguidores foreign key(su_seguidores) references usuarios(id_usuario)
);

