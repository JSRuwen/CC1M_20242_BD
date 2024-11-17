use estudoCaso_4;

#criando inserts na tabela endereco
insert into endereco(cod_ender, ender_cep, ender_bairro, ender_cidade,ender_pais,ender_estado,ender_rua,ender_numrua) 
values
(1, '290150158', 'Jardim camburi', 'vitoria','brasil','es','princesa isabel','20'),
(2, '290160159', 'parque industrial', 'vitoria', 'brasil', 'es', 'pedro jorge', '45'),
(3, '290170160', 'maria das gracas', 'vitoria', 'brasil', 'es', 'floriano peixoto', '30'),
(4, '290180161', 'ilhota', 'vitoria', 'brasil', 'es', 'geraldo mota', '10'),
(5, '290190162', 'bairro das flores', 'vitoria', 'brasil', 'es', 'rua das palmeiras', '80'),
(6, '290200163', 'parque industrial', 'vitoria', 'brasil', 'es', 'rua das acacias', '25'),
(7, '290210164', 'jardim da penha', 'vitoria', 'brasil', 'es', 'rua das orquideas', '50'),
(8, '290220165', 'morada do sol', 'vitoria', 'brasil', 'es', 'avenida brasil', '120'),
(9, '290230166', 'pedro nogueira', 'vitoria', 'brasil', 'es', 'rua joao lira', '10'),
(0, '290240167', 'vila rubim', 'vitoria', 'brasil', 'es', 'rua do comércio', '75');

#fazendo updates nos inserts de endereco
update endereco set ender_bairro = 'centro' where cod_ender = 1;
update endereco set ender_numrua = 23 where cod_ender = 2;
#apagando um insert 
delete from endereco where cod_ender = 2;


#criando os inserts de modalidades
insert into modalidades(id_modalidade, modal_nome, modal_descricao, modal_duracao, modal_capacidade)
values
(1, 'Inglês', 'inglês americano', 80, 60),
(2, 'Italiano', 'variação do catalão', 80, 50),
(3, 'Françês', 'françês formal', 80, 40),
(4, 'Chinês Tradicional', 'Mandarim', 80, 43),
(5, 'Alemão', 'alemão tradicional', 80, 25);

#fazendo updates nos inserts de modalidades
update modalidades set modal_capacidade = 20 where id_modalidade = 4;
update modalidades set modal_duracao = 120 where id_modalidade = 5;
#apagando um insert
delete from modalidades where id_modalidade = 5;


#criando os inserts de alunos
insert into alunos(cod_aluno, aluno_cpf, aluno_nome, aluno_dataNasci, aluno_telefone, aluno_email, aluno_endereco)
values
(1, 45145635754, 'Pablo', '2010-08-01', '027998322567', 'pabloemail@email.com', 1),
(2, 45145635755, 'Maria', '1992-03-12', '027998322568', 'maria@email.com', 3),
(3, 45145635756, 'João', '1985-06-20', '027998322569', 'joao@email.com', 3),
(4, 45145635757, 'Ana', '1995-11-15', '027998322570', 'ana@email.com', 4),
(5, 45145635758, 'Carlos', '1988-02-28', '027998322571', 'carlos@email.com', 5);

#fazendo updates
update alunos set aluno_endereco = 3 where cod_aluno = 4;
update alunos set aluno_nome = 'Anna' where cod_aluno = 4;
#apagando um insert
delete from alunos where cod_aluno = 2;


#criando os inserts de instrutores
insert into instrutores(cod_instr, instr_cpf, instr_nome, instr_funcao, instr_telefone, instr_email,instr_endereco)
values
(1, 14359390455, 'Cleber','Professor de Inglês','02799821838', 'cleber@email.com',6),
(2, 12378847732, 'Lourdes','Professora de Italiano','02791238945','lourdes@email.com',7),
(3, 12384609562, 'Pedro','Professor de Inglês','02791019212','pedro@email.com',8),
(4, 12893456712, 'Alexandro','Professor de Chinês','02799178232','alexandro@email.com',9),
(5, 12378433212, 'Mariana','Professora de Alemão','02799123576','mariana@email.com',0);

