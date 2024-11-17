use estudoCaso_5;

#criando os inserts de clientes
insert into clientes(cod_client,
client_cpf,
client_nome,
client_dataNasci,
client_cidade,
client_estado,
client_bairro,
client_pais,
client_cep,
client_telefone,
client_email,
client_progFidelidade)
values
(1, '12345678901', 'João Silva', '1990-05-10', 'Vitória', 'Espírito Santo', 'Centro', 'Brasil', '29015010', '02799887766', 'joao.silva@email.com', 'Ativo'),
(2, '23456789012', 'Maria Oliveira', '1985-11-23', 'Cariacica', 'Espírito Santo', 'Jardim América', 'Brasil', '29020020', '02799776655', 'maria.oliveira@email.com', 'Pendente'),
(3, '34567890123', 'Carlos Souza', '1978-08-30', 'Vila Velha', 'Espírito Santo', 'Ponta da Fruta', 'Brasil', '29030030', '02799665544', 'carlos.souza@email.com', 'Ativo'),
(4, '45678901234', 'Ana Costa', '1995-02-15', 'Serra', 'Espírito Santo', 'Margarida', 'Brasil', '29040040', '02799554433', 'ana.costa@email.com', 'Ausente'),
(5, '56789012345', 'Pedro Alves', '2000-01-10', 'Vitória', 'Espírito Santo', 'Praia do Canto', 'Brasil', '29050050', '02799443322', 'pedro.alves@email.com', 'Ativo');

#fazendo updates
update clientes set client_cpf = '12354652512' where cod_client = 2;
update clientes set client_dataNasci = '2010-02-12' where cod_client = 5;
#apagando insert
delete from clientes where cod_client = 5;


#criando os inserts de fornecedores
insert into fornecedores(cnpj_fornec, 
fornec_nome, 
fornec_email, 
fornec_telefone, 
fornec_cidade, 
fornec_estado, 
fornec_cep, 
fornec_pais, 
fornec_numero)
values
(98374510298341, 'TechSupplies Ltda.', 'techsupplies@email.com', '01998765432', 'Campinas', 'SP', '13040000', 'Brasil', '350'),
(57263819047382, 'CompuTech Soluções', 'computech@email.com', '01199887766', 'São Paulo', 'SP', '01310100', 'Brasil', '450'),
(64392748503917, 'AccesStore', 'accesstore@email.com', '02196753210', 'Rio de Janeiro', 'RJ', '20040000', 'Brasil', '1200'),
(29174658028394, 'MobileParts', 'mobileparts@email.com', '03199775544', 'Belo Horizonte', 'MG', '30140000', 'Brasil', '300'),
(15830274965728, 'PC & Cell Suppliers', 'pccell@email.com', '04199887755', 'Curitiba', 'PR', '80020000', 'Brasil', '780');

#fazendo updates em fornecedores
update fornecedores set fornec_nome = 'CompuTech' where cnpj_fornec = 57263819047382;
update fornecedores set fornec_cidade = 'Ouro Preto' where cnpj_fornec = 29174658028394;
#apagando um inserts
delete from fornecedores where cnpj_fornec = 15830274965728;


#criando os inserts de produtos
insert into produtos(id_produtos, produtos_nome, produtos_preco, produtos_quantdEstoque, produtos_categoria, id_fornecedores)
values
(1, 'InovaPhone', 1500.00,'850','Smartphone',29174658028394),
(2, 'DeskTech',2400.00,'340','Desktop',57263819047382),
(3, 'Headset InTech',150.00,'400','Fone de Ouvido',64392748503917),
(4, 'Notebook Inova',3400.00,'200','Notebook Escritório',57263819047382),
(5, 'Airpods InTech',100.00,'200','Fone de Ouvido Bluetooth',98374510298341);

#fazendo updates em produtos
update produtos set produtos_categoria = 'Fone de Ouvido Bluetooth' where id_produtos = 3;
update produtos set produtos_quantdEstoque = '560' where id_produtos = 4;
#apagando um insert
delete from produtos where id_produtos = 5;


#criando os inserts de vendas
insert into vendas(id_vendas, vendas_data, vendas_desconto, vendas_valorLiquid, vendas_valorTotal, id_clientesVendas)
values
(1, '2024-02-10', 010.00, 1400.00, 1540.00,1),
(2, '2024-08-12', 000.00, 7200.00, 7200.00, 2),
(3, '2024-05-27', 015.00, 1800.00, 2160.00, 3),
(4, '2024-05-29', 000.00, 3400.00, 3400.00, 4),
(5, '2024-07-21', 012.00, 3100.00, 4340.00, 1);

#fazendo updates em produtos
update vendas set vendas_data = '2024-07-01' where id_vendas = 5;
update vendas set vendas_desconto = '01400' where id_vendas = 5;
#apagando um insert
delete from vendas where id_vendas = 1;


#criando os inserts de pagamentos
insert into pagamentos(cod_pagamento, pagamento_data, pagamento_valor, pagamento_status, pagamento_forma, id_vendasPag)
values
(1, '2024-02-10', 1400.00, 'Ok', 'Cartão de Crédito', 2),
(2, '2024-08-12', 1000.00, 'Processando', 'Boleto Bancário', 3),
(3, '2024-05-27', 2000.00, 'Ok', 'Transferência Bancária', 4),
(4, '2024-05-29', 6000.00, 'Ausente', 'Cartão de Crédito', 5),
(5, '2024-07-21', 650.25, 'Ok', 'Pix', 2);

#fazendo update na tabela
update pagamentos set pagamento_valor = 3100.00 where cod_pagamento = 5;
update pagamentos set pagamento_status = 'Ok' where cod_pagamento = 4;
#apagando um insert
delete from pagamentos where cod_pagamento = 5;


#criando os inserts de produtos_vendas
insert into produtos_vendas(prve_produtos, prve_vendas, prve_precoUnit, prve_quantidade)
values
(1,2,1500.00,1),
(2,2,2400.00,3),
(3,3,100.00,14),
(4,4,3400.00,1),
(3,5,150.00,20);
#fazendo updates
update produtos_vendas set prve_precoUnit = 150.00 where prve_produtos = 3 and prve_vendas = 3;
update produtos_vendas set prve_quantidade = 29 where prve_produtos = 3 and prve_vendas = 5;
#apagando um insert
delete from produtos_vendas where prve_produtos = 1 and prve_vendas = 2;



