USE estudoCaso_1;

/*
delete from fornecedores;
delete from filiais;
delete from produtos;
delete from pedidos;
delete from recebimentos;
 */

insert into fornecedores(cod_forn, nome_forn, rua_forn, numrua_forn, bairro_forn, cidade_forn, estado_forn, pais_forn, codpostal_forn,telefone_forn, contato_forn) values
(1, 'Carrefour', 'rua da lama','22','jardim da penha','vitoria','ES','brasil','290120145','27-999999999', 'contatocarrefour@gmail.com'),
(2, 'Pão de Açúcar', 'avenida central', '100', 'centro', 'vitoria', 'ES', 'brasil', '290130256', '27-988888888', 'contatopao@dacal.com'),
(3, 'Extra', 'rua das flores', '45', 'praia do Canto', 'vitoria', 'ES', 'brasil', '290160367', '27-977777777', 'contatoextra@dacal.com'),
(4, 'Lojas Americanas', 'rua do sol', '78', 'bela vista', 'vitoria', 'ES', 'brasil', '290140358', '27-966666666', 'contatolojas@dacal.com'),
(5, 'Bola Fashion', 'avenida principal', '155', 'jardim da glória', 'vitoria', 'ES', 'brasil', '290150467', '27-955555555', 'contatobolafashion@gmail.com');
update fornecedores set nome_forn = 'Vitória Bolos' where cod_forn = 2;
update fornecedores set rua_forn = 'rua sao jorge' where cod_forn = 4;
delete from fornecedores where cod_forn = 2;


insert into filiais(cod_filial, nome_filial, rua_filial, numrua_filial, bairro_filial, cidade_filial, estado_filial, pais_filial, codpostal_filial, capacidade_filial) values
(1, 'Alcobaça', 'Rua Três Morros', '23', 'Boa Vista', 'São Mateus', 'ES', 'Brasil','29105012','5000kg'),
(2, 'Vitória Transportes', 'Avenida Central', '45', 'Centro', 'Vitória', 'ES', 'Brasil', '29015012', '8000kg'),
(3, 'Expresso Norte', 'Rua das Palmeiras', '56', 'Praia do Canto', 'Linhares', 'ES', 'Brasil', '29120015', '12000kg'),
(4, 'Transporte Capixaba', 'Avenida do Sol', '89', 'Parque Moscoso', 'Serra', 'ES', 'Brasil', '29030018', '7500kg'),
(5, 'Logística Sudeste', 'Rua das Acácias', '34', 'Jardim Limoeiro', 'Cariacica', 'ES', 'Brasil', '29045022', '9500kg');
update filiais set nome_filial = 'Alcatel' where cod_filial = 4;
update filiais set capacidade_filial = '5600kg' where cod_filial = 1;
delete from filiais where cod_filial = 4;


insert into produtos(cod_prod, nome_prod, descricao_prod, espectec_prod, quant_prod, precounid_prod, unidmedida_prod, estoqMin_prod) values
(1, 'Computador', 'Computador Rápido', 'Intel Core 2 Duo', '817', '1400000', 'cm', '20'),
(2, 'Notebook', 'Flexibilidade', 'Intel i7', '1234', '3500000', 'kg', '15'),
(3, 'Smartphone', 'Celular dos seus sonhos', 'Exynos 2200', '5678', '2500000', 'cm', '30'),
(4, 'Monitor', 'Sinta a sincronização', 'LED 4K', '9101', '1200000', 'cm', '10'),
(5, 'Impressora', 'Somente Preto e Branco', 'LaserJet Pro', '1122', '800000', 'kg', '8');
update produtos set descricao_prod = 'Monitor com 120hz'  where cod_prod = 4;
update produtos set nome_prod = 'Telemóvel' where cod_prod = 3;
delete from produtos where cod_prod = 4;


insert into pedidos(cod_pedi, data_pedi, hora_pedi, previsao_pedi, status_pedi, fornec_pedi) values
(1, '2024-06-12', '20:38', '2024-06-21', 'pendente', 1),
(2, '2024-07-15', '09:45', '2024-07-20', 'a caminho', 3),
(3, '2024-08-05', '14:22', '2024-08-12', 'a caminho', 4),
(4, '2024-09-10', '18:30', '2024-09-18', 'a caminho', 5),
(5, '2024-10-01', '11:00', '2024-10-10', 'a caminho', 1);
update pedidos set status_pedi = 'concluído' where cod_pedi = 2;
update pedidos set hora_pedi = '12:12' where cod_pedi = 4;
delete from pedidos where cod_pedi = 2;


delete from recebimentos where pedidos_receb = 1;
delete from recebimentos where pedidos_receb = 3;
delete from recebimentos where pedidos_receb = 4;
delete from recebimentos where pedidos_receb = 5;

insert into recebimentos(data_receb, hora_receb, quantprod_receb, condicao_receb, pedidos_receb) values
('2024-06-20','16:40','5', 'aceito', 1);
delete from recebimentos where pedidos_receb = 1;
insert into recebimentos(data_receb, hora_receb, quantprod_receb, condicao_receb, pedidos_receb) values
('2024-07-21','08:00','2','aceito',3),
('2024-08-12','12:00','1','rejeitado',4),
('2024-09-18','14:23','3','rejeitado',5),
('2024-10-10','16:43','1','aceito',1);
update recebimentos set condicao_receb = 'aceito' where pedidos_receb = 4;
update recebimentos set quantprod_receb = '10' where pedidos_receb = 4;


insert into pedidos_produtos(pdpr_pedidos, pdpr_produtos, pdpr_quant) values
(1,1,'4'),
(1,3,'3'),
(3,2,'6'),
(4,5,'5'),
(5,1,'2');
update pedidos_produtos set pdpr_quant = '1' where pdpr_pedidos = 1 and pdpr_produtos = 1;
update pedidos_produtos set pdpr_quant = '20' where pdpr_pedidos = 1 and pdpr_produtos = 3;
delete from pedidos_produtos where pdpr_produtos = 1 and pdpr_pedidos = 1;


insert into filiais_produtos(flpr_filial, flpr_produto, flpr_quant) values
(1, 1, 500),
(2, 2, 700),
(3, 3, 820),
(2, 1, 190),
(5, 5, 210);
update filiais_produtos set flpr_quant = 85 where flpr_filial = 1 and flpr_produto = 1;
update filiais_produtos set flpr_quant = 346 where flpr_filial = 2 and flpr_produto = 1;
delete from filiais_produtos where flpr_produto = 3 and flpr_filial = 3;


insert into fornec_produtos(frpr_fornec, frpr_produto) values
(1,1),
(1,2),
(3,3),
(4,1),
(5,5);
update fornec_produtos set frpr_fornec = 4 where frpr_produto = 3 and frpr_fornec = 3;
update fornec_produtos set frpr_produto = 2 where frpr_produto = 3 and frpr_fornec = 3;
delete from fornec_produtos where frpr_fornec = 4 and frpr_produto = 2;