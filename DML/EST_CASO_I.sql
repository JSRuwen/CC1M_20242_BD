USE estudoCaso_1;

insert into fornecederos(cod_forn, nome_forn, rua_forn, numrua_forn, bairro_forn, cidade_forn, estado_forn, pais_forn, codpostal_forn,telefone_forn, contato_forn) values
(1, 'Carrefour', 'rua da lama','22','jardim da penha','vitoria','ES','brasil','290120145','27-999999999', 'contatocarrefour@gmail.com'),
(2, 'Pão de Açúcar', 'avenida central', '100', 'centro', 'vitoria', 'ES', 'brasil', '290130256', '27-988888888', 'contatopao@dacal.com'),
(3, 'Extra', 'rua das flores', '45', 'praia do Canto', 'vitoria', 'ES', 'brasil', '290160367', '27-977777777', 'contatoextra@dacal.com'),
(4, 'Lojas Americanas', 'rua do sol', '78', 'bairro bela vista', 'vitoria', 'ES', 'brasil', '290140358', '27-966666666', 'contatolojas@dacal.com'),
(5, 'Bola Fashion', 'avenida principal', '155', 'jardim da glória', 'vitoria', 'ES', 'brasil', '290150467', '27-955555555', 'contatobolafashion@gmail.com');
update fornecedores set nome_forn = 'Pão de Açúcar' where nome_forn = 'Vitória Bolos';
delete from fornecedores where nome_forn = 'Vitória Bolos';


insert into filiais(cod_filial, nome_filial, rua_filial, numrua_filial, bairro_filial, cidade_filial, estado_filial, pais_filial, codpostal_filial, capacidade_filial) values
(1, 'Alcobaça', 'Rua Três Morros', '23', 'Boa Vista', 'São Mateus', 'ES', 'Brasil','29105012','5000kg'),
(2, 'Vitória Transportes', 'Avenida Central', '45', 'Centro', 'Vitória', 'ES', 'Brasil', '29015012', '8000kg'),
(3, 'Expresso Norte', 'Rua das Palmeiras', '56', 'Praia do Canto', 'Linhares', 'ES', 'Brasil', '29120015', '12000kg'),
(4, 'Transporte Capixaba', 'Avenida do Sol', '89', 'Parque Moscoso', 'Serra', 'ES', 'Brasil', '29030018', '7500kg'),
(5, 'Logística Sudeste', 'Rua das Acácias', '34', 'Jardim Limoeiro', 'Cariacica', 'ES', 'Brasil', '29045022', '9500kg');
update filiais set nome_filial = 'Transporte Capixaba' where nome_filial = 'Alcatel';
delete from filiais where nome_filial = 'Alcatel';


insert into produtos(cod_prod, nome_prod, descricao_prod, espectec_prod, quant_prod, precounid_prod, unidmedida_prod, estoqMin_prod) values
(1, 'Computador', 'Computador Rápido', 'Intel Core 2 Duo', '817', 'R$:1400,00', 'cm', '20'),
(2, 'Notebook', 'Flexibilidade', 'Intel i7', '1234', 'R$:3500,00', 'kg', '15'),
(3, 'Smartphone', 'Celular dos seus sonhos', 'Exynos 2200', '5678', 'R$:2500,00', 'cm', '30'),
(4, 'Monitor', 'Sinta a sincronização', 'LED 4K', '9101', 'R$:1200,00', 'cm', '10'),
(5, 'Impressora', 'Somente Preto e Branco', 'LaserJet Pro', '1122', 'R$:800,00', 'kg', '8');
update produtos set descricao_prod = 'Monitor com 120hz'  where nome_prod = 'Monitor';
delete from produtos where nome_prod = 'Mabel';


insert into pedidos(cod_pedi, data_pedi, hora_pedi, previsao_ped, status_pedi, fornec_pedi) values
(1, '2024-06-12', '20:38', '2024-06-21', 'Na empresa', '23'),
(2, '2024-07-15', '09:45', '2024-07-20', 'A caminho', '30'),
(3, '2024-08-05', '14:22', '2024-08-12', 'No avião', '45'),
(4, '2024-09-10', '18:30', '2024-09-18', 'Correios', '50'),
(5, '2024-10-01', '11:00', '2024-10-10', 'Alfândega', '60');
update pedidos set status_pedi = 'Alfândega' where cod_pedi = 2;
delete from pedidos where cod_pedi = 2;


insert into recebimentos(data_receb, hora_receb, quantdprod_receb, condicao_receb, pedidos_receb) values
('2024-06-20','16:40','5', 'aceito', 1),
('2024-07-21','08:00','2','aceito',2),
('2024-08-12','12:00','1','rejeitado',3),
('2024-09-18','14:23','3','rejeitado',4),
('2024-10-10','16:43','1','aceito',5);
update recebimentos set condicao_receb = 'aceito' where pedidos_receb = 4;
delete from recebimentos where pedidos_receb = 4;


insert into pedidos_produtos(pdpr_pedidos, pdpr_produtos, pdpr_quant) values
(1,1,'4'),
(2,2,'3'),
(3,3,'6'),
(4,4,'5'),
(5,5,'2');
update pedidos_produtos set pdpr_quant = '1' where pdpr_pedidos = 1;
delete from pedidos_produtos where pdpr_produtos = 1;


insert into filiais_produtos(flpr_filial, flpr_produto, flpr_quant) values
(1, 1, 500),
(2, 2, 700),
(3, 3, 820),
(4, 4, 190),
(5, 5, 210);
update filiais_produtos set flpr_quant = 85 where flpr_filial = 1;
delete from filiais_produtos where flpr_produto = 1;


insert into fornec_produtos(frpr_fornec, frpr_produto) values
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);
update fornec_produtos set frpr_fornec = 71 where frpr_produto = 4;
delete from fornec_produtos where frpr_fornec = 71;