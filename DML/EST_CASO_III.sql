use estudoCaso_3;

#criando os inserts clientes
insert into clientes(cod_cliente, cnpj_cnt,razaosocial_cnt,atividade_cnt,datacadastro_cnt,pessoacontato_cnt)
values
(1, '12.345.678/0001-90', 'TechSolutions Ltda.', 'Desenvolvimento de Software', '2024-01-15', 'João Silva'),
(2, '23.456.789/0001-23', 'CompuStore Comércio', 'Comércio de Eletrônicos', '2024-02-10', 'Maria'),
(3, '34.567.890/0001-34', 'AccesTech Acessórios', 'Venda de Acessórios de Tecnologia', '2024-03-05', 'Carlos'),
(4, '45.678.901/0001-45', 'MobileParts Indústria', 'Fabricação de Componentes Eletrônicos', '2024-04-20', 'Ana Costa'),
(5, '56.789.012/0001-56', 'Faber Tech', 'Distribuição de Computadores e Celulares', '2024-05-02', 'Pedro');

#fazendo updates
update clientes set razaosocial_cnt = 'Faber Castech' where cod_cliente = 5;
update clientes set atividade_cnt = 'Fabricação de Dispositivos Móveis' where cod_cliente = 5;
#apagando um insert
delete from clientes where cod_cliente = 5;


#criando os inserts de fornecedores
insert into fornecedores(cod_fornecedor, cnpj_forn, razaosocial_forn, pessoacontato_forn)
values
(1, '12.345.678/0001-90', 'GlobalTech Ltda.', 'Ricardo'),
(2, '23.456.789/0001-23', 'InfoMax Solutions', 'Fernanda'),
(3, '34.567.890/0001-34', 'TechWorld Comércio', 'Eduardo'),
(4, '45.678.901/0001-45', 'SmartGears Indústria', 'Juliana'),
(5, '56.789.012/0001-56', 'NextGen Supplies', 'Marcelo');

#criando os updates de fornecedores
update fornecedores set pessoacontato_forn = 'Mauricio' where cod_fornecedor = 3;
update fornecedores set cnpj_forn = '54.567.123/2903-21' where cod_fornecedor = 5;
#apagando um insert
delete from fornecedores where cod_fornecedor = 5;


#criando os inserts de tipos_endereco
insert into tipos_endereco(cod_tipendereco, nome_tip, comercial_tip, residencial_tip)
values
(1, 'Casa','não','sim'),
(2, 'Campo','sim','sim'),
(3, 'aeroporto','sim','não'),
(4, 'condominio','não','sim'),
(5, 'feira','sim','não');

#fazendo updates na tabelas
update tipos_endereco set nome_tip = 'sítio' where cod_tipendereco = 1;
update tipos_endereco set residencial_tip = 'não' where cod_tipendereco = 2;
#apagando um insert
delete from tipos_endereco where cod_tipendereco = 5;


#criando os inserts da tabela produtos
insert into produtos(cod_produto,
nome_prod,
cor_prod,
dimensoes_prod,
peso_prod ,
preco_prod ,
desenho_prod,
tempfabric_prod) values
(1, 'Celular', 'Preto', '15x7x0.8 cm', '0.180', 1200.500, 'Desenho A', '02:00:00'),
(2, 'Notebook', 'Prata', '35x25x2.5 cm', '1.800', 3200.750, 'Desenho B', '02:30:00'),
(3, 'Fone de Ouvido', 'Azul', '12x12x5 cm', '0.250', 300.990, 'Desenho C', '01:00:00'),
(4, 'Smartwatch', 'Preto', '4x4x1 cm', '0.050', 899.900, 'Desenho D', '00:30:00'),
(5, 'Tablet', 'Branco', '24x16x0.8 cm', '0.500', 1500.000, 'Desenho E', '05:00:00');

#fazendo updates na tabela
update produtos set preco_prod = 3100.00 where cod_produto = 2;
update produtos set dimensoes_prod = '13x13x5 cm' where cod_produto = 3;
#apagando um insert
delete from produtos where cod_produto = 5;


#criando os inserts da entidade maquinas
insert into maquinas(cod_maq, tempvida_maq, dataaquis_maq, datagarantia_maq) values
(1, '2025-01-01 00:00:00', '2024-03-15', '2025-03-15'),
(2, '2026-01-01 00:00:00', '2024-05-10', '2025-05-10'),
(3, '2024-06-01 00:00:00', '2024-04-20', '2025-04-20'),
(4, '2027-01-01 00:00:00', '2024-08-25', '2025-08-25'),
(5, '2025-05-01 00:00:00', '2024-09-10', '2025-09-10');

