CREATE SCHEMA EXERCICIO1;
USE EXERCICIO1;

CREATE TABLE IF NOT EXISTS PARTICIPANTES(
NUM_INSCRICAO INT,
CPF VARCHAR(14),
PRIMARY KEY(NUM_INSCRICAO,CPF),
NOME VARCHAR(100) NOT NULL,
DATA_NASC DATE NOT NULL,
EMPRESA VARCHAR(100)
);

ALTER TABLE PARTICIPANTES ADD EMAIL VARCHAR(20);
ALTER TABLE PARTICIPANTES DROP COLUMN EMAIL;

insert into participantes (num_inscricao, cpf, nome) values
(1, '68100906654', 'João'),
(2, '52723748021', 'Claudio'),
(3, '25926972184', 'Flavia');

update participantes set nome = 'Pedro' where nome = 'Claudio';

delete from participantes where nome = 'Pedro';

CREATE TABLE IF NOT EXISTS LOCAIS(
ID_LOCAL INT PRIMARY KEY,
NOME_LOCAL VARCHAR(100) NOT NULL,
LOG_LOCAL VARCHAR(100) NOT NULL,
NUMLOG_LOCAL INT,
BAIRRO_LOCAL VARCHAR(100) NOT NULL,
CIDADE VARCHAR(100) NOT NULL,
UF CHAR(2) NOT NULL,
CEP VARCHAR(20) NOT NULL,
CAPACIDADE INT NOT NULL);

insert into locais (id_local, cep, nome_local) values
(1, '76493331', 'Jardim da Penha'),
(2, '42168044', 'Ronaldo Bolos'),
(3, '63580515', 'Bruno Informática');

update locais set nome_local = 'Jardim da Penha' where nome_local = 'Pedro Botânicas';

delete from locais where nome_local = 'Pedro Botânicas';

CREATE TABLE IF NOT EXISTS EVENTOS(
ID_EVENTO INT PRIMARY KEY,
NOME_EVENTO VARCHAR(100) NOT NULL,
DATA_EVENTO DATE NOT NULL,
ENTIDADE_EVENTO VARCHAR(100) NOT NULL,
LOCAL_EVENTO INT,
FOREIGN KEY (LOCAL_EVENTO) REFERENCES LOCAIS(ID_LOCAL));

insert into eventos (id_evento, data_evento, nome_evento) values
(1, '2024-11-01', 'Rodízio de Pizza'),
(2, '2024-11-15', 'Café Dev'),
(3, '2024-11-25', 'Palestra');

update eventos set nome_evento = 'Palestra Power BI' where nome_local = 'Palestra';

delete from eventos where nome_evento = 'Palestra Power BI';

CREATE TABLE IF NOT EXISTS ATIVIDADES(
ID_ATIVIDADE INT PRIMARY KEY,
NOME_ATV VARCHAR(100) NOT NULL,
DATA_ATV DATE NOT NULL,
HORA_ATV TIME NOT NULL,
EVENTO_ATV INT NOT NULL,
FOREIGN KEY(EVENTO_ATV) REFERENCES EVENTOS(ID_EVENTO));

insert into atividades (id_atividade, data_atv, nome_atv) values
(1, '2024-11-01', 'Avaliação Rodízio'),
(2, '2024-11-15', 'Relatório do Café Dev'),
(3, '2024-11-25', 'Relatório da Palestra');

update atividades set nome_atv = 'Relatório da Palestra' where nome_local = 'Relatório da Palestra de Power BI';

delete from atividades where nome_atv = 'Palestra Power BI';

CREATE TABLE IF NOT EXISTS PARTICIPANTE_EVENTO(
PE_INSCRICAO INT,
PE_CPF VARCHAR(14),
PE_EVENTO INT,
PRIMARY KEY(PE_INSCRICAO,PE_CPF,PE_EVENTO),
FOREIGN KEY(PE_INSCRICAO,PE_CPF) REFERENCES PARTICIPANTES(NUM_INSCRICAO,CPF),
FOREIGN KEY(PE_EVENTO) REFERENCES EVENTOS(ID_EVENTO));

CREATE TABLE IF NOT EXISTS PARTICIPANTE_ATIVIDADE(
PA_INSCRICAO INT,
PA_CPF VARCHAR(14),
PA_ATIVIDADE INT,
PRIMARY KEY(PA_INSCRICAO,PA_CPF,PA_ATIVIDADE),
FOREIGN KEY(PA_INSCRICAO,PA_CPF) REFERENCES PARTICIPANTES(NUM_INSCRICAO,CPF),
FOREIGN KEY(PA_ATIVIDADE) REFERENCES ATIVIDADES(ID_ATIVIDADE));
