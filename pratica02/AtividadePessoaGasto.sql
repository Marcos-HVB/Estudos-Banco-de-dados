create database faculdade1adsc;

use faculdade1adsc;

create table pessoa(
	idPessoa int primary key auto_increment,
    nome varchar(45),
    dataNasc date,
    profissao varchar(25)
);


create table gasto(
	idGasto int primary key auto_increment,
    dataGasto date,
    valor decimal(7,2),
    descricao varchar(50),
    fkPessoa int,
    foreign key (fkPessoa) references pessoa(idPessoa)
);

-- Insira dados nas tabelas

insert into pessoa( nome, dataNasc, profissao) values
	('Roberto', '2000-06-25', 'Arquiteto'),
    ('Claudia', '1986-04-03', 'Arquiteto'),
    ('Fiorino', '2003-06-09', 'Programador'),
    ('João', '1999-08-30', 'Caixa de Supermercado'),
    ('Flavia', '2005-09-17', 'Engenheiro');
    
insert into gasto(dataGasto, valor, descricao, fkPessoa) values
	('2022-09-18', 12345.67, 'Compra de leite', 1),
    ('2000-05-16', 123.67, 'Compra de feijão', 1),
    ('1999-06-18', 12366.67, 'Compra de arroz', 2),
    ('1998-05-17', 12344.65, 'Compra de pão', 3),
    ('1997-04-16', 12333.67, 'Compra de morango', 4),
    ('2019-08-19', 12378.63, 'Compra de manga', 5);
    
-- Exiba os dados de cada tabela individualmente
select * from pessoa;
select * from gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc)
select * from pessoa
	where profissao = 'Engenheiro';
    
select * from gasto 
	where descricao like '%leite%';
    
-- Exiba os dados das pessoas e dos seus gastos correspondentes
select * from pessoa join gasto
	on idPessoa = fkPessoa;
    
-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes
select * from pessoa join gasto
	on idPessoa = fkPessoa
		where idPessoa = 1;
        
-- Atualize valores já inseridos na tabela
update pessoa set profissao = 'Matemático'
	where idPessoa = 1;
    
select * from pessoa;

-- Exclua um ou mais registros de alguma tabela
delete from gasto
	where idGasto in (4, 5);
    
    


