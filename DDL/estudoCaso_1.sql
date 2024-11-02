#drop schema estudoCaso_1;
CREATE SCHEMA estudoCaso_1;

USE estudoCaso_1;

#criando tabelas simples
create table if not exists fornecedores(
cod_forn int primary key,
nome_forn varchar(45) not null,
rua_forn varchar(45) not null,
numrua_forn int,
bairro_forn varchar(45) not null,
cidade_forn varchar(45) not null,
estado_forn varchar(45) not null,
pais_forn varchar(30) not null,
codpostal_forn varchar(10) not null,
telefone_forn varchar(15) not null,
contato_forn text not null
);

alter table fornecedores add registro text; 
alter table fornecedores change column registro historicoContato text;
alter table fornecedores modify historicoContato date;
alter table fornecedores drop column historicoContato;


create table if not exists filiais(
cod_filial int primary key,
nome_filial varchar(45) not null,
rua_filial varchar(100) not null,
numrua_filial int,
bairro_filial varchar(50) not null,
cidade_filial varchar(50) not null,
estado_filial varchar(50) not null,
pais_filial varchar(50) not null,
codpostal_filial varchar(10) not null,
capacidade_filial text not null
);

alter table filiais add registro text; 
alter table filiais change column registro historicoContato text;
alter table filiais modify historicoContato date;
alter table filiais drop column historicoContato;


create table if not exists produtos(
cod_prod int primary key,
nome_prod varchar(50) not null,
descricao_prod text not null,
espectec_prod text not null,
quant_prod decimal(10,3) not null,
precounid_prod decimal(10,2) not null,
unidmedida_prod varchar(10) not null,
estoqMin_prod decimal(10,3) not null
);

alter table produtos add registro text; 
alter table produtos change column registro histFabricacao text;
alter table produtos modify histFabricacao time;
alter table produtos drop column histFabricacao;


#criando tabelas com dependencias de foreign key
create table if not exists pedidos(
cod_pedi int primary key,
data_pedi date not null,
hora_pedi time not null,
previsao_pedi date not null,
status_pedi ENUM('pendente','concluído','a caminho'),
fornec_pedi int not null,
constraint FK_fornecedor foreign key (fornec_pedi) references fornecedores(cod_forn)
);

alter table pedidos add registro text; 
alter table pedidos change column registro histFabricacao text;
alter table pedidos modify histFabricacao time;
alter table pedidos drop column histFabricacao;


create table if not exists recebimentos(
data_receb date not null,
hora_receb time not null,
quantprod_receb decimal(10,3),
condicao_receb text not null,
pedidos_receb int primary key,
constraint FK_pedidos foreign key(pedidos_receb) references pedidos(cod_pedi));

alter table recebimentos add comentario text; 
alter table recebimentos change column comentario descricao text;
alter table recebimentos modify descricao varchar(500);
alter table recebimentos drop column descricao;


#criando tabelas associativas

create table if not exists pedidos_produtos (
pdpr_pedidos int,
pdpr_produtos int,
pdpr_quant decimal(10,3) not null,
primary key(pdpr_pedidos,pdpr_produtos),
constraint pdpr_FK_pedidos foreign key(pdpr_pedidos) references pedidos(cod_pedi),
constraint pdpr_FK_produtos foreign key(pdpr_produtos) references produtos(cod_prod)
);

alter table pedidos_produtos add registro text; 
alter table pedidos_produtos change column registro histFabricacao text;
alter table pedidos_produtos modify histFabricacao time;
alter table pedidos_produtos drop column histFabricacao;


create table if not exists filiais_produtos (
flpr_filial int,
flpr_produto int,
flpr_quant decimal(10,3) not null,
primary key(flpr_filial,flpr_produto),
constraint flpr_FK_filial foreign key(flpr_filial) references filiais(cod_filial),
constraint flpr_FK_produto foreign key(flpr_produto) references produtos(cod_prod)
);

alter table filiais_produtos add estoqueMin_fipr int;
alter table filiais_produtos change column estoqueMin_fipr fipr_capacidadeEstoque int;
alter table filiais_produtos modify column fipr_capacidadeEstoque int not null;
alter table filiais_produtos drop column fipr_capacidadeEstoque;


create table if not exists fornec_produtos (
frpr_fornec int,
frpr_produto int,
primary key(frpr_fornec,frpr_produto),
constraint frpr_FK_fornec foreign key(frpr_fornec) references fornecedores(cod_forn),
constraint frpr_FK_produto foreign key(frpr_produto) references produtos(cod_prod)
);

alter table fornec_produtos ADD avaliacao text not null;
alter table fornec_produtos CHANGE COLUMN avaliacao fopr_avaliacao text;
alter table fornec_produtos MODIFY COLUMN fopr_avaliacao decimal(2,0);
alter table fornec_produtos DROP COLUMN fopr_avaliacao;

#># criando uma tabela adicional (drop) #<#

create table if not exists empresas(
cod_empresas int primary key,
nome_empresas varchar(45) not null,
rua_empresas varchar(100) not null,
numrua_empresas int,
bairro_empresas varchar(50) not null,
cidade_empresas varchar(50) not null,
estado_empresas varchar(50) not null,
pais_empresas varchar(50) not null,
codpostal_empresas varchar(10) not null
);

drop table empresas