#fazendo updates na tabela
update maquinas set dataaquis_maq = '2024-06-15', datagarantia_maq = '2025-06-15' where cod_maq = 2;
update maquinas set tempvida_maq = '2028-01-01 00:00:00' where cod_maq = 4;
#apagando o insert
delete from maquinas where cod_maq = 5;


#># Criando Entidades Dependentes #<#
#criando os inserts da tabela cargo
insert into cargo(id_cargo, descricao_car) values
(1, 'gerente'),
(2, 'atuador'),
(3, 'fiscalizador'),
(4, 'atuador'),
(5, 'operario');

#fazendo updates
update cargo set descricao_car = 'adminstrativo' where id_cargo = 4;
update cargo set descricao_car = 'operário' where id_cargo = 5;
#apagando os inserts
delete from cargo where id_cargo = 5;


#criando os inserts da tabela funcao
insert into funcao(id_funcao, descricao_func) values
(1,'cuidar da gestão'),
(2,'apoiar as máquinas'),
(3,'observar trabalhadores'),
(4,'adminstrar a média de produção'),
(5,'cuidar da esteira');

#fazendo updates
update funcao set descricao_func = 'cuidar do fluxo de produção' where id_funcao = 4;
update funcao set descricao_func = 'cuidar do trabalho' where id_funcao = 5;
#apagando um insert
delete from funcao where id_funcao = 5;


#criando os inserts de valor
insert into valor(
id_valor,
bruto_valor,
desconto_valor,
liquido_valor
) values
(1, 1500.00, 200.00, 1300.00),
(2, 2500.00, 300.00, 2200.00),
(3, 1000.00, 100.00, 900.00),
(4, 4500.00, 500.00, 4000.00),
(5, 2000.00, 150.00, 1850.00);

#fazendo updates
update valor set bruto_valor = 2700.00, desconto_valor = 350.00, liquido_valor = 2350.00 where id_valor = 2;
update valor set bruto_valor = 4600.00, desconto_valor = 600.00, liquido_valor = 4000.00 where id_valor = 4;
#apagando um insert
delete from valor where id_valor = 5;


#criando os inserts tip_componente
insert into tip_componente(cod_tipcomponente, nome_tipcomp) values
(1, 'processaor'),
(2, 'placa-mãe'),
(3, 'disco rígido'),
(4, 'bateria'),
(5, 'usb c');

#fazendo updates
update tip_componente set nome_tipcomp = 'Memória' where cod_tipcomponente = 4;
update tip_componente set nome_tipcomp = 'fonte' where cod_tipcomponente = 5;
#apagando um insert
delete from tip_componente where cod_tipcomponente = 5;


#criando os inserts da tabela empregados
insert into empregados(
matricula,
nome_emp,
cargo_emp,
salario_emp,
dataadimissao_emp,
qualities_emp,
emp_cargo,
emp_funcao
) values
(1, 'João Silva', 'Gerente de TI', 'R$ 5000,00', '2022-06-15', 'Liderança, Comunicação, Proatividade', 1, 2),
(2, 'Maria Oliveira', 'Analista de Sistemas', 'R$ 4000,00', '2021-09-10', 'Análise, Atenção aos Detalhes, Trabalho em Equipe', 2, 3),
(3, 'Carlos Souza', 'Desenvolvedor Backend', 'R$ 3500,00', '2023-01-05', 'Programação, Resolução de Problemas, Foco', 3, 4),
(4, 'Ana Costa', 'Assistente Administrativo', 'R$ 2500,00', '2020-03-25', 'Organização, Comunicação, Proatividade', 4, 2),
(5, 'Pedro Alves', 'Coordenador de Projetos', 'R$ 6000,00', '2019-07-15', 'Gestão de Projetos, Comunicação, Liderança', 1, 2);

#fazendo updates
update empregados set salario_emp = 'R$ 4200,00' where matricula = 2;
update empregados set cargo_emp = 'Gerente de Projetos' where matricula = 5;
#apagando um insert
delete from empregados where matricula = 5;


