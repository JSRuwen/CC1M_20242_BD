#drop schema estudoCaso_1
CREATE SCHEMA estudoCaso_1;

USE estudoCaso_1;

#criando tabelas simples
create table if not exists fornecedores(
FORNEC_COD int primary key,
FORNEC_NOME varchar(45) not null,
FORNEC_RUA varchar(45) not null,
FORNEC_NUMRUA int,
FORNEC_BAIRRO varchar(45) not null,
FORNEC_CIDADE varchar(45) not null,
FORNEC_ESTADO varchar(45) not null,
FORNEC_PAIS varchar(30) not null,
FORNEC_CODPOSTAL varchar(10) not null,
FORNEC_TELEFONE varchar(15) not null,
FORNEC_CONTATO text not null
);

create table if not exists filiais(
FILIAL_COD int primary key,
FILIAL_NOME varchar(45) not null,
FILIAL_RUA varchar(100) not null,
FILIAL_NUMRUA int,
FILIAL_BAIRRO varchar(50) not null,
FILIAL_CIDADE varchar(50) not null,
FILIAL_ESTADO varchar(50) not null,
FILIAL_PAIS varchar(50) not null,
FILIAL_CODPOSTAL varchar(10) not null,
FILIAL_CAPACIDADE text not null
);

create table if not exists produtos(
PROD_COD int primary key,
PROD_NOME varchar(50) not null,
PROD_DESCRICAO text not null,
PROD_ESPECTEC text not null,
PROD_QUANT decimal(10,3) not null,
PROD_PRECOUNIT decimal(10,2) not null,
PROD_UNIDMEDIDA varchar(10) not null,
PROD_ESTOQ_MIN decimal(10,3) not null
);

#criando tabelas com dependencias de foreign key

#CRIANDO A TABELA pedidos
create table if not exists pedidos(
PED_CODIGO int primary key,
PED_DATA date not null,
PED_HORA time not null,
PED_PREVISAO date not null,
PED_STATUS ENUM('pendente','concluído','a caminho'),
PED_FORNECEDOR int not null,
constraint FK_FORNECEDOR foreign key (PED_FORNECEDOR) references fornecedores(FORNEC_COD)
);

create table if not exists recebimentos(
RECEB_DATA date not null,
RECEB_HORA time not null,
RECEB_QUANT_PROD decimal(10,3),
RECEB_CONDICAO text not null,
RECEB_PEDIDOS int primary key,
constraint FK_PEDIDOS foreign key(RECEB_PEDIDOS) references pedidos(PED_CODIGO));

#criando tabelas associativas

create table if not exists PEDIDOS_PRODUTOS (
PDPR_PEDIDOS int,
PDPR_PRODUTOS int,
primary key(PDPR_PEDIDOS,PDPR_PRODUTOS),
PDPR_QUANT decimal(10,3) not null,
constraint PDPR_FK_PEDIDOS foreign key(PDPR_PEDIDOS) references pedidos(PED_CODIGO),
constraint PDPR_FK_PRODUTOS foreign key(PDPR_PRODUTOS) references produtos(PROD_COD)
);


create table if not exists FILIAIS_PRODUTOS (
FLPR_FILIAL int,
FLPR_PRODUTOS int,
primary key(FLPR_FILIAL,FLPR_PRODUTOS),
FLPR_QUANT decimal(10,3) not null,
constraint FLPR_FK_FILIAIS foreign key(FLPR_FILIAL) references filiais(FILIAL_COD),
constraint FLPR_FK_PRODUTOS foreign key(FLPR_PRODUTOS) references produtos(PROD_COD)
);

create table if not exists FORNECEDORES_PRODUTOS (
FRPR_FORNECEDOR int,
FRPR_PRODUTOS int,
primary key(FRPR_FORNECEDOR,FRPR_PRODUTOS),
constraint FRPR_FK_FORNECEDORES foreign key(FRPR_FORNECEDOR) references fornecedores(FORNEC_COD),
constraint FRPR_FK_PRODUTOS foreign key(FRPR_PRODUTOS) references produtos(PROD_COD)
);