USE estudoCaso_1;

/*create table if not exists fornecedores(
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
*/
insert into fornecederos(cod_forn, nome_forn, rua_forn, numrua_forn, bairro_forn, cidade_forn, estado_forn, pais_forn, codpostal_forn,telefone_forn, contato_forn) values
(1, 'Carrefour', 'rua da lama','22','jardim da penha','vitoria','ES','brasil','290120145','27-999999999', 'contatocarrefour@gmail.com'),
(2, 'Pão de Açúcar', 'avenida central', '100', 'centro', 'vitoria', 'ES', 'brasil', '290130256', '27-988888888', 'contatopao@dacal.com'),
(3, 'Extra', 'rua das flores', '45', 'praia do Canto', 'vitoria', 'ES', 'brasil', '290160367', '27-977777777', 'contatoextra@dacal.com'),
(4, 'Lojas Americanas', 'rua do sol', '78', 'bairro bela vista', 'vitoria', 'ES', 'brasil', '290140358', '27-966666666', 'contatolojas@dacal.com'),
(5, 'Bola Fashion', 'avenida principal', '155', 'jardim da glória', 'vitoria', 'ES', 'brasil', '290150467', '27-955555555', 'contatobolafashion@gmail.com');


update fornecedores set nome_forn = 'Pão de Açúcar' where nome_forn = 'Vitória Bolos';

delete from fornecedores where nome_forn = 'Vitória Bolos';
/*
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
*/
insert into filiais(cod_filial, nome_filial, rua_filial, numrua_filial, bairro_filial, cidade_filial, estado_filial, pais_filial, codpostal_filial, capacidade_filial) values
(1, 'Alcobaça', 'Rua Três Morros', '23', 'Boa Vista', 'São Mateus', 'ES', 'Brasil','29105012','5000kg')
(2, 'Vitória Transportes', 'Avenida Central', '45', 'Centro', 'Vitória', 'ES', 'Brasil', '29015012', '8000kg'),
(3, 'Expresso Norte', 'Rua das Palmeiras', '56', 'Praia do Canto', 'Linhares', 'ES', 'Brasil', '29120015', '12000kg'),
(4, 'Transporte Capixaba', 'Avenida do Sol', '89', 'Parque Moscoso', 'Serra', 'ES', 'Brasil', '29030018', '7500kg'),
(5, 'Logística Sudeste', 'Rua das Acácias', '34', 'Jardim Limoeiro', 'Cariacica', 'ES', 'Brasil', '29045022', '9500kg');


update filiais set nome_filial = 'Transporte Capixaba' where nome_filial = 'Alcatel';

delete from filiais where nome_filial = 'Alcatel';

/* create table if not exists produtos(
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
alter table produtos drop column histFabricacao; */

insert into produtos(cod_prod, nome_prod, descricao_prod, espectec_prod, quant_prod, precounid_prod, unidmedida_prod, estoqMin_prod) values
(1, 'Computador', 'Computador Rápido', 'Intel Core 2 Duo', '817', 'R$:1400,00', 'cm', '20'),
(2, 'Notebook', 'Flexibilidade', 'Intel i7', '1234', 'R$:3500,00', 'kg', '15'),
(3, 'Smartphone', 'Celular dos seus sonhos', 'Exynos 2200', '5678', 'R$:2500,00', 'cm', '30'),
(4, 'Monitor', 'Sinta a sincronização', 'LED 4K', '9101', 'R$:1200,00', 'cm', '10'),
(5, 'Impressora', 'Somente Preto e Branco', 'LaserJet Pro', '1122', 'R$:800,00', 'kg', '8');


update produtos set descricao_prod = 'Monitor com 120hz'  where nome_prod = 'Monitor';

delete from produtos where nome_prod = 'Mabel';

/* #criando tabelas com dependencias de foreign key
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
alter table pedidos drop column histFabricacao; */

insert into pedidos(cod_pedi, data_pedi, hora_pedi, previsao_ped, status_pedi, fornec_pedi) values
(1, '2024-06-12', '20:38', '2024-06-21', 'Na empresa', '23'),
(2, '2024-07-15', '09:45', '2024-07-20', 'A caminho', '30'),
(3, '2024-08-05', '14:22', '2024-08-12', 'No avião', '45'),
(4, '2024-09-10', '18:30', '2024-09-18', 'Correios', '50'),
(5, '2024-10-01', '11:00', '2024-10-10', 'Alfândega', '60');


update pedidos set status_pedi = 'Alfândega' where cod_pedi = 2;

delete from pedidos where cod_pedi = 2;

/*create table if not exists recebimentos(
data_receb date not null,
hora_receb time not null,
quantprod_receb decimal(10,3),
condicao_receb text not null,
pedidos_receb int primary key,
constraint FK_pedidos foreign key(pedidos_receb) references pedidos(cod_pedi));

alter table recebimentos add comentario text; 
alter table recebimentos change column comentario descricao text;
alter table recebimentos modify descricao varchar(500);
alter table recebimentos drop column descricao; */

/* #criando tabelas associativas

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
alter table pedidos_produtos drop column histFabricacao; */


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