#criando os inserts da tabela enderecos
insert into endereco (cod_endereco,
estado_ender,
cidade_ender,
bairro_ender,
complemento_ender,
logradouro_ender,
numero_ender,
tipendereco,
fornecedor,
empregado,
cliente
) values
(1, 'São Paulo', 'São Paulo', 'Centro', 'Apto 101', 'Av. Paulista', '1000', 1, null, null, null),
(2, 'Rio de Janeiro', 'Rio de Janeiro', 'Copacabana', 'Bloco A', 'Rua Barata Ribeiro', '150', null, 2, null, null),
(3, 'Minas Gerais', 'Belo Horizonte', 'Savassi', 'Andar 2', 'Rua dos Goitacazes', '250', null, null, null, 3),
(4, 'Bahia', 'Salvador', 'Barra', 'Casa 12', 'Avenida Oceânica', '320', 1, 4, null, null),
(5, 'Paraná', 'Curitiba', 'Centro', 'Sala 202', 'Rua XV de Novembro', '500', 2, null, null, null);

#fazendo updates na tabela
update endereco set complemento_ender = 'Sala 101', numero_ender = '300' where cod_endereco = 3;
update endereco set cidade_ender = 'Ilhéus', bairro_ender = 'Centro Histórico' where cod_endereco = 4;
#apagando um insert 
delete from endereco where cod_endereco = 5;


#criando os inserts da tabela encomendas
insert into encomendas(cod_encomendas, datainclusao_enc, cliente_enc, valor_enc)
values
(1, '2024-11-01', 1, 1),
(2, '2024-11-05', 2, 2),
(3, '2024-11-10', 3, 3),
(4, '2024-11-15', 4, 4),
(5, '2024-11-18', 1, 2);

#fazendo updates na tabela
update encomendas set valor_enc = 4 where cod_encomendas = 3;
update encomendas set datainclusao_enc = '2024-11-17' where cod_encomendas = 4;
#apagando um insert
delete from encomendas where cod_encomendas = 2;


#criando os inserts da entidade componentes
insert into componentes(cod_componentes,
nome_comp,
quantd_comp,
precounid_comp,
unidade_comp,
tipcomponente
) values
(1, 'Processador Intel i7', '20', 1500.00, 'unidade', 1),
(2, 'Placa de Vídeo NVIDIA GTX 1660', '15', 2000.00, 'unidade', 2),
(3, 'Memória RAM Corsair 16GB', '50', 350.00, 'unidade', 3),
(4, 'Disco Rígido Seagate 1TB', '30', 400.00, 'unidade', 4),
(5, 'Fonte Corsair 750W', '25', 500.00, 'unidade', 3);

#fazendo updates
update componentes set quantd_comp = '18', precounid_comp = 2100.00 where cod_componentes = 2;
update componentes set nome_comp = 'Memória RAM Kingston 16GB', quantd_comp = '60' where cod_componentes = 3;
#apagando um insert
delete from componentes where cod_componentes = 5;


#criando os inserts da tabela re
insert into re(
cod_re,
unidade_re,
temp_uso_re,
horas_mao_obra_re,
re_maq,
re_produtos,
re_compont
) values
(1, 100.500, '02:30:00', '04:15:00', 1, 1, 1),
(2, 250.750, '03:00:00', '05:00:00', 2, 2, 2),
(3, 150.000, '02:45:00', '03:30:00', 3, 3, 3),
(4, 320.100, '01:50:00', '04:00:00', 4, 4, 4),
(5, 200.200, '04:10:00', '02:50:00', 2, 4, 3);

#fazendo updates
update re set unidade_re = 170.500 where cod_re = 3;
update re set horas_mao_obra_re = '03:50:00' where cod_re = 4;
#apagando um insert
delete from re where cod_re = 5;


#criando os inserts da entidade rm
insert into rm(cod_rm,
data_rm,
descricao_rm,
rm_maq
) values
(1, '2024-11-01', 'Manutenção preventiva na máquina 101', 1),
(2, '2024-11-03', 'Troca de peças na máquina 102', 2),
(3, '2024-11-05', 'Ajuste de calibração na máquina 103', 3),
(4, '2024-11-07', 'Substituição de motor na máquina 104', 4),
(5, '2024-11-10', 'Limpeza e verificação geral da máquina 105', 4);

#fazendo updates
update rm set descricao_rm = 'Ajuste de calibração e verificação geral na máquina 103' where cod_rm = 3;
update rm set data_rm = '2024-11-08' where cod_rm = 4;
#apagando um insert
delete from rm where cod_rm = 5;


