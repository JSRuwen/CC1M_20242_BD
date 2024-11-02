#drop schema estudoCaso_4;
create schema estudoCaso_4;

use estudoCaso_4;

#># CRIANDO TABELAS SEM CHAVES ESTRANGEIRAS #<#
create table if not exists endereco (
cod_ender int primary key,
ender_cep varchar(20) not null,
ender_cidade varchar(100) not null,
ender_estado varchar(100) not null,
ender_bairro varchar(100) not null,
ender_pais varchar(100) not null,
ender_rua varchar(100) not null,
ender_numrua varchar(10) not null
);
alter table endereco add ender_referencia varchar(10);
alter table endereco change column ender_referencia ender_proximidades varchar(10);
alter table endereco modify ender_proximidades varchar(45);
alter table endereco drop column ender_proximidades;


create table if not exists modalidades (
id_modalidade int primary key,
modal_nome varchar(100) not null,
modal_descricao text not null,
modal_duracao int not null,
modal_capacidade int not null
);
alter table modalidades add modal_metas varchar(100);
alter table modalidades change column modal_metas modal_competicao varchar(100);
alter table modalidades modify modal_competicao text;
alter table modalidades drop column modal_competicao;


#># CRIANDO TABEKAS COM CHAVE ESTRANGEIRA #<#
create table if not exists alunos (
cod_aluno int primary key,
aluno_nome varchar(100) not null,
aluno_cpf char(11) not null,
aluno_dataNasci date not null,
aluno_telefone varchar(20) not null,
aluno_email varchar(100) not null,
aluno_endereco int not null,
constraint FK_aluno_endereco foreign key(aluno_endereco) references endereco(cod_ender)
);
alter table alunos add dataConclusao int;
alter table alunos change column dataConclusao aluno_dataConclusao int;
alter table alunos modify aluno_dataConclusao date;
alter table alunos drop column aluno_dataConclusao;


create table if not exists instrutores (
cod_instr int primary key,
instr_nome varchar(100) not null,
instr_cpf char(11) not null,
instr_funcao varchar(100) not null,
instr_telefone varchar(20) not null,
instr_email varchar(100) not null,
instr_endereco int not null,
constraint FK_instr_endereco foreign key(instr_endereco) references endereco(cod_ender)
);
alter table instrutores add formacao varchar(50);
alter table instrutores change column formacao instr_formacao varchar(50);
alter table instrutores modify instr_formacao varchar(100);
alter table instrutores drop column instr_formacao;


create table if not exists aulas (
id_aulas int primary key,
aulas_hora time,
aulas_data date,
aulas_capacidade int not null,
aulas_modalidades int not null,
aulas_instrutores int not null,
constraint FK_aulas_modalidades foreign key(aulas_modalidades) references modalidades(id_modalidade),
constraint FK_aula_instrutores foreign key(aulas_instrutores) references instrutores(cod_instr)
);
alter table aulas add aulas_duracao int;
alter table aulas change column aulas_duracao aulas_cargaHoraria int;
alter table aulas modify aulas_cargaHoraria varchar(20);
alter table aulas drop column aulas_cargaHoraria;


create table if not exists planosTreinamento (
id_planos int primary key,
planos_descricao text not null,
planos_dataInicio date not null,
planos_dataFim date not null,
planos_aluno int not null,
planos_instrutores int not null,
constraint FK_planos_aluno foreign key(planos_aluno) references alunos(cod_aluno),
constraint FK_planos_instrutores foreign key(planos_instrutores) references instrutores(cod_instr)
);
alter table planosTreinamento add Metas varchar(20);
alter table planosTreinamento change column Metas planos_metas varchar(20);
alter table planosTreinamento modify planos_metas varchar(50);
alter table planosTreinamento drop column planos_metas;


create table if not exists pagamentos (
cod_pagamentos int primary key,
pagamento_data date not null,
pagamento_valor varchar(20) not null,
pagamento_status enum('pago','não pago','processando'),
pagamento_aluno int not null,
constraint FK_pagamento_aluno foreign key(pagamento_aluno) references alunos(cod_aluno)
);

alter table pagamentos add metodo enum('pix');
alter table pagamentos change column metodo pagamento_metodo enum('pix');
alter table pagamentos modify pagamento_metodo enum('pix', 'boleto');
alter table pagamentos drop column pagamento_metodo;


#># CRIANDO TABELAS ASSOCIATIVAS #<#
create table if not exists alunos_aulas (
idAluno int not null,
idAula int not null,
primary key(idAluno, idAula),
constraint FK_idAluno foreign key(idAluno) references alunos(cod_aluno),
constraint FK_idAula foreign key(idAula) references aulas(id_aulas)
);

alter table alunos_aulas add chamada varchar(100);
alter table alunos_aulas change column chamada alau_chamada varchar(100);
alter table alunos_aulas modify alau_chamada text;
alter table alunos_aulas drop column alau_chamada;


create table if not exists aluno_modalidades (
almo_aluno int not null,
almo_modalidades int not null,
primary key(almo_aluno, almo_modalidades),
constraint FK_almo_aluno foreign key(almo_aluno) references alunos(cod_aluno),
constraint FK_almo_modalidades foreign key(almo_modalidades) references modalidades(id_modalidade)
);

alter table aluno_modalidades add quantidade varchar(100);
alter table aluno_modalidades change column quantidade quantd_alunopormodal varchar(100);
alter table aluno_modalidades modify quantd_alunopormodal int;
alter table aluno_modalidades drop column quantd_alunopormodal;

#criando uma tabela adicional
create table if not exists telefone (
id_telefone int primary key,
ddd_tel int not null,
celular_tel varchar(15) not null
);

drop table telefone
