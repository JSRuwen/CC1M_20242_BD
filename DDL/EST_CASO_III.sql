create schema estudoCaso_3;

use estudoCaso_3;

#criando tabelas sem chave estrangeiras

create table if not exists clientes (
cod_cliente int primary key,
cnpj_cnt varchar(20) not null,
razaosocial_cnt text not null,
atividade_cnt text not null,
datacadastro_cnt date not null,
pessoacontato_cnt varchar(100) not null
);

alter table clientes add email varchar(50); 
alter table clientes change column email emailempresa varchar(50);
alter table clientes modify emailempresa varchar(100);
alter table clientes drop column emailempresa;


create table if not exists fornecedores (
cod_fornecedor int primary key,
cnpj_forn varchar(20) not null,
razaosocial_forn text not null,
pessoacontato_forn varchar(100) not null
);

alter table fornecedores add email varchar(50); 
alter table fornecedores change column email emailempresa varchar(50);
alter table fornecedores modify emailempresa varchar(100);
alter table fornecedores drop column emailempresa;


create table if not exists tipos_endereco (
cod_tipendereco int primary key,
nome_tip varchar(45) not null,
comercial_tip enum('sim', 'não') not null,
residencial_tip enum('sim', 'não') not null
);

alter table tipos_endereco add cep varchar(10); 
alter table tipos_endereco change column cep ceptipo varchar(10);
alter table tipos_endereco modify ceptipo varchar(20);
alter table tipos_endereco drop column ceptipo;


create table if not exists produtos (
cod_produto int primary key,
nome_prod varchar(100) not null,
cor_prod text not null,
dimensoes_prod varchar(20) not null,
peso_prod varchar(20) not null,
preco_prod decimal(10,3) not null,
desenho_prod blob not null,
tempfabric_prod time not null
);

alter table produtos add relevancia enum('Alta', 'Baixa'); 
alter table produtos change column relevancia tendencia enum('Alta','Média', 'Baixa');
alter table produtos modify tendencia enum('Alta','Média', 'Baixa');
alter table produtos drop column tendencia;


create table if not exists maquinas (
cod_maq int primary key,
tempvida_maq datetime not null,
dataaquis_maq date not null,
datagarantia_maq date
);

alter table maquinas add nome varchar(50); 
alter table maquinas change column nome marca varchar(50);
alter table maquinas modify marca varchar(100);
alter table maquinas drop column marca;


#criando entidades dependentes

create table if not exists cargo (
id_cargo int primary key,
descricao_car text not null
);

alter table cargo add nome varchar(50); 
alter table cargo change column nome nomecargo varchar(50);
alter table cargo modify nomecargo varchar(100);
alter table cargo drop column nomecargo;


create table if not exists funcao (
id_funcao int primary key,
descricao_func text not null
);

alter table funcao add nome varchar(50); 
alter table funcao change column nome nomefuncao varchar(50);
alter table funcao modify nomefuncao varchar(100);
alter table funcao drop column nomefuncao;


create table if not exists valor (
id_valor int primary key,
bruto_valor decimal(10,2) not null,
desconto_valor decimal(10,2) not null,
liquido_valor decimal(10,2) not null
);

alter table valor add moeda varchar(50); 
alter table valor change column moeda moedacomercial varchar(50);
alter table valor modify moedacomercial varchar(100);
alter table valor drop column moedacomercial;


create table if not exists tip_componente (
cod_tipcomponente int primary key,
nome_tipcomp varchar(100) not null
);

alter table tip_componente add dimensoes varchar(50); 
alter table tip_componente change column dimensoes tamanho varchar(50);
alter table tip_componente modify tamanho varchar(100);
alter table tip_componente drop column tamanho;

#criando tabelas fortes e com chave estrangeira

create table if not exists empregados (
matricula int primary key,
nome_emp varchar(100) not null,
cargo_emp varchar(100) not null,
salario_emp varchar(100) not null,
dataadimissao_emp date not null,
qualities_emp text not null,
emp_cargo int,
emp_funcao int,
constraint FK_emp_cargo foreign key(emp_cargo) references cargo(id_cargo),
constraint FK_emp_func foreign key(emp_funcao) references funcao(id_funcao)
);

