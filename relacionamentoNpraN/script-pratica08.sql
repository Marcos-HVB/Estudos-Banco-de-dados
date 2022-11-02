create database dbVenda;

use dbVenda;

create table tbCliente(
	idCliente int primary key auto_increment,
    nomeCliente varchar(45),
    emailCliente varchar(45),
    fkClienteIndicador int,
    constraint ClienteIndicador foreign key (fkClienteIndicador) references tbCliente(idCliente),
    constraint chkEmail CHECK (emailCliente like '%@%')
);

create table tbEndereco(
	idEndereco int primary key auto_increment,
    bairro varchar(45),
    cep char(9),
    cidade varchar(45)
);

create table tbEnderecoCompleto(
	fkEndereco int,
    fkCliente int,
    numero varchar(20),
    complemento varchar(45),
    foreign key (fkEndereco) references tbEndereco (idEndereco),
    foreign key (fkCliente) references tbCliente (idCliente),
    primary key(fkEndereco, fkCliente)
);

create table tbVenda(
	idVenda int auto_increment,
    valorTotal decimal(10,2),
    dataVenda datetime,
    fkCliente int,
    foreign key (fkCliente) references tbCliente (idCliente),
    primary key(idVenda, fkCliente) 
);

create table tbProduto(
	idProduto int primary key auto_increment,
    nomeProduto varchar(45),
    descProduto varchar(45),
    precoProduto decimal(10,2)
);

create table tbCarrinho(
	idCarrinho int,
    fkProduto int,
    fkVenda int,
    fkCliente int,
    qtdProduto int,
    descontoAplicado decimal(10,2),
    foreign key (fkProduto) references tbProduto (idProduto),
    foreign key (fkVenda, fkCliente) references tbVenda (idVenda, fkCliente),
    primary key (idCarrinho, fkProduto, fkVenda)
);


insert into tbCliente values 
	(null, 'José Roberto', 'joseroberto@hotmail.com', null),
    (null, 'Maria José', 'mariajose@hotmail.com', null);
    
insert into tbCliente values
	(null, 'Arnaldo', 'arnaldo@hotmail.com', 1),
    (null, 'Mario', 'mario@hotmail.com', 1),
    (null, 'Fernando', 'fernando@hotmail.com', 2),
    (null, 'Gabriel', 'gabriel@hotmail.com', 2);
    
insert into tbEndereco values
	(null, 'Jardim Campos', '08151-602', 'São Paulo'),
    (null, 'Jardim Nazaré', '08151-600', 'São Paulo'),
    (null, 'Jardim Bartira', '08151-601', 'São Paulo');
    
insert into tbEnderecoCompleto values
	( 1, 1, '111', 'Bloco D apt 11'),
    ( 2, 2, '221', ''),
    ( 3, 3, '331', 'Bloco A apt 22'),
    ( 1, 4, '441', ''),
    ( 2, 5, '551', 'Bloco F apt 32'),
    ( 3, 6, '661', '');
    
insert into tbVenda values 
	(null, 52.50, '2022-10-25 00:00:00', 1),
    (null, 40.00, '2022-09-25 00:00:00', 2),
    (null, 30.00, '2022-08-25 00:00:00', 3),
    (null, 20.00, '2022-07-25 00:00:00', 4),
    (null, 10.00, '2022-06-25 00:00:00', 5),
    (null, 5.25, '2022-05-25 00:00:00', 6);
    
insert into tbProduto values
	(null, 'Shampoo', 'Shampoo sem sal', 5.25),
    (null, 'Condicionador', 'Condicionador sem sal', 4),
    (null, 'Chinelo', 'Tamanho 40', 15),
    (null, 'Pano de prato', 'Seda', 10),
    (null, 'Papel toalha', '30x60', 5),
    (null, 'Livro', 'A bela e a feira', 5.25);
    
    
    
insert into tbCarrinho values
	(1, 1, 1, 1, 10, 0),
    (1, 2, 2, 2, 10, 0),
    (1, 3, 3, 3, 2, 0),
    (1, 4, 4, 4, 2, 0),
    (1, 5, 5, 5, 2, 0),
    (1, 6, 6, 6, 1, 0);
    
    
-- Mostrando todas as tabelas
select * from tbCliente;
select * from tbEndereco;
select * from tbEnderecoCompleto;
select * from tbVenda;
select * from tbProduto;
select * from tbCarrinho;


-- Exibir os dados dos clientes e os dados de suas respectivas vendas.
select * from tbCliente join tbVenda
	on idCliente = fkCliente;
    
-- Exibir os dados de um determinado cliente (informar o nome do cliente na consulta)
-- e os dados de suas respectivas vendas.
select * from tbCliente join tbVenda
	on idCliente = fkCliente
		where nomeCliente = 'Fernando';
        
-- Exibir os dados dos clientes e de suas respectivas indicações de clientes
select * from tbCliente as clienteIndicado join tbCliente as clienteIndicante
	on clienteIndicante.idCliente = clienteIndicado.fkClienteIndicador;
    
-- Exibir os dados dos clientes indicados e os dados dos respectivos clientes
-- indicadores, porém somente de um determinado cliente indicador (informar o nome
-- do cliente que indicou na consulta)
select * from tbCliente as clienteIndicado join tbCliente as clienteIndicante
	on clienteIndicante.idCliente = clienteIndicado.fkClienteIndicador
		where clienteIndicante.nomeCliente = 'José Roberto';
        
-- Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os
-- dados das respectivas vendas e dos produtos
select * from tbCliente as clienteIndicado join tbCliente as clienteIndicante
	on clienteIndicante.idCliente = clienteIndicado.fkClienteIndicador join tbVenda
		on clienteIndicado.idCliente = fkCliente join tbCarrinho
			on idVenda = fkVenda join tbProduto
				on idProduto = fkProduto;
                
-- Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda
select dataVenda, nomeProduto, qtdProduto from tbVenda join tbCarrinho
	on idVenda = fkVenda join tbProduto
		on idProduto = fkProduto;
        
-- Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de
-- produtos vendidos agrupados pelo nome do produto
select nomeProduto 'Nome', precoProduto 'Preço', sum(distinct qtdProduto) 'Quantidade vendido' from tbProduto join tbCarrinho
	on idProduto = fkProduto
		group by nomeProduto;
                
                
-- Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas
-- vendas, e os clientes que não realizaram nenhuma venda
insert into tbCliente values
	(null, 'Claudin', 'claudin@hotmail.com', 1);
    
select * from tbCliente as clienteIndicado join tbCliente as clienteIndicante
	on clienteIndicante.idCliente = clienteIndicado.fkClienteIndicador left join tbVenda
		on clienteIndicado.idCliente = fkCliente;
    

-- Exibir o valor mínimo e o valor máximo dos preços dos produtos
select precoProduto from tbProduto
	where precoProduto = (select min(precoProduto) from tbProduto) or precoProduto = (select max(precoProduto) from tbProduto);
    
--  Exibir a soma e a média dos preços dos produtos
select sum(precoProduto) from tbProduto
	union
select avg(precoProduto) from tbProduto;

-- Exibir a quantidade de preços acima da média entre todos os produtos
select count(precoProduto) from tbProduto
	where precoProduto > (select avg(precoProduto) from tbProduto);
    
--  Exibir a soma dos preços distintos dos produtos
select sum(distinct precoProduto) from tbProduto;

-- Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
select sum(precoProduto) 'Soma dos preços agrupados por vendas' from tbProduto join tbCarrinho
	on idProduto = fkProduto join tbVenda
		on idVenda = fkVenda
        group by idVenda;
    
