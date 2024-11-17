use estudoCaso_2;

#criando os inserts de passageiros
insert into passageiros(cpf_passag, nome_passag, telefone_passag, cidade_passag, estado_passag, bairro_passag, pais_passag, cep_passag, numrua_passag)
values
(12354643576,'roberto','011 99206541','sao paulo','SP','morumbi','Brasil','05606010','23'),
(98765432100, 'lucas', '011 98874321', 'sao paulo', 'SP', 'itaim bibi', 'Brasil', '04567010', '30'),
(32165498711, 'ana', '021 99567812', 'rio de janeiro', 'RJ', 'leblon', 'Brasil', '22430000', '28'),
(15975348622, 'mariana', '031 98124930', 'curitiba', 'PR', 'batel', 'Brasil', '80220020', '35'),
(45612378933, 'jose', '011 99442123', 'brasilia', 'DF', 'asa sul', 'Brasil', '70030900', '40');
#fazendo updates na tabela passageiros
update passageiros set nome_passag = 'maria' where cpf_passag = 15975348622;
update passageiros set numrua_passag = '345' where cpf_passag = 45612378933; 
#deletando um insert de acordo com o código
delete from passageiros where cpf_passag = 15975348622;


#criando os inserts de funcionarios
insert into funcionarios(cpf_func, nome_func, cargo_func, telefone_func, cidade_func, estado_func, bairro_func, pais_func, cep_func)
values
(23525678043, 'carlos','piloto','027 99346426','vitoria','ES','jardim da penha','Brasil','29235295'),
(14567892355, 'mariana', 'comissária de bordo', '021 98765432', 'sao paulo', 'SP', 'centro', 'Brasil', '01020304'),
(35487290111, 'roberto', 'piloto', '031 98732189', 'rio de janeiro', 'RJ', 'copacabana', 'Brasil', '22034012'),
(21345789277, 'daniela', 'controladora de tráfego aéreo', '019 98213456', 'campinas', 'SP', 'baixo cambui', 'Brasil', '13087654'),
(18964352166, 'pedro', 'engenheiro aeronáutico', '051 99987654', 'porto alegre', 'RS', 'moinhos de vento', 'Brasil', '90034567');
#fazendo updates na tabela funcionarios
update funcionarios set nome_func = 'agatha' where cpf_func = 35487290111;
update funcionarios set cargo_func = 'engenheira aeronáutico' where cpf_func = 21345789277;
#deletando um insert de acordo com o código
delete from funcionarios where cpf_func = 18964352166;


#fazendo updates na tabela aeroportos
insert into aeroportos(id_aeroport, nome_aeroport, cidade_aeroport, estado_aeroport, pais_aeroport, cep_aeroport)
values
(1, 'Aeroporto Internacional de Guarulhos', 'Guarulhos', 'SP', 'Brasil', '07020-001'),
(2, 'Aeroporto Internacional do Rio de Janeiro', 'Rio de Janeiro', 'RJ', 'Brasil', '21941-590'),
(3, 'Aeroporto de Congonhas', 'São Paulo', 'SP', 'Brasil', '04615-900'),
(4, 'Aeroporto Internacional de Brasília', 'Sobradinho', 'DF', 'Brasil', '46780-345'),
(5, 'Aeroporto Internacional de Salvador', 'Salvador', 'BA', 'Brasil', '41650-020');
#fazendo updates dos inserts de aeroportos
update aeroportos set cep_aeroport = '70360-900' where id_aeroport = 4;
update aeroportos set estado_aeroport = 'Brasília';
#deletando um insert de acordo com o código
delete from aeroportos where id_aeroport = 3;


#fazendo updates na tabela aeronaves
insert into aeronaves(id_aeron, modelo_aeron, capacidade_aeron)
values
(1, 'Airbus A300B1', '220'),
(2, 'Airbus A300B2', '280'),
(3, 'Airbus A300B4', '280'),
(4, 'Airbus A300-600', '345'),
(5, 'Airbus A319', '220');
#fazendo updates dos inserts de aeronaves
update aeronaves set capacidade_aeron = '247' where id_aeron = 1;
update aeronaves set modelo_aeron ='Airbus A320' where id_aeron = 5;
#deletando um insert de acordo com o código
delete from aeronaves where id_aeron = 2;


#fazendo updates na tabela voos
insert into voos(id_voos, horarioPartida_voos, horarioChegada_voos, idAeronave_voos, aeroportoOrigem_voos, aeroportoDestino_voos)
values
(1,'2024-06-12 10:00:00', '2024-06-12 12:00:00', 1, 2, 1),
(2,'2024-12-01 12:00:20', '2024-12-01 12:30:00', 3, 1, 4),
(3,'2024-08-04 20:00:00', '2024-08-04 22:00:00', 5, 4, 1),
(4,'2024-09-11 18:00:00', '2024-09-11 20:20:00', 4, 5, 2),
(5,'2024-07-15 09:00:00', '2024-07-15 12:30:00', 1, 1, 5);
#fazendo updates dos inserts de voos
update voos set aeroportoDestino_voos = 2 where id_voos = 3;
update voos set horarioChegada_voos = '2024-09-11 19:20:50' where id_voos = 4;
#deletando um insert de acordo com o código
delete from voos where id_voos = 4;


#criando os inserts de reservas
insert into reservas(id_reserv, dataReserva_reserv, idPassageiro_reserv, idVoo_reserv)
values
(1,'2024-06-12', 12354643576,1),
(2,'2024-12-01', 98765432100,2),
(3,'2024-08-04', 32165498711,3),
(4,'2024-09-11', 45612378933,5),
(5,'2024-07-15', 32165498711,1);
#fazendo updates nos inserts de reservas
update reservas set dataReserva_reserv = '2024-09-21' 
where idPassageiro_reserv = 45612378933 and idVoo_reserv = 5;
update reservas set idVoo_reserv = 2 
where idPassageiro_reserv = 32165498711 and idVoo_reserv = 1;
#apagando um insert 
delete from reservas where id_reserv = 5;


#criando os inserts de operações_voos
#corrigindo erro comitido na criacao da foreign key, pois o char estava limitado a 1
alter table operacoes_voo modify idFunc_operac char(11) not null;

insert into operacoes_voo(id_operacoes, funcao_operacoes, idVoo_operacoes, idFunc_operac)
values
(1, 'pilotar', 1,235256780),
(2, 'vigiar a rota de pássaros', 2,21345789277),
(3, 'servir os tripulantes', 3,14567892355),
(4, 'assistente do piloto', 1,35487290111),
(5, 'instruir as normas de viagens', 5,14567892355);
#fazendo updates nos inserts de operacoes_voo
update operacoes_voo set funcao_operacoes = 'pilotar' where id_operacoes = 4;
update operacoes_voo set idVoo_operacoes = 2 where id_operacoes = 3;
#apagando um insert
delete from operacoes_voo where id_operacoes = 1;