alter table empregados add satisfacao enum('bom', 'ruim'); 
alter table empregados change column satisfacao empr_status enum('bom', 'ruim');
alter table empregados modify empr_status enum('saudavel', 'doente', 'triste');
alter table empregados drop column empr_status;


create table if not exists endereco (
cod_endereco int primary key,
estado_ender varchar(45) not null,
cidade_ender varchar(100) not null,
bairro_ender varchar(100) not null,
complemento_ender varchar(45) not null,
logradouro_ender varchar(45) not null,
numero_ender varchar(10),
tipendereco int,
fornecedor int,
empregado int,
cliente int,
constraint FK_end_tipo foreign key(tipendereco) references tipos_endereco(cod_tipendereco),
constraint FK_end_forn foreign key(fornecedor) references fornecedores(cod_fornecedor),
constraint FK_end_empr foreign key(empregado) references empregados(matricula),
constraint FK_end_clie foreign key(cliente) references clientes(cod_cliente)
);

alter table endereco add referencias varchar(50); 
alter table endereco change column referencias lojasproximas varchar(50);
alter table endereco modify lojasproximas varchar(100);
alter table endereco drop column lojasproximas;


create table if not exists encomendas (
cod_encomendas int primary key,
datainclusao_enc date not null,
cliente_enc int,
valor_enc int,
constraint FK_enc_clie foreign key(cliente_enc) references clientes(cod_cliente),
constraint FK_enc_valo foreign key(valor_enc) references valor(id_valor)
);

alter table encomendas add proguesso enum('a caminho', 'porto'); 
alter table encomendas change column proguesso enc_status enum('a caminho', 'porto');
alter table encomendas modify enc_status enum('a caminho','distribuidora', 'porto');
alter table encomendas drop column enc_status;


create table if not exists componentes (
cod_componentes int primary key,
nome_comp varchar(100) not null,
quantd_comp varchar(100),
precounid_comp decimal(10,2) not null,
unidade_comp varchar(100),
tipcomponente int not null,
constraint FK_tipcomp foreign key(tipcomponente) references tip_componente(cod_tipcomponente)
);

alter table componentes add dimensoes varchar(50); 
alter table componentes change column dimensoes desenhoindust varchar(50);
alter table componentes modify desenhoindust varchar(100);
alter table componentes drop column desenhoindust;


create table if not exists re (
cod_re int,
unidade_re decimal(10,3) not null,
temp_uso_re time not null,
horas_mao_obra_re time not null,
re_maq int,
re_produtos int,
re_compont int,
primary key(cod_re, re_maq, re_produtos, re_compont),
constraint FK_re_maq foreign key(re_maq) references maquinas(cod_maq),
constraint FK_re_produtos foreign key(re_produtos) references produtos(cod_produto)
);

alter table re add gastos decimal(10,2); 
alter table re change column gastos custosPorHora decimal(10,2);
alter table re modify custosPorHora decimal(8,2);
alter table re drop column custosPorHora;


create table if not exists rm (
cod_rm int,
data_rm date not null,
descricao_rm text not null,
rm_maq int,
primary key(cod_rm, rm_maq),
constraint FK_rm_maq foreign key(rm_maq) references maquinas(cod_maq)
);

alter table rm add rendimento decimal(2,0); 
alter table rm change column rendimento eficiencia decimal(2,0);
alter table rm modify eficiencia decimal(3,0);
alter table rm drop column eficiencia;


create table if not exists rs (
cod_rs int,
quantd_rs int not null,
datanescessidade_rs date not null,
rs_comp int,
rs_prod int,
primary key(cod_rs, rs_comp, rs_prod),
constraint FK_rs_comp foreign key(rs_comp) references componentes(cod_componentes),
constraint FK_rs_prod foreign key(rs_prod) references produtos(cod_produto)
);

alter table rs add qualidade decimal(2,0); 
alter table rs change column qualidade avalicao decimal(2,0);
alter table rs modify avalicao decimal(3,0);
alter table rs drop column avalicao;


