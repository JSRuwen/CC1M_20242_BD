#create schema atividade_3;
use atividade_3;

create table if not exists espectadores (
id_espec int primary key,
tel_espec varchar(20) not null,
email_espec varchar(20) not null,
nome_espec varchar(100) not null,
data_nasc date not null
);

create table if not exists filmes (
id_filme int primary key,
nome_filme varchar(100) not null,
distribuidor_filme varchar(100) not null,
tempo_filme int not null,
diretor_filme varchar(50) not null
);

create table if not exists salas (
id_sala int primary key,
nome_sala varchar(50) not null,
capacidade_sala int not null
);

#criando tabelas com foreign keys
create table if not exists sessoes (
id_sessao int primary key,
filme int not null,
sala int not null,
constraint FK_filme foreign key(filme) references filmes(id_filme),
constraint FK_sala foreign key(sala) references salas(id_sala)
);

create table if not exists ingressos (
id_ingresso int primary key,
data_ing date not null,
hora_ing time not null,
sessao int not null,
espectador int not null,
constraint FK_sessao foreign key(sessao) references sessoes(id_sessao),
constraint FK_espectador foreign key(espectador) references espectadores(id_espec)
);
