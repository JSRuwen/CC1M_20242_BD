create schema estudoCaso_5;

use estudoCaso_5;

#criando tabelas sem chaves estrangeiras
create table if not exists clientes (
cod_client int primary key,
client_cpf char(11) not null,
client_nome varchar(100) not null,
client_dataNasci date not null,
client_cidade varchar(100) not null,
client_estado varchar(100) not null,
client_bairro varchar(100) not null,
client_pais varchar(100) not null,
client_cep varchar(20) not null,
client_telefone varchar(15) not null,
client_email varchar(100) not null,
client_progFidelidade enum('Ativo','Pendente','Ausente') not null
);

alter table clientes add apelido text;
alter table clientes change column apelido client_apelido text;
alter table clientes modify client_apelido varchar(10);
alter table clientes drop column client_apelido;


create table if not exists fornecedores (
cnpj_fornec char(14) primary key,
fornec_nome varchar(100) not null,
fornec_telefone varchar(15) not null,
fornec_email varchar(100) not null,
fornec_cidade varchar(100) not null,
fornec_estado varchar(100) not null,
fornec_pais varchar(100) not null,
fornec_cep varchar(20) not null,
fornec_numero varchar(10)
);

alter table fornecedores add reputacao text;
alter table fornecedores change column reputacao fornecedor_reputacao text;
alter table fornecedores modify fornecedor_reputacao varchar(50);
alter table fornecedores drop column fornecedor_reputacao;


#criando tabelas COM chaves estrangeiras
create table if not exists produtos (
id_produtos int primary key,
produtos_nome varchar(100) not null,
produtos_categoria varchar(50) not null,
produtos_preco decimal(10, 2) not null,
produtos_quantdEstoque int not null,
id_fornecedores char(14) not null,
constraint fk_prodFornec foreign key (id_fornecedores) 
references fornecedores(cnpj_fornec)
);

alter table produtos add avaliacao text;
alter table produtos change column avaliacao produtos_avaliacao text;
alter table produtos modify produtos_avaliacao varchar(10);
alter table produtos drop column produtos_avaliacao;


create table if not exists vendas (
id_vendas int primary key,
vendas_data date not null,
vendas_valorTotal decimal(10,2) not null,
vendas_desconto decimal(10,2),
vendas_valorLiquid decimal(10,2) not null,
id_clientesVendas int not null,
constraint FK_clienteVendas foreign key(id_clientesVendas) references clientes(cod_client)
);

alter table vendas add tempo_desconto varchar(10);
alter table vendas change column tempo_desconto vendas_descontoTempo varchar(10);
alter table vendas modify vendas_descontoTempo datetime;
alter table vendas drop column vendas_descontoTempo;


create table if not exists pagamentos (
cod_pagamento int primary key,
pagamento_data date not null,
pagamento_valor decimal(10,2) not null,
pagamento_status enum('Ok', 'Ausente','Processando') not null,
pagamento_forma varchar(45) not null,
id_vendasPag int not null,
constraint FK_id_vendasPag foreign key(id_vendasPag) references vendas(id_vendas)
);

alter table pagamentos add recibo varchar(100);
alter table pagamentos change column recibo pagamento_recibo varchar(100);
alter table pagamentos modify pagamento_recibo text;
alter table pagamentos drop column pagamento_recibo;


#criando a tabela associativa
create table if not exists produtos_vendas (
prve_produtos int not null,
prve_vendas int not null,
prve_quantidade int not null,
prve_precoUnit decimal(10,2) not null,
constraint FK_prve_produtos foreign key(prve_produtos) references produtos(id_produtos),
constraint FK_prve_vendas foreign key(prve_vendas) references vendas(id_vendas)
);

alter table produtos_vendas add aquisicao varchar(10);
alter table produtos_vendas change column aquisicao prve_dataAquisicao varchar(10);
alter table produtos_vendas modify prve_dataAquisicao date;
alter table produtos_vendas drop column prve_dataAquisicao;


#criando uma tabela adicional
create table if not exists enderecos (
cod_ender int primary key,
ender_cpf char(11) not null,
ender_nome varchar(100) not null,
ender_dataNasci date not null,
ender_cidade varchar(100) not null,
ender_estado varchar(100) not null,
ender_bairro varchar(100) not null,
ender_pais varchar(100) not null,
ender_cep varchar(20) not null,
ender_telefone varchar(15) not null
);

drop table enderecos