create table if not exists pagamentos (
cod_pagamento int primary key,
parcelas_pag enum( '2', '3', '4', '5', '6' ,'7' ,'8' ,'9' ,'10', '11', '12'),
boleto_pag enum('sim', 'não'),
encomenda_pag int not null,
constraint FK_enc_pag foreign key(encomenda_pag) references encomendas(cod_encomendas)
);

alter table pagamentos add banco varchar(50); 
alter table pagamentos change column banco nomebanco varchar(50);
alter table pagamentos modify nomebanco varchar(100);
alter table pagamentos drop column nomebanco;


create table if not exists telefones (
id_telefone int primary key,
celular_tel varchar(20) not null,
telefonefixo_tel varchar(15) not null,
ddd_tel varchar(5) not null,
tel_cliente int not null,
tel_fornecedor int not null,
tel_empregado int not null,
constraint FK_tel_cliente foreign key(tel_cliente) references clientes(cod_cliente),
constraint FK_tel_fornecedor foreign key(tel_fornecedor) references fornecedores(cod_fornecedor),
constraint FK_tel_empregado foreign key(tel_empregado) references empregados(matricula)
);

alter table telefones add linguagem varchar(50); 
alter table telefones change column linguagem idiomaFalado varchar(50);
alter table telefones modify idiomaFalado varchar(100);
alter table telefones drop column idiomaFalado;


#criando entidades associativas

create table if not exists setor (
cafu_cargo int,
cafu_funcao int,
primary key(cafu_cargo, cafu_funcao),
constraint FK_cafu_cargo foreign key(cafu_cargo) references cargo(id_cargo),
constraint FK_cafu_funcao foreign key(cafu_funcao) references funcao(id_funcao)
);

alter table setor add descricao text not null; 
alter table setor change column descricao descricao_setor text not null;
alter table setor modify descricao_setor text not null;
alter table setor drop column descricao_setor;


create table if not exists forn_comp (
foco_componentes int,
foco_fornecedores int,
primary key(foco_componentes, foco_fornecedores),
constraint FK_foco_comp foreign key(foco_componentes) references componentes(cod_componentes),
constraint FK_foco_forn foreign key(foco_fornecedores) references fornecedores(cod_fornecedor)
);

alter table forn_comp add descricao text not null; 
alter table forn_comp change column descricao descricao_setor text not null;
alter table forn_comp modify descricao_setor text not null;
alter table forn_comp drop column descricao_setor;


create table if not exists prod_maq (
prma_produto int,
prma_maquina int,
primary key(prma_produto, prma_maquina),
constraint FK_prma_prod foreign key(prma_produto) references produtos(cod_produto),
constraint FK_prma_maqu foreign key(prma_maquina) references maquinas(cod_maq)
);

alter table prod_maq add registro text not null; 
alter table prod_maq change column registro historico text not null;
alter table prod_maq modify historico date;
alter table prod_maq drop column historico;


create table if not exists prod_enco (
pren_encomenda int,
pren_produto int,
primary key(pren_encomenda, pren_produto),
constraint FK_pren_enco foreign key(pren_encomenda) references encomendas(cod_encomendas),
constraint FK_pren_prod foreign key(pren_produto) references produtos(cod_produto)
);

alter table prod_enco add registro_pren text not null; 
alter table prod_enco change column registro_pren historico_pren text not null;
alter table prod_enco modify historico_pren date;
alter table prod_enco drop column historico_pren;


create table if not exists empr_prod (
empr_matricula int,
empr_produto int,
primary key(empr_matricula, empr_produto),
constraint FK_empr_matr foreign key(empr_matricula) references empregados(matricula),
constraint FK_empr_prod foreign key(empr_produto) references produtos(cod_produto)
);

alter table empr_prod add quant_emp varchar(2); 
alter table empr_prod change column quant_emp empregPorProd varchar(2);
alter table empr_prod modify empregPorProd varchar(4);
alter table empr_prod drop column empregPorProd;


create table if not exists creditos (
nome_cred varchar(100),
contatos_cred varchar(100),
avaliacao_cred decimal(2,0)
);

drop table creditos