#criando os inserts do rs
insert into rs(
cod_rs,
quantd_rs,
datanescessidade_rs,
rs_comp,
rs_prod
) values
(1, 100, '2024-11-15', 1, 1),
(2, 200, '2024-11-20', 2, 2),
(3, 150, '2024-11-18', 3, 3),
(4, 120, '2024-11-22', 4, 4),
(5, 80, '2024-11-25', 4, 4);

#fazendo updates
update rs set quantd_rs = 180 where cod_rs = 3;
update rs set quantd_rs = 90 where cod_rs = 5;
#apagando um insert
delete from rs where cod_rs = 2;


#criando os inserts de pagamentos
insert into pagamentos(cod_pagamento, parcelas_pag, boleto_pag, encomenda_pag) 
values
(1, '3', 'sim', 1),
(2, '5', 'não', 5),
(3, '6', 'sim', 3),
(4, '12', 'não', 4),
(5, '10', 'sim', 1);

#fazendo updates
update pagamentos set parcelas_pag = '8' where cod_pagamento = 4;
update pagamentos set boleto_pag = 'não' where cod_pagamento = 3;
#apagamento um insert
delete from pagamentos where cod_pagamento = 5;


#criando os inserts de telefones
insert into telefones(
id_telefone,
celular_tel,
telefonefixo_tel,
ddd_tel,
tel_cliente,
tel_fornecedor,
tel_empregado
) values
(1, '11987654321', '1132345678', '11', 1, 1, 1),
(2, '21987654322', '2132345679', '21', 2, 2, 2),
(3, '31987654323', '3132345680', '31', 3, 3, 3),
(4, '41987654324', '4132345681', '41', 4, 4, 4),
(5, '51987654325', '5132345682', '51', 2, 3, 1);

#fazendo updates
update telefones set celular_tel = '31987654399', ddd_tel = '31' where id_telefone = 3;
update telefones set telefonefixo_tel = '5132345689', ddd_tel = '51' where id_telefone = 5;
#apagando um insert
delete from telefones where id_telefone = 5;


#criando os inserts de setor
insert into setor(
cafu_cargo,
cafu_funcao) values
(1,1),
(2,2),
(3,3),
(4,4),
(1,4);

#fazendo updates
update setor set cafu_cargo = 2 where cafu_cargo = 1 and cafu_funcao = 1;
update setor set cafu_funcao = 3 where cafu_cargo = 2 and cafu_funcao = 1;
#apagando um insert
delete from setor where cafu_cargo = 2 and cafu_funcao = 3;


#criando os inserts de forn_comp
insert into forn_comp(foco_componentes, foco_fornecedores) values
(1,1),
(2,2),
(3,3),
(4,4),
(3,1);

#fazendo updates
update forn_comp set foco_componentes = 2 where foco_componentes = 3 and foco_fornecedores = 1;
update forn_comp set foco_fornecedores = 4 where foco_componentes = 2 and foco_fornecedores = 1;
#apagando um insert
delete from forn_comp where foco_componentes = 2 and foco_fornecedores = 4;


#criando os inserts de prod_maq
insert into prod_maq(prma_maquina, prma_produto) values
(1,1),
(2,2),
(3,3),
(4,4),
(3,1);

#fazendo updates
update prod_maq set prma_maquina = 2 where prma_maquina = 3 and prma_produto = 1;
update prod_maq set prma_produto = 4 where prma_maquina = 2 and prma_produto = 1;
#apagando um insert
delete from prod_maq where prma_maquina = 2 and prma_produto = 4;


#criando os inserts de prod_enco
insert into prod_enco(pren_encomenda, pren_produto) values
(1,1),
(5,2),
(3,3),
(4,4),
(3,1);

#fazendo updates
update prod_enco set pren_encomenda = 5 where pren_encomenda = 3 and pren_produto = 1;
update prod_enco set pren_produto = 4 where pren_encomenda = 5 and pren_produto = 1;
#apagando um insert
delete from prod_enco where pren_encomenda = 5 and pren_produto = 4;


#criando os inserts de empr_prod
insert into empr_prod(empr_matricula, empr_produto) values
(1,1),
(2,2),
(3,3),
(4,4),
(3,1);

#fazendo updates
update empr_prod set empr_matricula = 2 where empr_matricula = 3 and empr_produto = 1;
update empr_prod set empr_produto = 4 where empr_matricula = 2 and empr_produto = 1;
#apagando um insert
delete from empr_prod where empr_matricula = 2 and empr_produto = 4;
