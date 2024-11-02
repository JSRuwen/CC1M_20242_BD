create schema estudoCaso_2;

use estudoCaso_2;

#># CRIANDO TABELAS SEM CHAVE ESTRANGEIRA #<#
create table if not exists passageiros (
cpf_passag char(11) primary key,
nome_passag varchar(100) not null,
telefone_passag varchar(15) not null,
cidade_passag varchar(100) not null,
estado_passag varchar(100) not null,
bairro_passag varchar(100) not null,
pais_passag varchar(100) not null,
cep_passag varchar(20) not null,
numrua_passag varchar(10)
);

alter table passageiros add idade_pass datetime;
alter table passageiros change idade_pass aniversario_pass datetime;
alter table passageiros modify aniversario_pass date;
alter table passageiros drop column aniversario_pass;


create table if not exists funcionarios (
cpf_func char(11) primary key,
nome_func varchar(100) not null,
cargo_func varchar(45) not null,
telefone_func varchar(15) not null,
cidade_func varchar(100) not null,
estado_func varchar(100) not null,
bairro_func varchar(100) not null,
pais_func varchar(100) not null,
cep_func varchar(20) not null
);

alter table funcionarios add status_func enum('Bem','Ruim');
alter table funcionarios change status_func saude_func enum('Bem','Ruim');
alter table funcionarios modify saude_func enum('Bem', 'Moderado', 'Ruim');
alter table funcionarios drop column saude_func;


create table if not exists aeroportos (
id_aeroport int primary key,
nome_aeroport varchar(100) not null,
cidade_aeroport varchar(100) not null,
estado_aeroport varchar(100) not null,
pais_aeroport varchar(100) not null,
cep_aeroport varchar(20) not null
);

alter table aeroportos add tempo_aeroporto text;
alter table aeroportos change tempo_aeroporto tempohoje_aeroporto text;
alter table aeroportos modify tempohoje_aeroporto varchar(50);
alter table aeroportos drop column tempohoje_aeroporto;


create table if not exists aeronaves (
id_aeron int primary key,
modelo_aeron varchar(45) not null,
capacidade_aeron int not null
);

alter table aeronaves add durabilidade_aeron varchar(45);
alter table aeronaves change durabilidade_aeron tempUso_aeron varchar(45);
alter table aeronaves modify tempUso_aeron datetime;
alter table aeronaves drop column tempUso_aeron;


#># CRIANDO TABELAS COM CHAVES ESTRANGEIRAS #<#
create table if not exists voos (
id_voos int primary key,
horarioPartida_voos datetime not null,
horarioChegada_voos datetime not null,
idAeronave_voos int not null,
aeroportoOrigem_voos int not null,
aeroportoDestino_voos int not null,
constraint FK_aeroportoOrigem_voos foreign key (aeroportoOrigem_voos) references aeroportos(id_aeroport),
constraint FK_aeroportoDestino_voos foreign key (aeroportoDestino_voos) references aeroportos(id_aeroport),
constraint FK_idAeronave_voos foreign key (idAeronave_voos) references aeronaves(id_aeron)
);

alter table voos add kmPercorridos_voos datetime;
alter table voos change kmPercorridos_voos velocidadeKm_voos datetime;
alter table voos modify velocidadeKm_voos decimal(6,2);
alter table voos drop column velocidadeKm_voos;


create table if not exists reservas (
id_reserv int primary key,
dataReserva_reserv datetime not null,
idPassageiro_reserv char(11) not null,
idVoo_reserv int not null,
constraint FK_idPassageiro_reserv foreign key(idPassageiro_reserv) references passageiros(cpf_passag),
constraint FK_idVoo_reserv foreign key(idVoo_reserv) references voos(id_voos)
);

alter table reservas add comprovante_reserv varchar(150);
alter table reservas change comprovante_reserv recibo_reserv varchar(150);
alter table reservas modify recibo_reserv text;
alter table reservas drop column recibo_reserv;


create table if not exists operacoes_voo (
id_operacoes int primary key,
funcao_operacoes varchar(45) not null,
idVoo_operacoes int not null,
idFunc_operac char not null,
constraint FK_idVoo_operacoes foreign key(idVoo_operacoes) references voos(id_voos),
constraint FK_idFunc_operac foreign key(idFunc_operac) references funcionarios(cpf_func)
);

alter table operacoes_voo add lingua_operacao text;
alter table operacoes_voo change lingua_operacao idioma_operacao text;
alter table operacoes_voo modify idioma_operacao varchar(50);
alter table operacoes_voo drop column idioma_operacao;

#># Tabela adicional #<#
create table if not exists tempo (
id_tempo int primary key,
tempohoje_clima varchar(45) not null,
climaRegiao_clima varchar(45) not null
);

drop table tempo