#fazendo updates
update instrutores set instr_funcao = 'Professor de Francês' where cod_instr = 3;
update instrutores set instr_email = 'gutenmorgen@email.com' where cod_instr = 5;
#apagando inserts
delete from instrutores where cod_instr = 5;


#criando os inserts da tabela aulas
insert into aulas(id_aulas, aulas_data, aulas_hora, aulas_capacidade, aulas_modalidades, aulas_instrutores)
values
(1, '2024-08-12','10:00', 45, 1, 1),
(2, '2024-08-12','11:00', 50, 2, 2),
(3, '2024-08-12','08:00', 40, 3, 3),
(4, '2024-08-12','07:00', 35, 4, 4),
(5, '2024-08-12','09:00', 50, 3, 2);

#fazendo updates
update aulas set aulas_data='2024-09-12' where id_aulas = 3;
update aulas set aulas_instrutores = 3 where id_aulas = 5;
#apagando um insert
delete from aulas where id_aulas = 5;


#criando os inserts da tabela planosTreinamento
insert into planosTreinamento(id_planos, planos_descricao, planos_dataInicio,planos_dataFim, planos_aluno, planos_instrutores)
values 
(1, 'Intensivão Inglês', '2024-05-12', '2026-05-20',1,1),
(2, 'Intensivão Mandarim', '2024-05-12', '2026-05-20',1,4),
(3, 'Intensivão Françês', '2024-05-12', '2026-05-20',3,3),
(4, 'Intensivão Espanhol', '2024-05-12', '2026-05-20',5,4),
(5, 'Intensivão Alemão', '2024-05-12', '2026-05-20', 4,2);
#fazendo updates
update planosTreinamento set planos_descricao = 'Intensivão Mandarim' where id_planos = '4';
update planosTreinamento set planos_dataInicio = '2023-11-23' where id_planos = '3';
#apagando inserts
delete from planosTreinamento where id_planos = 5;


#criando os inserts da tabela pagamentos
insert into pagamentos(cod_pagamentos, pagamento_data, pagamento_valor, pagamento_status, pagamento_aluno)
values
(1, '2024-10-01', '500.00', 'pago', 1),
(2, '2024-10-05', '350.00', 'não pago', 5),
(3, '2024-10-10', '450.00', 'processando', 3),
(4, '2024-10-12', '600.00', 'pago', 4),
(5, '2024-10-15', '200.00', 'não pago', 5);
#fazendo updates
update pagamentos set pagamento_data = '2024-10-13' where cod_pagamentos = 4;
update pagamentos set pagamento_status = 'não pago' where cod_pagamentos = 3;
#apagando inserts
delete from pagamentos where cod_pagamentos = 2;


#criando os inserts da tabela alunos_aulas
insert into alunos_aulas(idAluno, idAula) values
(1,2),
(1,3),
(3,4),
(4,2),
(5,1);
#fazendo updates
update alunos_aulas set idAluno = 4 where idAluno = 1 and idAula = 3;
update alunos_aulas set idAula = 1 where idAluno = 4 and idAula = 3;
#apagando inserts
delete from alunos_aulas where idAluno = 4 and idAula = 1;


#criando os inserts da tabela aluno_modalidades
insert into aluno_modalidades(almo_aluno, almo_modalidades) values
(1,2),
(3,1),
(4,3),
(5,1),
(4,2);
#fazendo updates
update aluno_modalidades set almo_aluno = 3 where almo_aluno = 4 and almo_modalidades = 3;
update aluno_modalidades set almo_modalidades = 4 where almo_aluno=3 and almo_modalidades = 3;
#apagando inserts
delete from aluno_modalidades where almo_aluno = 3 and almo_modalidades = 4;


